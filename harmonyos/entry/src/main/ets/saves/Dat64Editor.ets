import { webview } from '@kit.ArkWeb';
import { Dat64Bridge } from './Dat64Bridge';

interface Progress {
  level: number;
  coins: number;
  finished: number;
  records: number[];
  purchases: number[];
  unlocks: boolean[];
  achievements: boolean[];
  plants?: number;
  zombatars?: number;
}
interface ProfileRow { id: number; name: string; progress: Progress; }
interface Lineup { scene: number; rake: number; cells: number[]; }
interface SaveMode { id: number; name: string; checkpoint: boolean; }
interface Preset { name: string; code: string; }
interface Recipe { scene: number; rake: number; cells: number[]; flags: number; seed: number; sun: number; }
interface Request {
  id?: number;
  oldId?: number;
  name?: string;
  patch?: Progress;
  code?: string;
  perfect?: boolean;
  confirm?: boolean;
  recipe?: Recipe;
}
interface EditorData {
  id?: number;
  profiles?: ProfileRow[];
  saves?: string[];
  presets?: Preset[];
  lineup?: Lineup;
  code?: string;
  modes?: SaveMode[];
  message?: string;
  metadata?: Recipe;
}
interface Reply { error?: string; value?: EditorData; }

const ROWS: number[] = [0,1,2,3,4,5];
const COLS: number[] = [0,1,2,3,4,5,6,7,8];
const SCENES: string[] = ['白天','黑夜','泳池','浓雾','屋顶','月夜'];
const LAYERS: string[] = ['植物','底座','南瓜','咖啡豆','梯子'];
const PLANTS: string[] = [
  '豌豆射手','向日葵','樱桃炸弹','坚果','土豆雷','寒冰射手','大嘴花','双发射手',
  '小喷菇','阳光菇','大喷菇','墓碑吞噬者','魅惑菇','胆小菇','寒冰菇','毁灭菇',
  '睡莲','窝瓜','三线射手','缠绕海草','火爆辣椒','地刺','火炬树桩','高坚果',
  '水兵菇','路灯花','仙人掌','三叶草','裂荚射手','杨桃','南瓜头','磁力菇',
  '卷心菜投手','花盆','玉米投手','咖啡豆','大蒜','叶子保护伞','金盏花','西瓜投手',
  '机枪射手','双子向日葵','忧郁菇','香蒲','冰西瓜','吸金磁','地刺王','玉米加农炮'
];
const BASES: string[] = ['无底座','睡莲','花盆','墓碑'];
const SHOP: string[] = [
  '机枪射手','双子向日葵','忧郁菇','香蒲','冰西瓜','吸金磁','地刺王','玉米加农炮','模仿者',
  '额外小推车','金盏花 1','金盏花 2','金盏花 3','金浇水壶','肥料','杀虫剂','留声机','园艺手套',
  '蘑菇园','手推车','蜗牛','额外卡槽次数','泳池清理车','屋顶清理车','钉耙次数','水族馆','巧克力',
  '智慧树','树肥','坚果包扎术'
];
const ACHIEVEMENTS: string[] = [
  '庭院守卫','诺贝尔豌豆奖','死而无憾','瓷器店','土豆雷爆破','爆破专家','植物收集家','不许用豌豆',
  '滚动的脑袋','禁止空运','僵尸学家','小气鬼','阳光灿烂','爆米花派对','早安','无菇之夜',
  '超越坟墓','不朽','智慧高耸','胡子模式'
];
const MAIN_PLANTS: number[] = PLANTS.map((_: string, i: number) => i).filter((i: number) => ![16, 30, 33, 35].includes(i));
const INVENTORY: number[] = [14, 15, 26, 28];
const COUNTS: number[] = [9, 14, 15, 21, 24, 26, 28];
const PAGE_NAMES: string[] = ['用户进度', '布阵与关卡', 'DAT64 文件', '文件名对照'];
const INK: string = '#E6EDF5';
const MUTED: string = '#9DAFC3';
const FRAME: string = '#101923';
const SURFACE: string = '#192736';
const CONTROL: string = '#233649';
const ACCENT: string = '#A6DEBB';
const DETAIL_GROUPS: string[] = ['小游戏／解谜／生存记录', '商店购买与道具', '成就'];

@Extend(Select)
function saveSelect() {
  .backgroundColor(CONTROL).fontColor(INK).font({ size: 14 }).menuBackgroundColor(SURFACE)
  .optionFontColor(INK).selectedOptionFontColor(ACCENT).selectedOptionBgColor(CONTROL)
}

@Component
struct SaveField {
  label: string = '';
  @Prop value: string = '';
  numeric: boolean = false;
  update: (text: string) => void = () => {};

  build() {
    Column({ space: 4 }) {
      Text(this.label).fontSize(13).fontColor(MUTED)
      TextInput({ text: this.value }).width('100%').type(this.numeric ? InputType.Number : InputType.Normal)
        .height(44).backgroundColor(FRAME).fontColor(INK).borderRadius(9).onChange(this.update)
    }.alignItems(HorizontalAlign.Start).width('100%')
  }
}

@Component
export struct Dat64Editor {
  bridge?: Dat64Bridge;
  loadResource?: (url: string) => WebResourceResponse;
  leave?: () => void;
  private browser: webview.WebviewController = new webview.WebviewController();
  private sequence: number = 0;
  private waiting: number = -1;
  private timeout: number = -1;
  private operation: string = '';
  private nextAction?: () => void;
  private previewTimer: number = -1;
  private previewId: number = 0;
  @State past: Lineup[] = [];
  @State future: Lineup[] = [];
  @State lineupName: string = '';
  @State presetIndex: number = -1;
  @State showLimbo: boolean = false;
  @State compact: boolean = false;
  @State landscapePhone: boolean = false;
  @State boardTools: boolean = false;

  @State tab: number = 0;
  @State ready: boolean = false;
  @State busy: boolean = true;
  @State message: string = '正在读取存档…';
  @State confirmText: string = '';
  @State profiles: ProfileRow[] = [];
  @State profileIndex: number = 0;
  @State profileId: string = '';
  @State profileName: string = '';
  @State level: string = '1';
  @State coins: string = '0';
  @State finished: string = '0';
  @State unlocks: boolean[] = [false, false, false];
  @State records: number[] = [];
  @State purchases: number[] = [];
  @State achievements: boolean[] = [];
  @State detailGroup: number = 0;
  @State detailIndex: number = 0;
  @State modes: SaveMode[] = [];
  @State saves: string[] = [];
  @State saveIndex: number = 0;
  @State destination: string = 'game1_58.dat64';
  @State importTarget: string = 'game1_58.dat64';
  @State imported: string = '';
  @State scene: number = 2;
  @State rake: string = '0';
  @State cells: number[] = new Array<number>(54).fill(0);
  @State flags: string = '128';
  @State seed: string = '114514';
  @State sun: string = '9990';
  @State layer: number = 0;
  @State plant: number = 0;
  @State erase: boolean = false;
  @State imitate: boolean = false;
  @State awake: boolean = true;
  @State code: string = '';
  @State presets: Preset[] = [];

  aboutToAppear(): void {
    this.timeout = setTimeout(() => this.fail('存档引擎启动超时。'), 15000);
    this.bridge?.connect((id: number, text: string) => this.reply(id, text), (error: string) => {
      if (error.length > 0) { this.fail(error); return; }
      this.ready = true;
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => this.send('init', {}), 0);
    });
  }

  aboutToDisappear(): void {
    if (this.timeout !== -1) clearTimeout(this.timeout);
    clearTimeout(this.previewTimer);
    this.bridge?.disconnect();
  }

  private fail(message: string): void {
    if (this.timeout !== -1) clearTimeout(this.timeout);
    this.timeout = -1;
    this.waiting = -1;
    this.busy = false;
    this.message = message;
  }

  private send(operation: string, argument: Request): void {
    if (!this.ready || this.waiting !== -1) return;
    this.busy = true;
    this.message = '处理中…';
    this.operation = operation;
    if (operation === 'decode-lineup' || operation === 'extract' || operation === 'encode-lineup' || operation === 'save-lineup') {
      clearTimeout(this.previewTimer);
      this.previewId--;
    }
    const id = ++this.sequence;
    this.waiting = id;
    this.timeout = setTimeout(() => this.fail('存档操作超时。'), 120000);
    const payload = JSON.stringify(JSON.stringify(argument));
    this.browser.runJavaScript('window.nativeDat64Call(' + id + ',' + JSON.stringify(operation) + ',' + payload + ')')
      .catch((error: Error) => { if (this.waiting === id) this.fail(error.message); });
  }

  private reply(id: number, text: string): void {
    if (id < 0) {
      if (id === this.previewId) {
        const result = JSON.parse(text) as Reply;
        if (result.value?.code !== undefined) this.setCode(result.value.code);
      }
      return;
    }
    if (id !== this.waiting) return;
    if (this.timeout !== -1) clearTimeout(this.timeout);
    this.timeout = -1;
    this.waiting = -1;
    this.busy = false;
    try {
      const result = JSON.parse(text) as Reply;
      if (result.error) { this.fail(result.error); return; }
      const data = result.value;
      if (data) {
        if (data.profiles) {
          const selected = data.id ?? this.profiles[this.profileIndex]?.id;
          this.profiles = data.profiles;
          const index = this.profiles.findIndex((row: ProfileRow) => row.id === selected);
          this.loadProfile(Math.max(0, index));
        }
        if (data.saves) {
          const selected = this.saves[this.saveIndex];
          this.saves = data.saves;
          this.saveIndex = Math.max(0, this.saves.indexOf(selected));
        }
        if (data.presets) this.presets = data.presets;
        if (data.modes) this.modes = data.modes;
        const lineup = data.metadata ?? data.lineup;
        if (lineup) {
          if (this.operation !== 'init') this.checkpoint();
          this.applyLineup(lineup);
        }
        if (data.metadata) {
          this.flags = String(data.metadata.flags);
          this.seed = String(data.metadata.seed);
          this.sun = String(data.metadata.sun);
          this.destination = this.saves[this.saveIndex] ?? this.destination;
          this.boardTools = false;
          this.tab = 1;
        }
        if (data.code !== undefined) this.setCode(data.code);
        else if (lineup) this.refreshCode();
        else if (data.presets) this.setCode(this.code);
      }
      if (data?.message) this.message = data.message;
      else if (this.operation === 'init') this.message = '';
      else if (this.operation === 'export' || this.operation === 'export-users') this.message = '已打开系统分享。';
      else if (this.operation === 'generate') this.message = '已生成 ' + this.destination.trim();
      else if (this.operation === 'import') this.message = '已校验并导入 ' + this.importTarget;
      else this.message = '已完成。';
    } catch (error) {
      this.fail((error as Error).message);
    }
  }

  private async chooseImport(json: boolean = false): Promise<void> {
    if (!this.bridge || this.busy) return;
    this.busy = true;
    try {
      const picked = await this.bridge.choose(json);
      if (json) {
        if (picked) this.confirm('用 ' + picked + ' 替换阵型列表？当前布阵和 DAT64 会保留。', () => this.send('import-lineups', {}));
        return;
      }
      if (!picked) return;
      this.imported = picked;
      if (/^(game[1-9]\d*_\d+|user[1-9]\d*)\.dat64$/.test(this.imported)) {
        this.importTarget = this.imported;
      }
      this.message = this.imported ? '已选择 ' + this.imported : '';
    } catch (error) {
      if (!json) this.imported = '';
      this.message = (error as Error).message;
    } finally {
      this.busy = false;
    }
  }

  private loadProfile(index: number): void {
    this.profileIndex = index;
    const row = this.profiles[index];
    if (!row) return;
    this.profileId = String(row.id);
    this.profileName = row.name;
    this.level = String(row.progress.level);
    this.coins = String(row.progress.coins);
    this.finished = String(row.progress.finished);
    this.unlocks = row.progress.unlocks.slice();
    this.records = row.progress.records.slice();
    this.purchases = row.progress.purchases.slice();
    this.achievements = row.progress.achievements.slice();
    this.detailIndex = 0;
  }

  private options(labels: string[]): SelectOption[] {
    return labels.map((label: string): SelectOption => ({ value: label }));
  }

  private recipe(): Recipe {
    return { scene: this.scene, rake: Number(this.rake), cells: this.cells,
      flags: Number(this.flags), seed: Number(this.seed), sun: Number(this.sun) };
  }

  private confirm(text: string, operation: () => void): void {
    this.confirmText = text;
    this.nextAction = operation;
  }

  private closeConfirmation(apply: boolean): void {
    const run = this.nextAction;
    this.confirmText = '';
    this.nextAction = undefined;
    if (apply) run?.();
  }

  private profileSave(): void {
    const selected = this.profiles[this.profileIndex];
    if (!selected) return;
    const patch: Progress = { level: Number(this.level), coins: Number(this.coins),
      finished: Number(this.finished), records: this.records, purchases: this.purchases,
      unlocks: this.unlocks, achievements: this.achievements };
    const id = Number(this.profileId);
    const save = () => this.send('edit-user', { oldId: selected.id, id, name: this.profileName, patch });
    if (id !== selected.id) this.confirm('将用户 ID 改为 ' + id + '？所属关卡文件会一并改名。', save);
    else save();
  }

  private plantChoices(): string[] {
    if (this.layer === 0) return MAIN_PLANTS.map((id: number) => PLANTS[id]);
    if (this.layer === 1) return BASES;
    return [LAYERS[this.layer]];
  }

  private setCode(code: string): void {
    this.code = code;
    this.presetIndex = this.presets.findIndex((item: Preset) => item.code === code);
  }

  private lineup(): Lineup {
    return { scene: this.scene, rake: Number(this.rake), cells: this.cells.slice() };
  }

  private applyLineup(lineup: Lineup): void {
    this.scene = lineup.scene;
    this.rake = String(lineup.rake);
    this.cells = lineup.cells.slice();
  }

  private checkpoint(): void {
    this.past = [...this.past.slice(-99), this.lineup()];
    this.future = [];
  }

  private history(undo: boolean): void {
    const source = undo ? this.past : this.future;
    const next = source[source.length - 1];
    if (!next) return;
    if (undo) {
      this.past = source.slice(0, -1);
      this.future = [...this.future, this.lineup()];
    } else {
      this.future = source.slice(0, -1);
      this.past = [...this.past, this.lineup()];
    }
    this.applyLineup(next);
    this.refreshCode();
  }

  private refreshCode(): void {
    clearTimeout(this.previewTimer);
    const id = --this.previewId;
    this.presetIndex = -1;
    const lineup = this.lineup();
    this.previewTimer = setTimeout(() => {
      this.browser.runJavaScript('window.nativeDat64Preview(' + id + ',' + JSON.stringify(lineup) + ')').catch(() => {});
    }, 70);
  }

  private changeScene(scene: number): void {
    const six = scene === 2 || scene === 3;
    if (!six && this.cells.slice(45).some((value: number) => value !== 0)) {
      this.message = '请先清空第六排。';
      return;
    }
    this.checkpoint();
    this.scene = scene;
    const rake = Number(this.rake);
    if (rake > (six ? 6 : 5) || (six && (rake === 3 || rake === 4))) this.rake = '0';
    this.refreshCode();
  }

  private changeRake(rake: string): void {
    this.checkpoint();
    this.rake = rake;
    this.refreshCode();
  }

  private rakeOptions(): string[] {
    return this.scene === 2 || this.scene === 3 ? ['0','1','2','5','6'] : ['0','1','2','3','4','5'];
  }

  private plantLabel(value: number): string {
    const plant = (value >>> 10) - 1;
    return plant < 0 ? '' : PLANTS[plant];
  }

  private layersLabel(value: number): string {
    const base = (value >>> 6) & 3;
    return [base ? BASES[base] : '', value & 512 ? '仿' : '', (value >>> 10) && !(value & 256) ? '眠' : '',
      value & 16 ? '南瓜' : '', value & 4 ? '咖啡' : '', value & 1 ? '梯' : ''].filter((label: string) => label.length > 0).join(' ');
  }

  private tileColor(row: number, col: number): string {
    const alternate = (row + col) % 2 === 0;
    if (this.scene >= 4) return alternate ? '#6C4D3F' : '#614437';
    if ((this.scene === 2 || this.scene === 3) && (row === 2 || row === 3)) return alternate ? '#235970' : '#1F4C60';
    if (this.scene === 1 || this.scene === 3) return alternate ? '#324D42' : '#294137';
    return alternate ? '#385B45' : '#304E3B';
  }

  private paint(row: number, column: number, remove: boolean): void {
    const index = row * 9 + column;
    let value = this.cells[index];
    const im = this.imitate ? 1 : 0;
    if (this.layer === 0) value = (value & 255) | (remove ? 0 : ((MAIN_PLANTS[this.plant] + 1) << 10) | (im << 9) | (this.awake ? 256 : 0));
    else if (this.layer === 1) value = (value & ~224) | (remove ? 0 : (this.plant << 6) | (this.plant === 3 ? 0 : im << 5));
    else if (this.layer === 2) value = (value & ~24) | (remove ? 0 : 16 | (im << 3));
    else if (this.layer === 3) value = (value & ~6) | (remove ? 0 : 4 | (im << 1));
    else value = (value & ~1) | (remove ? 0 : 1);
    if (value === this.cells[index]) return;
    this.checkpoint();
    const next = this.cells.slice();
    next[index] = value;
    this.cells = next;
    this.refreshCode();
  }

  private recordModes(): SaveMode[] {
    return this.modes.filter((mode: SaveMode) => mode.id > 0 && mode.id <= 71 && ![34,35].includes(mode.id));
  }

  private recordLabel(mode: SaveMode): string {
    if (mode.id === 71) return '智慧树高度';
    return mode.name + (mode.id >= 56 && mode.id <= 70 ? '（旗数）' : '（完成次数）');
  }

  private detailLabels(): string[] {
    return this.detailGroup === 0 ? this.recordModes().map((mode: SaveMode) => this.recordLabel(mode)) :
      this.detailGroup === 1 ? SHOP : ACHIEVEMENTS;
  }

  private purchaseValue(): number {
    const value = this.purchases[this.detailIndex] ?? 0;
    return INVENTORY.includes(this.detailIndex) ? Math.max(0, value - 1000) : value;
  }

  private updatePurchase(value: number): void {
    const i = this.detailIndex;
    const next = this.purchases.slice();
    if (INVENTORY.includes(i)) {
      const original = this.profiles[this.profileIndex].progress.purchases[i];
      next[i] = value === Math.max(0, original - 1000) ? original : value ? 1000 + value : 0;
    } else {
      next[i] = value;
    }
    this.purchases = next;
  }

  private guideModes(): SaveMode[] {
    return this.modes.filter((mode: SaveMode) => (mode.id >= 21 && mode.id <= 33 ||
      [56,57,59,60].includes(mode.id)) === this.showLimbo);
  }

  private slotLabel(): string {
    const slot = /^game([1-9]\d*)_(\d+)\.dat64$/.exec(this.destination.trim());
    if (!slot) return '格式为 game用户ID_模式编号.dat64';
    const mode = this.modes[Number(slot[2])];
    if (!mode) return '找不到对应模式';
    const level = mode.id === 0 ? this.profiles.find((row: ProfileRow) => row.id === Number(slot[1]))?.progress.level : undefined;
    return '用户 ' + slot[1] + ' · ' + mode.name +
      (level ? ' · ' + (Math.floor((level - 1) / 10) + 1) + '-' + ((level - 1) % 10 + 1) : '') +
      (mode.checkpoint ? '' : ' · 无独立战斗存档');
  }

  @Builder
  Title(title: string) {
    Text(title).fontSize(18).fontWeight(FontWeight.Bold).fontColor(INK).width('100%')
  }

  @Builder
  Hint(text: string) {
    Text(text).fontSize(13).fontColor(MUTED).width('100%')
  }

  @Builder
  Action(title: string, run: () => void, primary: boolean = false) {
    Button(title).fontSize(14).height(44).borderRadius(10).width('100%')
      .backgroundColor(primary ? ACCENT : CONTROL).fontColor(primary ? '#10271C' : INK)
      .onClick(run)
  }

  @Builder
  ProfileBasics() {
    Column({ space: 10 }) {
      this.Title('基本进度')
      SaveField({ label: '用户名（ASCII）', value: this.profileName, update: (s: string) => { this.profileName = s; } })
      SaveField({ label: '用户 ID', value: this.profileId, update: (s: string) => { this.profileId = s; }, numeric: true })
      SaveField({ label: '冒险当前关卡（1–50）', value: this.level, update: (s: string) => { this.level = s; }, numeric: true })
      SaveField({ label: '金币', value: this.coins, update: (s: string) => { this.coins = s; }, numeric: true })
      SaveField({ label: '冒险通关次数', value: this.finished, update: (s: string) => { this.finished = s; }, numeric: true })
      Text('保留 ' + this.profiles[this.profileIndex].progress.plants + ' 株花园植物、' +
        this.profiles[this.profileIndex].progress.zombatars + ' 份大头贴。金币以 10 为单位。')
        .fontSize(13).fontColor(MUTED).width('100%')
    }.width('100%')
  }

  @Builder
  ProfileDetails() {
    Column({ space: 10 }) {
      this.Title('解锁、记录与成就')
      Row({ space: 8 }) {
        ForEach(['小游戏','解谜','生存'], (name: string, index: number) => {
          Button((this.unlocks[index] ? '✓ ' : '') + name).layoutWeight(1).padding(0).fontSize(13)
            .backgroundColor(this.unlocks[index] ? ACCENT : CONTROL)
            .fontColor(this.unlocks[index] ? '#10271C' : INK).onClick(() => {
            const next = this.unlocks.slice();
            next[index] = !next[index];
            this.unlocks = next;
          })
        }, (name: string) => name)
      }.width('100%')
      Select(this.options(DETAIL_GROUPS))
        .saveSelect().value(DETAIL_GROUPS[this.detailGroup]).selected(this.detailGroup).onSelect((i: number) => { this.detailGroup = i; this.detailIndex = 0; })
        .width('100%')
      Select(this.options(this.detailLabels()))
        .saveSelect().value(this.detailLabels()[this.detailIndex]).selected(this.detailIndex).onSelect((i: number) => { this.detailIndex = i; }).width('100%')
      if (this.detailGroup === 2) {
        Button(this.achievements[this.detailIndex] ? '已获得 · 点击取消' : '待获得 · 点击标记').backgroundColor(CONTROL).onClick(() => {
          const next = this.achievements.slice();
          next[this.detailIndex] = !next[this.detailIndex];
          this.achievements = next;
        })
      } else if (this.detailGroup === 1 && !COUNTS.includes(this.detailIndex)) {
        Button(this.purchaseValue() > 0 ? '已购买' : '未购买').backgroundColor(CONTROL).onClick(() => {
          this.updatePurchase(this.purchaseValue() > 0 ? 0 : this.profiles[this.profileIndex].progress.purchases[this.detailIndex] || 1);
        })
      } else if (this.detailGroup === 1) {
        SaveField({ label: '数量', value: String(this.purchaseValue()), update: (s: string) => this.updatePurchase(Number(s)), numeric: true })
      } else {
        SaveField({ label: '记录值', value: String(this.records[this.recordModes()[this.detailIndex]?.id] ?? 0), update: (s: string) => {
            const mode = this.recordModes()[this.detailIndex];
            if (!mode) return;
            const next = this.records.slice();
            next[mode.id] = Number(s);
            this.records = next;
          }, numeric: true })
      }
    }.width('100%')
  }

  @Builder
  ProfilePage() {
    Column({ space: 12 }) {
      this.Title('用户与进度')
      if (this.profiles.length === 0) this.Hint('还没有游戏用户。新增一个用户后即可编辑进度和生成关卡。')
      Row({ space: 8 }) {
        Column() { this.Action('新增用户', () => this.send('add-user', {})) }.layoutWeight(1)
        Column() { this.Action('新增完美存档', () => this.send('add-user', { perfect: true })) }.layoutWeight(1)
      }.width('100%')
      if (this.profiles.length > 0) {
        Select(this.options(this.profiles.map((row: ProfileRow): string => row.name + ' · ID ' + row.id)))
          .saveSelect().selected(this.profileIndex)
          .value(this.profiles[this.profileIndex].name + ' · ID ' + this.profiles[this.profileIndex].id)
          .onSelect((index: number) => this.loadProfile(index)).width('100%')
        if (!this.compact || this.landscapePhone) {
          Row({ space: 12 }) {
            Column() { this.ProfileBasics() }.layoutWeight(1).padding(12).borderRadius(10).backgroundColor(FRAME)
            Column() { this.ProfileDetails() }.layoutWeight(1).padding(12).borderRadius(10).backgroundColor(FRAME)
          }.width('100%').alignItems(VerticalAlign.Top)
        } else {
          this.ProfileBasics()
          Divider().color(CONTROL)
          this.ProfileDetails()
        }
        this.Action('保存当前用户修改', () => this.profileSave(), true)
        Row({ space: 8 }) {
          Column() { this.Action('分享用户资料', () => this.send('export-users', {})) }.layoutWeight(1)
          Column() {
            this.Action('删除用户及关卡', () => this.confirm('删除当前用户及其全部关卡存档？',
              () => this.send('delete-user', { id: this.profiles[this.profileIndex].id })))
          }.layoutWeight(1)
        }.width('100%')
      }
    }.width('100%')
  }

  @Builder
  ScenePicker() {
    Select(this.options(SCENES)).saveSelect().value(SCENES[this.scene]).selected(this.scene).width('100%')
      .onSelect((i: number) => this.changeScene(i))
  }

  @Builder
  LayerPicker() {
    Select(this.options(LAYERS)).saveSelect().value(LAYERS[this.layer]).selected(this.layer).width('100%')
      .onSelect((i: number) => {
        this.layer = i;
        this.plant = 0;
      })
  }

  @Builder
  PlantPicker() {
    Select(this.options(this.plantChoices())).saveSelect().value(this.plantChoices()[this.plant]).selected(this.plant)
      .width('100%').onSelect((i: number) => { this.plant = i; })
  }

  @Builder
  RakePicker() {
    Select(this.options(this.rakeOptions())).saveSelect()
      .value(this.rake === '0' ? '无钉耙' : '钉耙 · 第 ' + this.rake + ' 排').width('100%')
      .onSelect((i: number) => this.changeRake(this.rakeOptions()[i]))
  }

  @Builder
  BrushHistory() {
    Row({ space: 6 }) {
      Button(this.erase ? '擦除中' : '画笔').layoutWeight(1).padding(0).fontSize(13)
        .backgroundColor(this.erase ? ACCENT : CONTROL)
        .fontColor(this.erase ? '#10271C' : INK).onClick(() => { this.erase = !this.erase; })
      Button('撤销').layoutWeight(1).padding(0).fontSize(13).backgroundColor(CONTROL).enabled(this.past.length > 0)
        .onClick(() => this.history(true))
      Button('重做').layoutWeight(1).padding(0).fontSize(13).backgroundColor(CONTROL).enabled(this.future.length > 0)
        .onClick(() => this.history(false))
    }.width('100%')
  }

  @Builder
  BrushFlags() {
    Row({ space: 6 }) {
      Button(this.imitate ? '模仿：开' : '模仿：关').layoutWeight(1).padding(0).fontSize(13).backgroundColor(CONTROL)
        .enabled(this.layer !== 4 && !(this.layer === 1 && this.plant === 3))
        .onClick(() => { this.imitate = !this.imitate; })
      Button(this.awake ? '清醒' : '睡眠').layoutWeight(1).padding(0).fontSize(13).backgroundColor(CONTROL)
        .enabled(this.layer === 0).onClick(() => { this.awake = !this.awake; })
    }.width('100%')
  }

  @Builder
  BrushBar() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Column() { this.ScenePicker() }.layoutWeight(1)
        Column() { this.LayerPicker() }.layoutWeight(1)
        Column() { this.PlantPicker() }.layoutWeight(2)
      }.width('100%')
      Row({ space: 8 }) {
        Column() { this.BrushHistory() }.layoutWeight(3)
        Column() { this.BrushFlags() }.layoutWeight(2)
      }.width('100%')
    }.width('100%')
  }

  @Builder
  Lawn() {
    Column({ space: 3 }) {
      ForEach(ROWS.slice(0, this.scene === 2 || this.scene === 3 ? 6 : 5), (row: number) => {
        Row({ space: 3 }) {
          ForEach(COLS, (col: number) => {
            Column({ space: 2 }) {
              Text(this.plantLabel(this.cells[row * 9 + col]) || (this.cells[row * 9 + col] ? '' : '·'))
                .fontSize(this.compact ? 11 : 15).fontColor(INK).fontWeight(FontWeight.Medium)
                .textAlign(TextAlign.Center).maxLines(2).textOverflow({ overflow: TextOverflow.Ellipsis })
              if (this.layersLabel(this.cells[row * 9 + col])) {
                Text(this.layersLabel(this.cells[row * 9 + col])).fontSize(this.compact ? 9 : 11)
                  .textAlign(TextAlign.Center).fontColor('#F4DDB0').maxLines(1)
              }
            }.height(this.landscapePhone ? 32 : this.compact ? 44 : 60).layoutWeight(1).borderRadius(5)
              .justifyContent(FlexAlign.Center).backgroundColor(this.tileColor(row, col))
              .accessibilityText((row + 1) + '排' + (col + 1) + '列 ' +
                (this.plantLabel(this.cells[row * 9 + col]) + ' ' + this.layersLabel(this.cells[row * 9 + col])).trim())
              .focusable(true)
              .onClick((event: ClickEvent) => this.paint(row, col,
                this.erase || event.getModifierKeyState?.(['shift']) === true))
              .onMouse((event: MouseEvent) => {
                if (event.button === MouseButton.Right && event.action === MouseAction.Release) this.paint(row, col, true);
              })
          }, (col: number) => String(col))
        }.width('100%')
      }, (row: number) => String(row))
    }.width('100%').padding(4).borderRadius(10).backgroundColor(FRAME)
  }

  @Builder
  LineupPanel() {
    Column({ space: 12 }) {
      this.Title('阵型库')
      if (this.presets.length > 0) {
        Select(this.options(this.presets.map((preset: Preset): string => preset.name)))
          .saveSelect().selected(this.presetIndex)
          .value(this.presets[this.presetIndex]?.name ?? '选择阵型').width('100%')
          .onSelect((i: number) => this.send('decode-lineup', { code: this.presets[i].code }))
      }
      SaveField({ label: 'Toolkit 阵型码', value: this.code, update: (s: string) => this.setCode(s) })
      this.Action('读取阵型码', () => this.send('decode-lineup', { code: this.code }))
      SaveField({ label: '阵型名称', value: this.lineupName, update: (s: string) => { this.lineupName = s; } })
      this.Action('保存到阵型列表', () => this.send('save-lineup', {
        name: this.lineupName.trim() || '我的阵型', recipe: this.recipe()
      }))
      if (this.presetIndex >= 0) {
        this.Action('删除所选阵型', () => {
          const item = this.presets[this.presetIndex];
          this.confirm('从阵型列表删除“' + item.name + '”？', () => this.send('delete-lineup', { code: item.code }));
        })
      }
      this.Action('导入阵型库 JSON', () => { this.chooseImport(true); })
      this.Action('分享阵型库 JSON', () => this.send('export-lineups', {}))
    }.width('100%')
  }

  @Builder
  GeneratePanel() {
    Column({ space: 12 }) {
      this.Title('生成关卡')
      SaveField({ label: '已完成旗数', value: this.flags, update: (s: string) => { this.flags = s; }, numeric: true })
      SaveField({ label: '随机数种子', value: this.seed, update: (s: string) => { this.seed = s; } })
      SaveField({ label: '初始阳光', value: this.sun, update: (s: string) => { this.sun = s; }, numeric: true })
      SaveField({ label: '目标槽位', value: this.destination, update: (s: string) => { this.destination = s; } })
      Text(this.slotLabel()).fontSize(13).fontColor(MUTED).width('100%')
      this.Action('分享布阵 JSON', () => this.send('export-recipe', { recipe: this.recipe() }))
      this.Action('生成并写入 DAT64', () => {
        const name = this.destination.trim();
        if (this.saves.includes(name)) this.confirm('覆盖 ' + name + '？',
          () => this.send('generate', { name, recipe: this.recipe() }));
        else this.send('generate', { name, recipe: this.recipe() });
      }, true)
    }.width('100%')
  }

  @Builder
  BoardCanvas() {
    Column({ space: 10 }) {
      this.BrushBar()
      Row({ space: 8 }) {
        Column() { this.RakePicker() }.layoutWeight(1)
        if (this.compact) {
          Button('阵型库与生成').layoutWeight(1).backgroundColor(CONTROL)
            .onClick(() => { this.boardTools = true; })
        }
      }.width('100%')
      this.Lawn()
      if (!this.compact) this.Hint('底座与附加物可以独立编辑。阵型码保留布阵。')
    }.width('100%')
  }

  @Builder
  PhoneLandscapeBoard() {
    Row({ space: 12 }) {
      Column() { this.Lawn() }.layoutWeight(1)
      Column({ space: 6 }) {
        Row({ space: 5 }) {
          Column() { this.ScenePicker() }.layoutWeight(1)
          Column() { this.LayerPicker() }.layoutWeight(1)
        }.width('100%')
        this.PlantPicker()
        this.BrushHistory()
        this.BrushFlags()
        Row({ space: 5 }) {
          Column() { this.RakePicker() }.layoutWeight(1)
          Button('阵型与生成').fontSize(12).padding(0).height(40).layoutWeight(1)
            .backgroundColor(ACCENT).fontColor('#10271C').onClick(() => { this.boardTools = true; })
        }.width('100%')
      }.width(206)
    }.width('100%').alignItems(VerticalAlign.Top)
  }

  @Builder
  BoardPage() {
    if (this.compact) {
      Column({ space: 12 }) {
        if (this.boardTools) {
          this.Action('返回布阵', () => { this.boardTools = false; })
          if (this.landscapePhone) {
            Row({ space: 14 }) {
              Column() { this.LineupPanel() }.layoutWeight(1)
              Column() { this.GeneratePanel() }.layoutWeight(1)
            }.width('100%').alignItems(VerticalAlign.Top)
          } else {
            this.LineupPanel()
            Divider().color(CONTROL)
            this.GeneratePanel()
          }
        } else if (this.landscapePhone) {
          this.PhoneLandscapeBoard()
        } else {
          this.BoardCanvas()
        }
      }.width('100%')
    }
  }

  @Builder
  DesktopBoard() {
    Row({ space: 14 }) {
      Scroll() {
        Column() { this.BoardCanvas() }.width('100%').padding(14)
      }.layoutWeight(1).height('100%').align(Alignment.Top).scrollBar(BarState.Auto)
        .borderRadius(14).backgroundColor(SURFACE)
      Scroll() {
        Column({ space: 16 }) {
          this.LineupPanel()
          Divider().color(CONTROL)
          this.GeneratePanel()
        }.width('100%').padding(14)
      }.width(304).height('100%').align(Alignment.Top).scrollBar(BarState.Auto)
        .borderRadius(14).backgroundColor(SURFACE)
    }.width('100%').layoutWeight(1).alignItems(VerticalAlign.Top).enabled(this.ready && !this.busy)
  }

  @Builder
  GuidePage() {
    Column({ space: 10 }) {
      this.Title('存档文件名与关卡')
      this.Hint('users.dat 是用户列表。user用户ID.dat64 是用户进度。game用户ID_模式编号.dat64 是战斗存档。')
      this.Hint('冒险共用模式 0，关卡号取自用户进度。不同模式的内部状态各自校验。')
      Button(this.showLimbo ? '返回常规关卡' : '查看 Limbo 关卡').fontSize(14).height(44).borderRadius(10)
        .width('100%').backgroundColor(CONTROL).fontColor(INK).onClick(() => { this.showLimbo = !this.showLimbo; })
      ForEach(this.guideModes(), (mode: SaveMode) => {
        Row({ space: 12 }) {
          Text(String(mode.id)).width(42).fontColor(ACCENT)
          Text(mode.name).layoutWeight(1).fontColor(INK)
          Text(mode.checkpoint ? 'game1_' + mode.id + '.dat64' : '无独立存档').fontSize(12).fontColor(MUTED)
        }.width('100%').padding(9).borderRadius(6).backgroundColor(FRAME)
      }, (mode: SaveMode) => String(mode.id))
    }.width('100%')
  }

  @Builder
  FilesPage() {
    Column({ space: 12 }) {
      this.Title('现有关卡')
      if (this.saves.length > 0) {
        Select(this.options(this.saves)).saveSelect().selected(this.saveIndex).value(this.saves[this.saveIndex]).width('100%')
          .onSelect((i: number) => { this.saveIndex = i; })
        this.Action('提取到布阵区', () => this.send('extract', { name: this.saves[this.saveIndex] }), true)
        this.Action('修复植物动画卡死并分享副本',
          () => this.send('repair-plant-attacks', { name: this.saves[this.saveIndex] }))
        this.Action('分享所选 DAT64', () => this.send('export', { name: this.saves[this.saveIndex] }))
      } else {
        this.Hint('还没有关卡存档。可以导入 DAT64 或在布阵页生成。')
      }
      Divider().color(CONTROL)
      this.Title('导入 DAT64')
      this.Action('选择 DAT64 文件', () => { this.chooseImport(); })
      if (this.imported.length > 0) {
        Text(this.imported).fontColor('#C9D5C4')
        SaveField({ label: '导入目标文件名', value: this.importTarget, update: (s: string) => { this.importTarget = s; } })
        Button('校验并导入').width('100%').onClick(() => this.confirm('将选中的文件导入 ' + this.importTarget + '？',
          () => this.send('import', { name: this.importTarget, confirm: true })))
      }
    }.width('100%')
  }

  build() {
    Column({ space: 8 }) {
      Web({ src: 'https://pvz-save.invalid/engine.html', controller: this.browser })
        .width(1).height(1).opacity(0).hitTestBehavior(HitTestMode.None).accessibilityLevel('no-hide-descendants')
        .javaScriptAccess(true).domStorageAccess(true).fileAccess(false)
        .onLoadIntercept(event => event.data.getRequestUrl() !== 'https://pvz-save.invalid/engine.html')
        .onInterceptRequest(event => this.loadResource !== undefined ?
          this.loadResource(event.request.getRequestUrl()) : new WebResourceResponse())
        .javaScriptProxy({
          object: this.bridge as Dat64Bridge, name: 'ArkSave',
          methodList: ['command','deliver','serviceReady'], asyncMethodList: ['action'], controller: this.browser
        })
      Row({ space: 12 }) {
        Button('返回启动器').height(this.compact ? 36 : 42).backgroundColor(CONTROL)
          .enabled(!this.busy || !this.ready).onClick(() => this.leave?.())
        Text('自定义存档').fontSize(this.compact ? 19 : 25).fontWeight(FontWeight.Bold).fontColor(INK)
          .layoutWeight(1)
      }.width('100%')
      Row({ space: 4 }) {
        ForEach(PAGE_NAMES, (title: string, index: number) => {
          Button(title).layoutWeight(1).height(this.compact ? 38 : 44).borderRadius(9)
            .fontSize(this.compact ? 12 : 15).padding(0)
            .backgroundColor(this.tab === index ? ACCENT : 'transparent')
            .fontColor(this.tab === index ? '#10271C' : MUTED)
            .onClick(() => { this.tab = index; })
        }, (title: string) => title)
      }.width('100%').padding(4).backgroundColor(FRAME).borderRadius(12)
        .enabled(this.ready && !this.busy && this.confirmText.length === 0)
      if (this.confirmText) {
        Column({ space: 14 }) {
          this.Title('确认操作')
          Text(this.confirmText).width('100%').fontColor(INK).fontSize(16)
          Row({ space: 8 }) {
            Button('取消').layoutWeight(1).backgroundColor(CONTROL).onClick(() => this.closeConfirmation(false))
            Button('确认').layoutWeight(1).backgroundColor(ACCENT).fontColor('#10271C')
              .onClick(() => this.closeConfirmation(true))
          }.width('100%')
        }.padding(16).width('100%').backgroundColor(SURFACE).borderRadius(12)
      } else if (this.tab === 1 && !this.compact) {
        this.DesktopBoard()
      } else {
        Scroll() {
          Column() {
            if (this.tab === 0) this.ProfilePage()
            else if (this.tab === 1) this.BoardPage()
            else if (this.tab === 2) this.FilesPage()
            else this.GuidePage()
          }.width('100%').padding(this.compact ? 10 : 18).backgroundColor(SURFACE).borderRadius(14)
        }.width('100%').layoutWeight(1).scrollBar(BarState.Auto).enabled(this.ready && !this.busy)
      }
      if (this.message) {
        Text(this.message).width('100%').fontSize(13).fontColor(ACCENT)
      }
    }.padding(this.compact ? 10 : 18).width('100%').height('100%').constraintSize({ maxWidth: 1220 })
      .backgroundColor(FRAME)
      .onAreaChange((_: Area, area: Area) => {
        const compact = Number(area.width) < 825 || Number(area.height) < 520;
        if (compact !== this.compact) this.compact = compact;
        const landscapePhone = compact && Number(area.width) >= 620;
        if (landscapePhone !== this.landscapePhone) this.landscapePhone = landscapePhone;
      })
  }
}
