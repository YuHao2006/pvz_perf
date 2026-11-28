#import <UIKit/UIKit.h>
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>
#import <QuartzCore/CAMetalLayer.h>
#import <QuartzCore/CADisplayLink.h>
#include <algorithm>
#import <Metal/Metal.h>
#import <AVFAudio/AVFAudio.h>
#include "../macos/MacWindow.h"
#include "../macos/MacSystem.h"
#include "SexyAppFramework/SexyAppBase.h"
#include "SexyAppFramework/platform/ApplicationHost.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "SexyAppFramework/widget/WidgetManager.h"
#include "SexyAppFramework/widget/EditWidget.h"
#include "SexyAppFramework/misc/KeyCodes.h"
#include <exception>

void Sexy::HostRunMainLoop(SexyAppBase& app)
{
    RunApplicationLoop(app, [](SexyAppBase& current) {
        @autoreleasepool { current.UpdateApp(); }
    });
}
int PvzIosRun(int argc,char** argv);
using namespace Sexy;
static MacWindow* gameWindow;
static UIViewController* controller;
static NSURL* documents() {
    return [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
}
// A full sideload package runs directly from its signed, read-only bundle.
static NSURL* gameArchive() {
    NSURL* bundled = [NSBundle.mainBundle URLForResource:@"main" withExtension:@"pak64"];
    return bundled ?: [documents() URLByAppendingPathComponent:@"main.pak64"];
}
@interface GameView : UIView <UIKeyInput>
- (UIScreen*)gameScreen;
- (void)updateDisplayPreference:(float)target focused:(BOOL)focused;
- (void)stopDisplayLink;
@end
@implementation GameView {
    CADisplayLink* displayLink;
}
- (UIScreen*)gameScreen {
    return self.window.windowScene.screen ?: self.window.screen ?: UIScreen.mainScreen;
}
- (void)displayTick:(CADisplayLink*)link {
    // The native loop paces simulation and submits Metal frames independently.
    // Keep an active display link to communicate its desired cadence to iOS.
    (void)link;
}
- (void)updateDisplayPreference:(float)target focused:(BOOL)focused {
    const float rate = std::min(target, static_cast<float>(self.gameScreen.maximumFramesPerSecond));
    if (!focused || rate <= 60.0f) {
        displayLink.paused = YES;
        return;
    }
    if (!displayLink) {
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayTick:)];
        [displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
    }
    if (displayLink.preferredFrameRateRange.preferred != rate)
        displayLink.preferredFrameRateRange = CAFrameRateRangeMake(60.0f, rate, rate);
    displayLink.paused = NO;
}
- (void)stopDisplayLink {
    [displayLink invalidate];
    displayLink = nil;
}
+ (Class)layerClass { return CAMetalLayer.class; }
- (void)layoutSubviews {
    [super layoutSubviews];
    if(gameWindow)gameWindow->RefreshGeometry();
}
- (BOOL)canBecomeFirstResponder { return YES; }
- (BOOL)hasText { return YES; }
- (void)insertText:(NSString*)text {
    if(!gameWindow)return;
    for(NSUInteger i=0;i<text.length;i++){
        MacWindowEvent e{};e.kind=MacEventKind::Text;e.text=[text characterAtIndex:i];gameWindow->Emit(e);
    }
}
- (void)deleteBackward {
    if(!gameWindow)return;
    MacWindowEvent e{};e.kind=MacEventKind::Key;e.key=KEYCODE_BACK;e.pressed=true;gameWindow->Emit(e);e.pressed=false;gameWindow->Emit(e);
}
- (void)forward:(NSSet<UITouch*>*)touches phase:(MacEventKind)kind {
    if(!gameWindow)return;
    for(UITouch* t in touches){
        CGPoint p=[t locationInView:self];MacWindowEvent e{};e.kind=kind;e.x=p.x;e.y=p.y;
        e.contact=(uintptr_t)(__bridge void*)t;gameWindow->Emit(e);
    }
}
- (void)touchesBegan:(NSSet<UITouch*>*)t withEvent:(UIEvent*)e { [self forward:t phase:MacEventKind::TouchStart]; }
- (void)touchesMoved:(NSSet<UITouch*>*)t withEvent:(UIEvent*)e { [self forward:t phase:MacEventKind::TouchMove]; }
- (void)touchesEnded:(NSSet<UITouch*>*)t withEvent:(UIEvent*)e { [self forward:t phase:MacEventKind::TouchEnd]; }
- (void)touchesCancelled:(NSSet<UITouch*>*)t withEvent:(UIEvent*)e { [self forward:t phase:MacEventKind::TouchCancel]; }
@end

namespace Sexy {
struct MacWindow::Impl { MacWindowConfig config; GameView* view; std::exception_ptr error; };
MacWindow::MacWindow(const MacWindowConfig& c):impl_(std::make_unique<Impl>()){
    impl_->config=c;gameWindow=this;
    GameView* v=[[GameView alloc] initWithFrame:controller.view.bounds];v.multipleTouchEnabled=YES;
    v.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    impl_->view=v; [controller.view addSubview:v]; metalLayer=(__bridge void*)v.layer;
    RefreshGeometry();Focused=true;Visible=true;
}
MacWindow::~MacWindow(){
    gameWindow=nullptr;
    [impl_->view stopDisplayLink];
    [impl_->view removeFromSuperview];
}
void* IosMetalLayer(NativeWindowHandle w){return w->metalLayer;}
void MacWindow::RefreshGeometry(){
    auto* view=impl_->view;auto* layer=(CAMetalLayer*)view.layer;
    CGFloat scale=view.window.screen.scale ?: UIScreen.mainScreen.scale;
    int w=(int)view.bounds.size.width,h=(int)view.bounds.size.height;
    int dw=(int)llround(view.bounds.size.width*scale),dh=(int)llround(view.bounds.size.height*scale);
    if(w==Width&&h==Height&&dw==DrawableWidth&&dh==DrawableHeight)return;
    Width=w;Height=h;DrawableWidth=dw;DrawableHeight=dh;layer.contentsScale=scale;layer.drawableSize=CGSizeMake(dw,dh);
    MacWindowEvent e{};e.kind=MacEventKind::Resize;Emit(e);
}
void MacWindow::PumpEvents(){
    @autoreleasepool {
        CFRunLoopRunInMode(kCFRunLoopDefaultMode,0.0001,true);
        auto* app=gSexyAppBase;
        if (app)
            [impl_->view updateDisplayPreference:static_cast<float>(app->mFrameTiming.mTargetFps) focused:Focused];
        const bool edit=app&&app->mWidgetManager&&dynamic_cast<EditWidget*>(app->mWidgetManager->mFocusWidget);
        if(edit&&!impl_->view.isFirstResponder)[impl_->view becomeFirstResponder];
        if(!edit&&impl_->view.isFirstResponder)[impl_->view resignFirstResponder];
        RethrowCallbackError();
    }
}
void MacWindow::Emit(const MacWindowEvent& e) noexcept{try{if(impl_->config.callback)impl_->config.callback(impl_->config.callbackContext,e);}catch(...){impl_->error=std::current_exception();}}
void MacWindow::RethrowCallbackError(){if(impl_->error)std::rethrow_exception(impl_->error);}
void MacWindow::Show(){Visible=true;}
void MacWindow::SetTitle(const std::string&){}
void MacWindow::Resize(int,int){RefreshGeometry();}
void MacWindow::SetFullscreen(bool){RefreshGeometry();}
void MacWindow::ApplyCursor(MacCursor){}
MacPointerState MacWindow::SamplePointer()const{return {};}
bool MacWindow::BeginMouseSample(std::uint32_t){return false;}
bool MacWindow::Minimized()const{return !Focused;}
double MacWindow::RefreshRate()const{return [impl_->view gameScreen].maximumFramesPerSecond;}
void MacWindow::UpdatePresentation(){RefreshGeometry();}
std::string MacClipboard(const std::string* in){if(in)UIPasteboard.generalPasteboard.string=[NSString stringWithUTF8String:in->c_str()];return UIPasteboard.generalPasteboard.string.UTF8String ?: "";}
std::string MacExecutableDirectory(){return NSBundle.mainBundle.bundlePath.fileSystemRepresentation;}
bool MacDebuggerPresent(){return false;}
bool ShowNativeErrorDialog(const char* msg,const char* title){
    UIAlertController* a=[UIAlertController alertControllerWithTitle:@(title ?: "PvZ") message:@(msg ?: "") preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [controller presentViewController:a animated:YES completion:nil];return true;
}
}
@interface GameController : UIViewController <UIDocumentPickerDelegate>
@end
@implementation GameController {
    UIButton* play;
    UIButton* pick;
    UILabel* message;
}
- (void)viewDidLoad {
    [super viewDidLoad];self.view.backgroundColor=UIColor.systemBackgroundColor;
    message=[UILabel new];message.text=@"请选择与这个版本配套的 main.pak64";message.textAlignment=NSTextAlignmentCenter;message.numberOfLines=0;
    pick=[UIButton buttonWithType:UIButtonTypeSystem];[pick setTitle:@"从文件导入 main.pak64" forState:UIControlStateNormal];[pick addTarget:self action:@selector(selectFile) forControlEvents:UIControlEventTouchUpInside];
    play=[UIButton buttonWithType:UIButtonTypeSystem];[play setTitle:@"开始游戏" forState:UIControlStateNormal];[play addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    id<MTLDevice> gpu = MTLCreateSystemDefaultDevice();
    const BOOL supported = [gpu supportsFamily:MTLGPUFamilyApple6]
        && gpu.argumentBuffersSupport == MTLArgumentBuffersTier2;
    BOOL bundled = [NSBundle.mainBundle URLForResource:@"main" withExtension:@"pak64"] != nil;
    if (bundled) {
        message.text = @"游戏资源已就绪";
        pick.hidden = YES;
    }
    if (!supported) {
        message.text = @"此版本需要 A13 级或更新的 GPU，并支持 Metal Tier 2 纹理绑定。";
        pick.enabled = NO;
    }
    play.enabled = supported && [NSFileManager.defaultManager fileExistsAtPath:gameArchive().path];
    UIStackView* stack=[[UIStackView alloc] initWithArrangedSubviews:@[message,pick,play]];
    stack.axis=UILayoutConstraintAxisVertical;stack.spacing=12;stack.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:stack];[NSLayoutConstraint activateConstraints:@[[stack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],[stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]]];
}
- (void)selectFile {
    UIDocumentPickerViewController* p=[[UIDocumentPickerViewController alloc] initForOpeningContentTypes:@[UTTypeData] asCopy:YES];p.delegate=self;[self presentViewController:p animated:YES completion:nil];
}
- (void)documentPicker:(UIDocumentPickerViewController*)p didPickDocumentsAtURLs:(NSArray<NSURL*>*)urls {
    NSURL* src=urls.firstObject;if(!src)return;
    if([src.pathExtension caseInsensitiveCompare:@"pak64"]!=NSOrderedSame){message.text=@"请选择 .pak64 文件";return;}
    play.enabled=NO;pick.enabled=NO;message.text=@"正在导入…";
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED,0),^{
        NSFileManager* fm=NSFileManager.defaultManager;NSURL* dest=[documents() URLByAppendingPathComponent:@"main.pak64"];
        NSURL* tmp=[documents() URLByAppendingPathComponent:NSUUID.UUID.UUIDString];NSError* error=nil;
        BOOL ok=[fm copyItemAtURL:src toURL:tmp error:&error];
        if(ok){
            PakInterface archive;
            constexpr bool needsHdMarker = false;
            ok=archive.AddPakFile(tmp.path.fileSystemRepresentation)
                && archive.mPakRecordMap.contains("COMPILED\\ATLASES\\ALMANAC_UI.ATLAS.PNG")
                && archive.mPakRecordMap.contains("COMPILED\\RENDER-HEIGHT.TXT")==needsHdMarker;
            if(!ok)error=[NSError errorWithDomain:@"PvZResourceImport" code:1 userInfo:@{
                NSLocalizedDescriptionKey:@"资源包不完整或版本不匹配。请使用此测试版配套的 main.pak64。"}];
        }
        if(ok){if([fm fileExistsAtPath:dest.path])ok=[fm replaceItemAtURL:dest withItemAtURL:tmp backupItemName:nil options:0 resultingItemURL:nil error:&error];else ok=[fm moveItemAtURL:tmp toURL:dest error:&error];}
        if(!ok)[fm removeItemAtURL:tmp error:nil];
        dispatch_async(dispatch_get_main_queue(),^{self->message.text=ok?@"资源已就绪":error.localizedDescription;self->play.enabled=[fm fileExistsAtPath:dest.path];self->pick.enabled=YES;});
    });
}
- (void)startGame {
    AVAudioSession* audio=AVAudioSession.sharedInstance;
    [audio setCategory:AVAudioSessionCategoryAmbient error:nil];[audio setActive:YES error:nil];
    play.enabled=NO;pick.enabled=NO;message.text=@"正在启动…";
    NSURL* data=[NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
    setenv("PVZ_APPDATA_DIR",data.path.fileSystemRepresentation,1);
    NSString* pak=gameArchive().path;setenv("PVZ_IOS_PAK",pak.fileSystemRepresentation,1);
    [self performSelector:@selector(runGame) withObject:nil afterDelay:0.05];
}
- (void)runGame {PvzIosRun(0,nullptr);message.text=@"本次游戏已结束，请重新打开应用。";}
- (BOOL)prefersStatusBarHidden{return YES;}
@end
@interface GameDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic,strong) UIWindow* window;
@end
@implementation GameDelegate
- (BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options {
    self.window=[[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];controller=[GameController new];self.window.rootViewController=controller;[self.window makeKeyAndVisible];return YES;
}
- (void)signalFocus:(BOOL)focused {if(gameWindow){gameWindow->Focused=focused;MacWindowEvent e{};e.kind=MacEventKind::Focus;e.focused=focused;gameWindow->Emit(e);}}
- (void)applicationWillResignActive:(UIApplication*)app{[self signalFocus:NO];}
- (void)applicationDidBecomeActive:(UIApplication*)app{[self signalFocus:YES];}
@end
int main(int argc,char** argv){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass(GameDelegate.class));}}
