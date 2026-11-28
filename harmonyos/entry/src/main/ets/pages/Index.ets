import { common } from '@kit.AbilityKit';
import { fileIo as fs, picker } from '@kit.CoreFileKit';
import { Dat64Editor } from '../saves/Dat64Editor';
import { Dat64Bridge } from '../saves/Dat64Bridge';
import { inputDevice, KeyCode } from '@kit.InputKit';
import { inputMethod } from '@kit.IMEKit';
import { deviceInfo } from '@kit.BasicServicesKit';

interface GameHost {
  start(surfaceId: string, dataRoot: string, vulkanVersion: string): void;
  stop(): void;
  setForeground(foreground: boolean): void;
  startupStatus(): string;
  touch(kind: number, id: number, x: number, y: number): void;
  mouse(action: number, button: number, x: number, y: number): void;
  key(symbol: number, pressed: boolean, character: number): void;
  insertText(text: string): void;
  isEditing(): boolean;
  status(): string;
}

// Linux input dispatch uses XKB key symbols, independently of inserted text.
function keySymbol(code: number): number {
  if (code >= KeyCode.KEYCODE_A && code <= KeyCode.KEYCODE_Z) return 97 + code - KeyCode.KEYCODE_A;
  if (code >= KeyCode.KEYCODE_0 && code <= KeyCode.KEYCODE_9) return 48 + code - KeyCode.KEYCODE_0;
  if (code >= KeyCode.KEYCODE_F1 && code <= KeyCode.KEYCODE_F12) return 0xffbe + code - KeyCode.KEYCODE_F1;
  if (code >= KeyCode.KEYCODE_NUMPAD_0 && code <= KeyCode.KEYCODE_NUMPAD_9) {
    return 0xffb0 + code - KeyCode.KEYCODE_NUMPAD_0;
  }
  switch (code) {
    case KeyCode.KEYCODE_ENTER: case KeyCode.KEYCODE_NUMPAD_ENTER: return 0xff0d;
    case KeyCode.KEYCODE_DEL: return 0xff08;
    case KeyCode.KEYCODE_FORWARD_DEL: return 0xffff;
    case KeyCode.KEYCODE_TAB: return 0xff09;
    case KeyCode.KEYCODE_ESCAPE: return 0xff1b;
    case KeyCode.KEYCODE_SPACE: return 0x20;
    case KeyCode.KEYCODE_DPAD_LEFT: return 0xff51;
    case KeyCode.KEYCODE_DPAD_UP: return 0xff52;
    case KeyCode.KEYCODE_DPAD_RIGHT: return 0xff53;
    case KeyCode.KEYCODE_DPAD_DOWN: return 0xff54;
    case KeyCode.KEYCODE_MOVE_HOME: return 0xff50;
    case KeyCode.KEYCODE_MOVE_END: return 0xff57;
    case KeyCode.KEYCODE_PAGE_UP: return 0xff55;
    case KeyCode.KEYCODE_PAGE_DOWN: return 0xff56;
    case KeyCode.KEYCODE_CTRL_LEFT: case KeyCode.KEYCODE_CTRL_RIGHT: return 0xffe3;
    case KeyCode.KEYCODE_ALT_LEFT: case KeyCode.KEYCODE_ALT_RIGHT: return 0xffe9;
    case KeyCode.KEYCODE_SHIFT_LEFT: case KeyCode.KEYCODE_SHIFT_RIGHT: return 0xffe1;
    default: return 0;
  }
}

@Entry
@Component
struct Index {
  private surface: XComponentController = new XComponentController();
  private game?: GameHost;
  private timer: number = -1;
  private nativeStarted: boolean = false;
  private generation: number = 0;
  private keyboard = inputMethod.getController();
  private keyboardWanted: boolean = false;
  private hardwareKeyboard: boolean = false;
  private keyboardDevicesReady: boolean = false;
  private keyboardDeviceScan: number = 0;
  private keyboardDeviceChanged = (_event: inputDevice.DeviceListener): void => {
    this.refreshKeyboardDevices();
  };
  private keyboardBound: boolean = false;
  private keyboardTask: Promise<void> = Promise.resolve();
  private insert = (text: string): void => { this.game?.insertText(text); };
  private backspace = (length: number): void => { this.sendEditKey(0xff08, length); };
  private deleteForward = (length: number): void => { this.sendEditKey(0xffff, length); };
  private submit = (_functionKey: inputMethod.FunctionKey): void => { this.sendEditKey(0xff0d, 1); };
  @StorageProp('pvzForeground') @Watch('onForegroundChanged') foreground: boolean = false;
  @State message: string = '';
  @State launcherOpen: boolean = true;
  @State surfaceReady: boolean = false;
  @State vulkanVersion: string = '1.3';
  @State policyReady: boolean = false;
  @State compatibilityAllowed: boolean = false;
  @State savePanel: boolean = false;
  @State bundledPak: boolean = false;
  @State needsPak: boolean = false;
  @State importingPak: boolean = false;
  private saveBridge?: Dat64Bridge;
  private readonly showLauncher: boolean = deviceInfo.deviceType !== '2in1';
  private autoStartPending: boolean = true;

  private startOnDesktop(): void {
    if (!this.showLauncher && this.autoStartPending && this.foreground) {
      this.launchSelectedBackend();
    }
  }

  private abilityContext(): common.UIAbilityContext {
    return this.getUIContext().getHostContext() as common.UIAbilityContext;
  }

  private async readLaunchPolicy(): Promise<void> {
    try {
      // Only the standard 600p package includes this marker.
      const marker = await this.abilityContext().resourceManager
        .getRawFileContent('vulkan-1.0-standard-600p.flag');
      this.compatibilityAllowed = marker.length > 0;
    } catch (_) {
      this.compatibilityAllowed = false;
    }
    this.vulkanVersion = this.compatibilityAllowed ? '1.0' : '1.3';
    const context = this.abilityContext();
    try {
      const descriptor = await context.resourceManager.getRawFd('main.pak64');
      this.bundledPak = descriptor.length > 0;
      await context.resourceManager.closeRawFd('main.pak64');
    } catch (_) {}
    this.needsPak = !this.bundledPak && !fs.accessSync(context.filesDir + '/main.pak64');
    this.policyReady = true;
    this.startOnDesktop();
  }

  private async importPak(): Promise<void> {
    if (this.importingPak) return;
    this.importingPak = true;
    const context = this.abilityContext();
    const destination = context.filesDir + '/main.pak64';
    const temporary = destination + '.import';
    try {
      const options = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 1;
      options.fileSuffixFilters = ['PAK64|.pak64'];
      const selected = await new picker.DocumentViewPicker(context).select(options);
      if (selected.length === 0) return;
      this.message = '正在导入游戏资源…';
      const source = await fs.open(selected[0], fs.OpenMode.READ_ONLY);
      try {
        await fs.copyFile(source.fd, temporary);
        const expected = await fs.stat(source.fd);
        const copied = await fs.stat(temporary);
        if (expected.size !== copied.size || copied.size < 22) {
          throw new Error('资源复制不完整，请重新导入。');
        }
      } finally {
        await fs.close(source);
      }
      const staged = await fs.open(temporary, fs.OpenMode.READ_ONLY);
      try {
        const header = new ArrayBuffer(4);
        const read = await fs.read(staged.fd, header);
        if (read !== 4 || new DataView(header).getUint32(0, true) !== 0x04034b50) {
          throw new Error('请选择与本版本配套的 main.pak64。');
        }
      } finally {
        await fs.close(staged);
      }
      await fs.rename(temporary, destination);
      this.needsPak = false;
      this.autoStartPending = true;
      this.message = '';
    } catch (error) {
      this.message = '导入失败：' + (error as Error).message;
    } finally {
      try { if (fs.accessSync(temporary)) fs.unlinkSync(temporary); } catch (_) {}
      this.importingPak = false;
    }
    this.startOnDesktop();
  }

  private openSaves(): void {
    try {
      this.saveBridge?.open();
      this.savePanel = true;
      this.message = '';
    } catch (error) {
      this.message = (error as Error).message;
    }
  }

  private closeSaves(): void {
    this.savePanel = false;
    try { this.saveBridge?.close(); } catch (error) { this.message = (error as Error).message; }
  }

  private editorResource(url: string): WebResourceResponse {
    const response = new WebResourceResponse();
    const prefix = 'https://pvz-save.invalid/';
    const file = url.startsWith(prefix) ? url.slice(prefix.length) : '';
    const allowed: string[] = ['engine.html', 'native-engine.js', 'harmony-save-host.js', 'lineup-library.js',
      'save-codec.js', 'save-tool-executor.js', 'save-tool-core.js', 'save-generate.js',
      'save-lineups.js', 'save-model.js', 'save-prefab.js'];
    if (allowed.includes(file)) {
      try {
        const source = this.abilityContext().resourceManager.getRawFileContentSync('save-editor/' + file);
        const data = new ArrayBuffer(source.byteLength);
        new Uint8Array(data).set(source);
        response.setResponseData(data);
        response.setResponseEncoding('UTF-8');
        response.setResponseMimeType(file.endsWith('.html') ? 'text/html' : 'text/javascript');
        response.setResponseCode(200);
        response.setReasonMessage('OK');
        if (file.endsWith('.html')) {
          response.setResponseHeader([{
            headerKey: 'Content-Security-Policy',
            headerValue: "default-src 'none'; script-src 'self' 'unsafe-inline' 'wasm-unsafe-eval'; style-src 'unsafe-inline'; img-src data:; connect-src 'self'; object-src 'none'; frame-src 'none'; base-uri 'none'"
          }]);
        }
        return response;
      } catch (_) {}
    }
    response.setResponseData('');
    response.setResponseCode(404);
    response.setReasonMessage('Not Found');
    return response;
  }

  private launchSelectedBackend(): void {
    const game = this.game;
    if (!game || !this.surfaceReady || !this.launcherOpen || !this.policyReady ||
        this.savePanel || this.needsPak || this.importingPak) return;
    try {
      this.saveBridge?.recover();
    } catch (error) {
      this.message = (error as Error).message;
      return;
    }
    this.autoStartPending = false;
    this.launcherOpen = false;
    this.message = '正在加载本地游戏资源…';
    this.startGame(game, ++this.generation).catch((error: Error) => {
      this.message = error.message;
      this.launcherOpen = true;
    });
  }

  private async startGame(game: GameHost, generation: number): Promise<void> {
    const ctx = this.getUIContext().getHostContext() as common.UIAbilityContext;
    const root = ctx.filesDir;
    const installed = root + '/native-resources-v2';
    if (!fs.accessSync(installed) || (this.bundledPak && !fs.accessSync(root + '/main.pak64'))) {
      const names: string[] = this.bundledPak ? ['main.pak64'] : [];
      for (const shader of await ctx.resourceManager.getRawFileList('shaders')) names.push('shaders/' + shader);
      await this.installResources(ctx, names, 'shaders', installed, generation);
    }
    if (this.vulkanVersion === '1.0') {
      const legacyInstalled = root + '/legacy-shaders-v3';
      const legacyShaders = await ctx.resourceManager.getRawFileList('shaders-legacy');
      if (legacyShaders.length === 0) throw new Error('缺少 Vulkan 兼容着色器');
      const names = legacyShaders.map((shader: string) => 'shaders-legacy/' + shader);
      if (!fs.accessSync(legacyInstalled) || names.some((name: string) =>
        !fs.accessSync(root + '/' + name) || fs.statSync(root + '/' + name).size === 0)) {
        await this.installResources(ctx, names, 'shaders-legacy', legacyInstalled, generation);
      }
    }
    if (generation !== this.generation) return;
    try { this.getUIContext().getFocusController().requestFocus('game-input'); } catch (_) {}
    this.message = '正在启动原生游戏…';
    game.setForeground(this.foreground);
    game.start(this.surface.getXComponentSurfaceId(), root, this.compatibilityAllowed ? this.vulkanVersion : '1.3');
    this.nativeStarted = true;
    this.onForegroundChanged();
  }

  private onForegroundChanged(): void {
    this.game?.setForeground(this.foreground);
    if (this.timer !== -1) { clearInterval(this.timer); this.timer = -1; }
    if (!this.foreground) {
      this.showKeyboard(false);
      return;
    }
    this.startOnDesktop();
    const game = this.game;
    if (!game || !this.nativeStarted) return;
    this.timer = setInterval(() => {
      this.showKeyboard(this.keyboardDevicesReady && game.isEditing() && !this.hardwareKeyboard);
      const error = game.status();
      this.message = error.length > 0 ?
        (this.compatibilityAllowed && this.showLauncher ? error : error.replace('，请选择 Vulkan 1.0。', '。')) : game.startupStatus();
      if (error.length > 0) {
        clearInterval(this.timer);
        this.timer = -1;
        this.nativeStarted = false;
        this.showKeyboard(false);
        game.stop();
        this.launcherOpen = true;
      }
    }, 250);
  }

  private async installResources(ctx: common.UIAbilityContext, names: string[], folder: string,
    marker: string, generation: number): Promise<void> {
    if (generation !== this.generation) return;
    const root = ctx.filesDir;
    if (!fs.accessSync(root + '/' + folder)) fs.mkdirSync(root + '/' + folder);
    for (const name of names) {
      const data = await ctx.resourceManager.getRawFileContent(name);
      if (generation !== this.generation) return;
      const temp = root + '/' + name + '.tmp';
      const file = fs.openSync(temp, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
      try {
        if (fs.writeSync(file.fd, data.buffer) !== data.byteLength) throw new Error('写入失败 ' + name);
        fs.fsyncSync(file.fd);
      } finally {
        fs.closeSync(file);
      }
      fs.renameSync(temp, root + '/' + name);
    }
    fs.closeSync(fs.openSync(marker, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY));
  }

  aboutToAppear(): void {
    this.saveBridge = new Dat64Bridge(this.abilityContext());
    this.readLaunchPolicy();
    this.keyboardDevicesReady = false;
    try { inputDevice.on('change', this.keyboardDeviceChanged); } catch (_) {}
    this.refreshKeyboardDevices();
  }

  aboutToDisappear(): void {
    this.keyboardDeviceScan++;
    try { inputDevice.off('change', this.keyboardDeviceChanged); } catch (_) {}
    this.showKeyboard(false);
  }

  private async refreshKeyboardDevices(): Promise<void> {
    const scan = ++this.keyboardDeviceScan;
    let physical = false;
    try {
      const ids = await inputDevice.getDeviceList();
      for (const id of ids) {
        try {
          const type = await inputDevice.getKeyboardType(id);
          if (type !== inputDevice.KeyboardType.ALPHABETIC_KEYBOARD) continue;
          const info = await inputDevice.getDeviceInfo(id);
          if (info.isVirtual !== true) {
            physical = true;
            break;
          }
        } catch (_) {
          // The device can disconnect between enumeration and query.
        }
      }
    } catch (_) {}
    if (scan !== this.keyboardDeviceScan) return;
    this.hardwareKeyboard = physical;
    this.keyboardDevicesReady = true;
  }

  private sendEditKey(symbol: number, count: number): void {
    if (!this.game?.isEditing()) return;
    for (let i = 0; i < Math.min(count, 64); i++) {
      this.game.key(symbol, true, 0);
      this.game.key(symbol, false, 0);
    }
  }

  private showKeyboard(visible: boolean): void {
    if (visible === this.keyboardWanted) return;
    this.keyboardWanted = visible;
    this.keyboardTask = this.keyboardTask.then(async () => {
      if (this.keyboardWanted === this.keyboardBound) return;
      if (this.keyboardWanted) {
        try {
          this.keyboard.on('insertText', this.insert);
          this.keyboard.on('deleteLeft', this.backspace);
          this.keyboard.on('deleteRight', this.deleteForward);
          this.keyboard.on('sendFunctionKey', this.submit);
          await this.keyboard.attachWithUIContext(this.getUIContext(), {
            inputAttribute: {
              textInputType: inputMethod.TextInputType.TEXT,
              enterKeyType: inputMethod.EnterKeyType.DONE
            }
          }, { showKeyboard: true });
          this.keyboardBound = true;
        } catch (_) {
          this.removeKeyboardListeners();
        }
      } else {
        this.removeKeyboardListeners();
        try { await this.keyboard.detach(); } catch (_) {}
        this.keyboardBound = false;
      }
    });
  }

  private removeKeyboardListeners(): void {
    try { this.keyboard.off('insertText', this.insert); } catch (_) {}
    try { this.keyboard.off('deleteLeft', this.backspace); } catch (_) {}
    try { this.keyboard.off('deleteRight', this.deleteForward); } catch (_) {}
    try { this.keyboard.off('sendFunctionKey', this.submit); } catch (_) {}
  }

  private detach(): void {
    this.generation++;
    this.showKeyboard(false);
    if (this.timer !== -1) { clearInterval(this.timer); this.timer = -1; }
    this.nativeStarted = false;
    this.game?.stop();
    this.game = undefined;
    this.surfaceReady = false;
    this.launcherOpen = true;
    this.autoStartPending = true;
  }

  @Builder
  VulkanOption(title: string, version: string) {
    Button(title)
      .fontSize(17)
      .fontColor(this.vulkanVersion === version ? '#182014' : '#EEF3E6')
      .backgroundColor(this.vulkanVersion === version ? '#CFE89F' : '#27312A')
      .width('100%').height(48)
      .onClick(() => { this.vulkanVersion = version; this.message = ''; })
  }

  @Builder
  SaveManager() {
    Dat64Editor({
      bridge: this.saveBridge,
      loadResource: (url: string) => this.editorResource(url),
      leave: () => this.closeSaves()
    })
  }
  build() {
    Stack() {
      XComponent({ id: 'lawn', type: XComponentType.SURFACE, libraryname: 'pvz', controller: this.surface })
        .width('100%').height('100%')
        .onLoad((context?: object) => {
          if (!context) { this.message = '鸿蒙原生游戏库加载失败'; return; }
          this.game = context as GameHost;
          this.surfaceReady = true;
          this.startOnDesktop();
        })
        .onDestroy(() => this.detach())
        .hitTestBehavior(HitTestMode.None)
      Column() {}
        .width('100%').height('100%')
        .hitTestBehavior(HitTestMode.Block)
        .onMouse((event: MouseEvent) => {
          const action = event.action === MouseAction.Press ? 1 : event.action === MouseAction.Release ? 2 : 0;
          const button = event.button === MouseButton.Right ? 1 : event.button === MouseButton.Middle ? 2 : 0;
          if (action !== 0 && event.button !== MouseButton.Left &&
            event.button !== MouseButton.Right && event.button !== MouseButton.Middle) return;
          this.game?.mouse(action, button, this.getUIContext().vp2px(event.x), this.getUIContext().vp2px(event.y));
        })
        .onHover((hovering: boolean) => {
          if (!hovering) this.game?.mouse(3, 0, 0, 0);
        })
        .onTouch((event: TouchEvent) => {
          if (event.source === SourceType.Mouse) return;
          const kind = event.type === TouchType.Down ? 0 : event.type === TouchType.Move ? 1 : event.type === TouchType.Up ? 2 : 3;
          for (const point of event.changedTouches) {
            this.game?.touch(kind, point.id, this.getUIContext().vp2px(point.x), this.getUIContext().vp2px(point.y));
          }
        })
      if (this.launcherOpen && !this.showLauncher && this.policyReady && !this.bundledPak &&
          (this.needsPak || this.message.length > 0)) {
        Column({ space: 12 }) {
          Text(this.message || '请选择与本版本配套的 main.pak64。').fontColor(Color.White)
          Button('导入 main.pak64').enabled(!this.importingPak).onClick(() => this.importPak())
        }.padding(20)
      } else if (this.showLauncher && this.launcherOpen && this.savePanel) {
        this.SaveManager()
      } else if (this.showLauncher && this.launcherOpen) {
        Scroll() {
          Column({ space: 12 }) {
            Image($r('app.media.startIcon')).width(48).height(48).borderRadius(11)
            Text('Plants vs. Zombies').fontSize(25).fontWeight(FontWeight.Bold).fontColor('#F3F6EC')
            if (this.compatibilityAllowed) {
              Text('选择 Vulkan 后端').fontSize(16).fontColor('#D0D9CA')
              this.VulkanOption('Vulkan 1.3 · Bindless', '1.3')
              this.VulkanOption('Vulkan 1.0 · 兼容模式', '1.0')
            } else if (this.policyReady) {
              Text('Vulkan 1.3 · Bindless').fontSize(16).fontColor('#D0D9CA')
            }
            if (this.message.length > 0) {
              Text(this.message).fontSize(14).fontColor('#FFD1A1').width('100%')
                .textAlign(TextAlign.Center)
            }
            if (this.policyReady && !this.bundledPak) {
              Button('导入 main.pak64').enabled(!this.importingPak).onClick(() => this.importPak())
            }
            Button('开始游戏').fontSize(17).fontWeight(FontWeight.Medium)
              .width('100%').height(46).backgroundColor('#A7CD70').fontColor('#142008')
              .enabled(this.surfaceReady && this.policyReady && !this.needsPak && !this.importingPak)
              .onClick(() => this.launchSelectedBackend())
            Button('存档管理').fontSize(16).fontColor('#EEF3E6')
              .backgroundColor('#27312A').width('100%').height(46)
              .onClick(() => this.openSaves())
          }.width('100%')
            .padding(22).backgroundColor('#141C17').borderRadius(20)
        }.width('90%').constraintSize({ maxWidth: 420, maxHeight: '95%' })
          .scrollBar(BarState.Off)
      } else if (this.message.length > 0) {
        Text(this.message).fontColor(Color.White).fontSize(18).padding(16).hitTestBehavior(HitTestMode.Transparent)
      }
    }.width('100%').height('100%').backgroundColor(Color.Black)
      .id('game-input')
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)
      .onKeyEvent((event: KeyEvent): boolean => {
        if (this.launcherOpen) return false;
        const symbol = keySymbol(event.keyCode);
        let character = event.unicode ?? 0;
        const shortcut = event.getModifierKeyState?.(['ctrl']) || event.getModifierKeyState?.(['alt']);
        if (shortcut) {
          character = 0;
        } else if (character === 0) {
          if (event.keyText.length === 1) {
            character = event.keyText.charCodeAt(0);
          } else if (symbol > 0 && symbol < 128) {
            const upper = (event.getModifierKeyState?.(['shift']) === true) !== (event.isCapsLockOn === true);
            character = upper && symbol >= 97 && symbol <= 122 ? symbol - 32 : symbol;
          }
        }
        if (symbol === 0 && (character < 32 || character > 126)) return false;
        this.game?.key(symbol, event.type === KeyType.Down, character);
        return true;
      })
  }
}
