#include "MacWindow.h"
#import <AppKit/AppKit.h>
#import <QuartzCore/CAMetalLayer.h>
#include <algorithm>
#include <array>
#include <cmath>
#include <exception>
#include <stdexcept>
#include <utility>

#if !__has_feature(objc_arc)
#error Compile the Cocoa platform sources with -fobjc-arc
#endif

namespace {
void RequireMainThread()
{
    if (![NSThread isMainThread])
        throw std::logic_error("AppKit window operations require the main thread");
}

NSCursor* DrawnCursor(Sexy::MacCursor cursor)
{
    NSImage* image = [NSImage imageWithSize:NSMakeSize(32, 32) flipped:NO
        drawingHandler:^BOOL(NSRect rect) {
            (void)rect;
            NSBezierPath* path = [NSBezierPath bezierPath];
            if (cursor == Sexy::MacCursor::Wait) {
                [path moveToPoint:NSMakePoint(9, 25)];
                [path lineToPoint:NSMakePoint(23, 25)];
                [path lineToPoint:NSMakePoint(23, 22)];
                [path lineToPoint:NSMakePoint(17, 16)];
                [path lineToPoint:NSMakePoint(23, 10)];
                [path lineToPoint:NSMakePoint(23, 7)];
                [path lineToPoint:NSMakePoint(9, 7)];
                [path lineToPoint:NSMakePoint(9, 10)];
                [path lineToPoint:NSMakePoint(15, 16)];
                [path lineToPoint:NSMakePoint(9, 22)];
                [path closePath];
            } else {
                const bool ne = cursor == Sexy::MacCursor::ResizeNorthEast;
                const NSPoint start = NSMakePoint(7, ne ? 7 : 25);
                const NSPoint end = NSMakePoint(25, ne ? 25 : 7);
                [path moveToPoint:start]; [path lineToPoint:end];
                [path moveToPoint:NSMakePoint(7, ne ? 14 : 18)];
                [path lineToPoint:start];
                [path lineToPoint:NSMakePoint(14, ne ? 7 : 25)];
                [path moveToPoint:NSMakePoint(18, ne ? 25 : 7)];
                [path lineToPoint:end];
                [path lineToPoint:NSMakePoint(25, ne ? 18 : 14)];
            }
            path.lineJoinStyle = NSRoundLineJoinStyle;
            path.lineCapStyle = NSRoundLineCapStyle;
            [NSColor.whiteColor setStroke];
            path.lineWidth = 4;
            [path stroke];
            [NSColor.blackColor setStroke];
            path.lineWidth = 2;
            [path stroke];
            return YES;
        }];
    return [[NSCursor alloc] initWithImage:image hotSpot:NSMakePoint(16, 16)];
}

unsigned GameKey(unsigned short code)
{
    // Apple virtual key positions; text is delivered separately by the input context.
    static constexpr std::array<unsigned, 128> keys = [] {
        std::array<unsigned, 128> k{};
        k[0]= 'A'; k[1]= 'S'; k[2]= 'D'; k[3]= 'F'; k[4]= 'H'; k[5]= 'G';
        k[6]= 'Z'; k[7]= 'X'; k[8]= 'C'; k[9]= 'V'; k[11]= 'B';
        k[12]= 'Q'; k[13]= 'W'; k[14]= 'E'; k[15]= 'R'; k[16]= 'Y'; k[17]= 'T';
        k[18]= '1'; k[19]= '2'; k[20]= '3'; k[21]= '4'; k[22]= '6'; k[23]= '5';
        k[24]=0xBB; k[25]= '9'; k[26]= '7'; k[27]=0xBD; k[28]= '8'; k[29]= '0';
        k[30]=0xDD; k[31]= 'O'; k[32]= 'U'; k[33]=0xDB; k[34]= 'I'; k[35]= 'P';
        k[36]=0x0D; k[37]= 'L'; k[38]= 'J'; k[39]=0xDE; k[40]= 'K'; k[41]=0xBA;
        k[42]=0xDC; k[43]=0xBC; k[44]=0xBF; k[45]= 'N'; k[46]= 'M'; k[47]=0xBE;
        k[48]=0x09; k[49]=0x20; k[50]=0xC0; k[51]=0x08; k[53]=0x1B;
        k[54]=0x5C; k[55]=0x5B; k[56]=0x10; k[57]=0x14; k[58]=0x12;
        k[59]=0x11; k[60]=0x10; k[61]=0x12; k[62]=0x11;
        k[65]=0x6E; k[67]=0x6A; k[69]=0x6B; k[71]=0x0C; k[75]=0x6F;
        k[76]=0x0D; k[78]=0x6D; k[81]=0xBB; k[82]=0x60; k[83]=0x61;
        k[84]=0x62; k[85]=0x63; k[86]=0x64; k[87]=0x65; k[88]=0x66;
        k[89]=0x67; k[91]=0x68; k[92]=0x69;
        k[96]=0x74; k[97]=0x75; k[98]=0x76; k[99]=0x72; k[100]=0x77;
        k[101]=0x78; k[103]=0x7A; k[105]=0x7C; k[106]=0x7F; k[107]=0x7D;
        k[109]=0x79; k[111]=0x7B; k[113]=0x7E; k[114]=0x2D; k[115]=0x24;
        k[116]=0x21; k[117]=0x2E; k[118]=0x73; k[119]=0x23; k[120]=0x71;
        k[121]=0x22; k[122]=0x70; k[123]=0x25; k[124]=0x27; k[125]=0x28; k[126]=0x26;
        return k;
    }();
    return code < keys.size() ? keys[code] : 0;
}
}

@interface PVZMetalView : NSView <NSTextInputClient>
@property(nonatomic, assign) Sexy::MacWindow* owner;
@property(nonatomic, strong) NSMutableAttributedString* composition;
@property(nonatomic, assign) NSRange selection;
@property(nonatomic, assign) NSEventModifierFlags previousFlags;
@property(nonatomic, strong) NSCursor* gameCursor;
@property(nonatomic, assign) BOOL controlClick;
- (void)synchronizeModifierFlags:(NSEventModifierFlags)flags;
@end

@interface PVZWindowDelegate : NSObject <NSWindowDelegate, NSApplicationDelegate>
@property(nonatomic, assign) Sexy::MacWindow* owner;
@property(nonatomic, weak) PVZMetalView* view;
@end

@interface PVZGameWindow : NSWindow
@end

@implementation PVZGameWindow
- (BOOL)canBecomeKeyWindow { return YES; }
- (BOOL)canBecomeMainWindow { return YES; }
@end

namespace Sexy {
struct MacWindow::Impl {
    NSWindow* __strong window = nil;
    PVZMetalView* __strong view = nil;
    CAMetalLayer* __strong layer = nil;
    PVZWindowDelegate* __strong delegate = nil;
    void* context = nullptr;
    void (*callback)(void*, const MacWindowEvent&) = nullptr;
    std::exception_ptr error;
    NSRect savedFrame{};
    NSWindowStyleMask savedStyle{};
    NSApplicationPresentationOptions savedPresentation = NSApplicationPresentationDefault;
    bool fullscreen = false, cursorHidden = false, closing = false;
    std::uint32_t mouseSampleUpdate = 0;
    bool mouseSampled = false;
};
}

@implementation PVZMetalView
- (BOOL)isFlipped { return YES; }
- (BOOL)isOpaque { return YES; }
- (BOOL)acceptsFirstResponder { return YES; }
- (BOOL)acceptsFirstMouse:(NSEvent*)event { (void)event; return YES; }
- (void)resetCursorRects
{
    [self addCursorRect:self.bounds cursor:self.gameCursor ?: NSCursor.arrowCursor];
}
- (void)mouseMoved:(NSEvent*)event { (void)event; }
- (void)mouseDragged:(NSEvent*)event { (void)event; }
- (void)rightMouseDragged:(NSEvent*)event { (void)event; }
- (void)otherMouseDragged:(NSEvent*)event { (void)event; }
- (void)sendButton:(NSEvent*)event pressed:(BOOL)pressed
{
    if (!self.owner || event.buttonNumber > 2) return;
    const auto point = [self convertPoint:event.locationInWindow fromView:nil];
    Sexy::MacWindowEvent queued{};
    queued.kind = Sexy::MacEventKind::MouseButton;
    queued.x = point.x; queued.y = point.y; queued.time = event.timestamp;
    queued.button = static_cast<int>(event.buttonNumber);
    if (event.buttonNumber == 0) {
        if (pressed) self.controlClick = (event.modifierFlags & NSEventModifierFlagControl) != 0;
        if (self.controlClick) queued.button = 1;
        if (!pressed) self.controlClick = NO;
    }
    queued.pressed = pressed;
    queued.clickCount = static_cast<int>(event.clickCount);
    self.owner->Emit(queued);
}
- (void)mouseDown:(NSEvent*)event { [self sendButton:event pressed:YES]; }
- (void)mouseUp:(NSEvent*)event { [self sendButton:event pressed:NO]; }
- (void)rightMouseDown:(NSEvent*)event { [self sendButton:event pressed:YES]; }
- (void)rightMouseUp:(NSEvent*)event { [self sendButton:event pressed:NO]; }
- (void)otherMouseDown:(NSEvent*)event { [self sendButton:event pressed:YES]; }
- (void)otherMouseUp:(NSEvent*)event { [self sendButton:event pressed:NO]; }
- (void)scrollWheel:(NSEvent*)event
{
    if (!self.owner) return;
    Sexy::MacWindowEvent queued{};
    queued.kind = Sexy::MacEventKind::MouseWheel;
    // Precise trackpad deltas are points; conventional mouse deltas are steps.
    queued.y = event.scrollingDeltaY / (event.hasPreciseScrollingDeltas ? 10.0 : 1.0);
    self.owner->Emit(queued);
}
- (void)sendKey:(NSEvent*)event pressed:(BOOL)pressed
{
    if (!self.owner) return;
    Sexy::MacWindowEvent queued{};
    queued.kind = Sexy::MacEventKind::Key;
    queued.key = GameKey(event.keyCode);
    queued.pressed = pressed;
    queued.repeat = event.isARepeat;
    self.owner->Emit(queued);
}
- (void)keyDown:(NSEvent*)event
{
    [self synchronizeModifierFlags:event.modifierFlags];
    [self sendKey:event pressed:YES];
    if (!(event.modifierFlags & (NSEventModifierFlagCommand | NSEventModifierFlagControl)))
        [self interpretKeyEvents:@[event]];
}
- (void)keyUp:(NSEvent*)event
{
    [self synchronizeModifierFlags:event.modifierFlags];
    [self sendKey:event pressed:NO];
}
- (void)flagsChanged:(NSEvent*)event { [self synchronizeModifierFlags:event.modifierFlags]; }
- (void)synchronizeModifierFlags:(NSEventModifierFlags)flags
{
    if (!self.owner) return;
    // Compare aggregate state so releasing one Shift while the other is held
    // does not release the game's single Shift key.
    static constexpr NSEventModifierFlags masks[] = {
        NSEventModifierFlagShift, NSEventModifierFlagControl,
        NSEventModifierFlagOption, NSEventModifierFlagCommand, NSEventModifierFlagCapsLock
    };
    static constexpr unsigned keys[] = {0x10, 0x11, 0x12, 0x5B, 0x14};
    for (unsigned i = 0; i < std::size(masks); ++i) {
        if (!((self.previousFlags ^ flags) & masks[i])) continue;
        Sexy::MacWindowEvent queued{};
        queued.kind = Sexy::MacEventKind::Key;
        queued.key = keys[i];
        queued.pressed = (flags & masks[i]) != 0;
        self.owner->Emit(queued);
    }
    self.previousFlags = flags;
}
- (void)insertText:(id)text replacementRange:(NSRange)range
{
    (void)range;
    NSString* string = [text isKindOfClass:NSAttributedString.class] ? [text string] : text;
    [self unmarkText];
    if (!self.owner) return;
    for (NSUInteger i = 0; i < string.length; ++i) {
        unsigned value = [string characterAtIndex:i];
        if (value >= 0xD800 && value <= 0xDBFF && i + 1 < string.length) {
            unsigned low = [string characterAtIndex:i + 1];
            if (low >= 0xDC00 && low <= 0xDFFF) {
                value = 0x10000 + ((value - 0xD800) << 10) + low - 0xDC00;
                ++i;
            }
        }
        if ((value >= 0xD800 && value <= 0xDFFF) || (value >= 0xF700 && value <= 0xF8FF))
            continue;
        Sexy::MacWindowEvent queued{};
        queued.kind = Sexy::MacEventKind::Text;
        queued.text = value;
        self.owner->Emit(queued);
    }
}
- (void)doCommandBySelector:(SEL)selector
{
    // Text-system commands still produce the framework's separate key-char event.
    unsigned value = 0;
    if (selector == @selector(insertNewline:)) value = '\r';
    else if (selector == @selector(insertTab:)) value = '\t';
    else if (selector == @selector(deleteBackward:)) value = '\b';
    else if (selector == @selector(cancelOperation:)) value = 0x1B;
    if (!value || !self.owner) return;
    Sexy::MacWindowEvent queued{};
    queued.kind = Sexy::MacEventKind::Text;
    queued.text = value;
    self.owner->Emit(queued);
}
- (void)setMarkedText:(id)text selectedRange:(NSRange)range replacementRange:(NSRange)replacement
{
    (void)replacement;
    self.composition = [text isKindOfClass:NSAttributedString.class]
        ? [[NSMutableAttributedString alloc] initWithAttributedString:text]
        : [[NSMutableAttributedString alloc] initWithString:text];
    self.selection = range;
}
- (void)unmarkText { self.composition = nil; self.selection = NSMakeRange(NSNotFound, 0); }
- (BOOL)hasMarkedText { return self.composition.length != 0; }
- (NSRange)markedRange { return self.hasMarkedText ? NSMakeRange(0, self.composition.length) : NSMakeRange(NSNotFound, 0); }
- (NSRange)selectedRange { return self.selection; }
- (NSArray<NSAttributedStringKey>*)validAttributesForMarkedText { return @[]; }
- (NSAttributedString*)attributedSubstringForProposedRange:(NSRange)range actualRange:(NSRangePointer)actual
{
    if (!self.hasMarkedText || range.location > self.composition.length) {
        if (actual) *actual = NSMakeRange(NSNotFound, 0);
        return nil;
    }
    range.length = std::min(range.length, self.composition.length - range.location);
    if (actual) *actual = range;
    return [self.composition attributedSubstringFromRange:range];
}
- (NSUInteger)characterIndexForPoint:(NSPoint)point { (void)point; return NSNotFound; }
- (NSRect)firstRectForCharacterRange:(NSRange)range actualRange:(NSRangePointer)actual
{
    if (actual) *actual = range;
    const auto local = NSMakeRect(0, self.bounds.size.height, 1, 1);
    return [self.window convertRectToScreen:[self convertRect:local toView:nil]];
}
@end

@implementation PVZWindowDelegate
- (BOOL)windowShouldClose:(NSWindow*)sender
{
    (void)sender;
    if (self.owner) {
        Sexy::MacWindowEvent queued{};
        queued.kind = Sexy::MacEventKind::Close;
        self.owner->Emit(queued);
    }
    return NO;
}
- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication*)sender
{
    (void)sender;
    [self windowShouldClose:nil];
    return NSTerminateCancel;
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender { (void)sender; return YES; }
- (void)geometryChanged
{
    if (!self.owner) return;
    // RefreshGeometry catches callback failures and reports them through the pump.
    self.owner->RefreshGeometry();
}
- (void)windowDidResize:(NSNotification*)note { (void)note; [self geometryChanged]; }
- (void)windowDidChangeBackingProperties:(NSNotification*)note { (void)note; [self geometryChanged]; }
- (void)windowDidChangeScreen:(NSNotification*)note { (void)note; [self geometryChanged]; }
- (void)windowDidMiniaturize:(NSNotification*)note { (void)note; [self geometryChanged]; }
- (void)windowDidDeminiaturize:(NSNotification*)note { (void)note; [self geometryChanged]; }
- (void)focusChanged
{
    if (!self.owner) return;
    auto* owner = self.owner;
    owner->Focused = NSApp.active && self.view.window.keyWindow;
    owner->UpdatePresentation();
    if (!owner->Focused) {
        self.view.previousFlags = 0;
        self.view.controlClick = NO;
        [self.view.inputContext discardMarkedText];
        [self.view unmarkText];
    }
    Sexy::MacWindowEvent queued{};
    queued.kind = Sexy::MacEventKind::Focus;
    queued.focused = owner->Focused;
    owner->Emit(queued);
    if (owner->Focused) [self.view synchronizeModifierFlags:NSEvent.modifierFlags];
}
- (void)windowDidBecomeKey:(NSNotification*)note { (void)note; [self focusChanged]; }
- (void)windowDidResignKey:(NSNotification*)note { (void)note; [self focusChanged]; }
- (void)applicationDidBecomeActive:(NSNotification*)note { (void)note; [self focusChanged]; }
- (void)applicationDidResignActive:(NSNotification*)note { (void)note; [self focusChanged]; }
@end

namespace Sexy {
MacWindow::MacWindow(const MacWindowConfig& config) : impl_(std::make_unique<Impl>())
{
    RequireMainThread();
    if (config.width <= 0 || config.height <= 0)
        throw std::invalid_argument("Invalid Cocoa content size");
    @autoreleasepool {
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
        impl_->context = config.callbackContext;
        impl_->callback = config.callback;
        impl_->delegate = [PVZWindowDelegate new];
        impl_->delegate.owner = this;
        impl_->window = [[PVZGameWindow alloc] initWithContentRect:NSMakeRect(0, 0, config.width, config.height)
            styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
                NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable
            backing:NSBackingStoreBuffered defer:NO];
        if (!impl_->window) throw std::runtime_error("Cannot create Cocoa window");
        impl_->window.releasedWhenClosed = NO;
        impl_->window.opaque = YES;
        impl_->window.backgroundColor = NSColor.blackColor;
        // Fullscreen is synchronous borderless desktop coverage, not a Space transition.
        impl_->window.collectionBehavior = NSWindowCollectionBehaviorFullScreenNone;
        impl_->view = [[PVZMetalView alloc] initWithFrame:NSMakeRect(0, 0, config.width, config.height)];
        impl_->view.owner = this;
        impl_->delegate.view = impl_->view;
        impl_->view.selection = NSMakeRange(NSNotFound, 0);
        impl_->layer = [CAMetalLayer layer];
        metalLayer = (__bridge void*)impl_->layer;
        impl_->layer.opaque = YES;
        impl_->view.wantsLayer = YES;
        impl_->view.layer = impl_->layer;
        impl_->view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        impl_->window.contentView = impl_->view;
        impl_->window.delegate = impl_->delegate;
        // Hover is sampled by the logical heartbeat, never by NSEvent motion.
        impl_->window.acceptsMouseMovedEvents = NO;
        [impl_->window makeFirstResponder:impl_->view];
        [impl_->window center];
        SetTitle(config.title);
        NSApp.delegate = impl_->delegate;
        if (!NSApp.mainMenu) {
            NSMenu* menu = [NSMenu new];
            NSMenuItem* item = [NSMenuItem new];
            NSMenu* appMenu = [NSMenu new];
            [appMenu addItemWithTitle:@"Quit pvz_perf" action:@selector(terminate:) keyEquivalent:@"q"];
            item.submenu = appMenu;
            [menu addItem:item];
            NSApp.mainMenu = menu;
        }
        [NSApp finishLaunching];
        RefreshGeometry();
    }
}

MacWindow::~MacWindow()
{
    @autoreleasepool {
        impl_->closing = true;
        metalLayer = nullptr;
        impl_->callback = nullptr;
        impl_->view.owner = nullptr;
        impl_->delegate.owner = nullptr;
        impl_->window.delegate = nil;
        if (NSApp.delegate == impl_->delegate) NSApp.delegate = nil;
        if (impl_->cursorHidden) [NSCursor unhide];
        if (impl_->fullscreen) NSApp.presentationOptions = impl_->savedPresentation;
        [impl_->window orderOut:nil];
        [impl_->window close];
    }
}

void MacWindow::Emit(const MacWindowEvent& event) noexcept
{
    if (impl_->closing || impl_->error || !impl_->callback) return;
    try { impl_->callback(impl_->context, event); }
    catch (...) { impl_->error = std::current_exception(); }
}
void MacWindow::RethrowCallbackError()
{
    if (impl_->error) std::rethrow_exception(std::exchange(impl_->error, {}));
}
void MacWindow::RefreshGeometry()
{
    RequireMainThread();
    if (impl_->fullscreen && impl_->window.screen &&
        !NSEqualRects(impl_->window.frame, impl_->window.screen.frame))
        [impl_->window setFrame:impl_->window.screen.frame display:YES];
    const auto bounds = impl_->view.bounds;
    const auto pixels = [impl_->view convertRectToBacking:bounds];
    Width = static_cast<int>(std::lround(bounds.size.width));
    Height = static_cast<int>(std::lround(bounds.size.height));
    DrawableWidth = static_cast<int>(std::lround(pixels.size.width));
    DrawableHeight = static_cast<int>(std::lround(pixels.size.height));
    impl_->layer.contentsScale = impl_->window.backingScaleFactor;
    impl_->layer.drawableSize = CGSizeMake(DrawableWidth, DrawableHeight);
    MacWindowEvent queued{};
    queued.kind = MacEventKind::Resize;
    queued.minimized = Minimized() || DrawableWidth <= 0 || DrawableHeight <= 0;
    Emit(queued);
}
void MacWindow::UpdatePresentation()
{
    RequireMainThread();
    if (impl_->fullscreen) {
        NSApp.presentationOptions = Focused
            ? (NSApplicationPresentationAutoHideDock | NSApplicationPresentationAutoHideMenuBar)
            : impl_->savedPresentation;
    }
    if (!Focused && impl_->cursorHidden) {
        [NSCursor unhide];
        impl_->cursorHidden = false;
    }
}
void MacWindow::PumpEvents()
{
    RequireMainThread();
    @autoreleasepool {
        constexpr NSEventMask motion = NSEventMaskMouseMoved | NSEventMaskLeftMouseDragged |
            NSEventMaskRightMouseDragged | NSEventMaskOtherMouseDragged;
        // Consume non-motion input in FIFO order; hover uses the game heartbeat.
        for (;;) {
            NSEvent* event = [NSApp nextEventMatchingMask:(NSEventMaskAny & ~motion)
                untilDate:NSDate.distantPast inMode:NSDefaultRunLoopMode dequeue:YES];
            if (!event) break;
            [NSApp sendEvent:event];
            RethrowCallbackError();
        }
        [NSApp discardEventsMatchingMask:motion beforeEvent:nil];
        [NSApp updateWindows];
        RethrowCallbackError();
    }
}
void MacWindow::Show()
{
    RequireMainThread();
    [impl_->window makeKeyAndOrderFront:nil];
    [NSApp activateIgnoringOtherApps:YES];
    Visible = true;
}
void MacWindow::SetTitle(const std::string& title)
{
    RequireMainThread();
    NSString* value = [[NSString alloc] initWithBytes:title.data() length:title.size() encoding:NSUTF8StringEncoding];
    if (!value) throw std::invalid_argument("Cocoa window title must be UTF-8");
    impl_->window.title = value;
}
void MacWindow::Resize(int width, int height)
{
    RequireMainThread();
    if (width <= 0 || height <= 0 || impl_->fullscreen)
        throw std::invalid_argument("Invalid windowed Cocoa resize");
    [impl_->window setContentSize:NSMakeSize(width, height)];
    RefreshGeometry();
}
void MacWindow::SetFullscreen(bool fullscreen)
{
    RequireMainThread();
    if (fullscreen == impl_->fullscreen) return;
    if (fullscreen) {
        NSScreen* screen = impl_->window.screen ?: NSScreen.mainScreen;
        if (!screen) throw std::runtime_error("Cocoa fullscreen requires a screen");
        impl_->savedFrame = impl_->window.frame;
        impl_->savedStyle = impl_->window.styleMask;
        impl_->savedPresentation = NSApp.presentationOptions;
        impl_->fullscreen = true;
        impl_->window.styleMask = NSWindowStyleMaskBorderless;
        [impl_->window setFrame:screen.frame display:YES];
    } else {
        impl_->fullscreen = false;
        NSApp.presentationOptions = impl_->savedPresentation;
        impl_->window.styleMask = impl_->savedStyle;
        [impl_->window setFrame:impl_->savedFrame display:YES];
    }
    UpdatePresentation();
    if (Visible) [impl_->window makeKeyAndOrderFront:nil];
    RefreshGeometry();
}
bool MacWindow::Minimized() const { return impl_->window.miniaturized; }
bool MacWindow::BeginMouseSample(std::uint32_t update)
{
    if (impl_->mouseSampled && impl_->mouseSampleUpdate == update) return false;
    impl_->mouseSampled = true;
    impl_->mouseSampleUpdate = update;
    return true;
}
MacPointerState MacWindow::SamplePointer() const
{
    RequireMainThread();
    const auto point = [impl_->view convertPoint:impl_->window.mouseLocationOutsideOfEventStream fromView:nil];
    const auto screenPoint = NSEvent.mouseLocation;
    const auto topWindow = [NSWindow windowNumberAtPoint:screenPoint belowWindowWithWindowNumber:0];
    const bool inside = Visible && !Minimized() && NSPointInRect(point, impl_->view.bounds) &&
        topWindow == impl_->window.windowNumber;
    return {point.x, point.y, inside};
}
void MacWindow::ApplyCursor(MacCursor cursor)
{
    RequireMainThread();
    NSCursor* native = nil;
    switch (cursor) {
    case MacCursor::Arrow: native = NSCursor.arrowCursor; break;
    case MacCursor::Hand: native = NSCursor.pointingHandCursor; break;
    case MacCursor::Text: native = NSCursor.IBeamCursor; break;
    case MacCursor::Move: native = NSCursor.closedHandCursor; break;
    case MacCursor::Forbidden: native = NSCursor.operationNotAllowedCursor; break;
    case MacCursor::ResizeHorizontal: native = NSCursor.resizeLeftRightCursor; break;
    case MacCursor::ResizeVertical: native = NSCursor.resizeUpDownCursor; break;
    case MacCursor::Hidden: native = NSCursor.arrowCursor; break;
    case MacCursor::ResizeNorthEast: {
        static NSCursor* diagonal = DrawnCursor(MacCursor::ResizeNorthEast);
        native = diagonal;
        break;
    }
    case MacCursor::ResizeNorthWest: {
        static NSCursor* diagonal = DrawnCursor(MacCursor::ResizeNorthWest);
        native = diagonal;
        break;
    }
    case MacCursor::Wait: {
        static NSCursor* wait = DrawnCursor(MacCursor::Wait);
        native = wait;
        break;
    }
    }
    // Never hide the desktop cursor while the pointer is outside this content view.
    const auto pointer = SamplePointer();
    const bool hide = cursor == MacCursor::Hidden && Focused && pointer.inside;
    if (hide != impl_->cursorHidden) {
        if (hide) [NSCursor hide]; else [NSCursor unhide];
        impl_->cursorHidden = hide;
    }
    if (impl_->view.gameCursor != native) {
        impl_->view.gameCursor = native;
        [impl_->window invalidateCursorRectsForView:impl_->view];
    }
    if (pointer.inside) [native set];
}
}
