import { common } from '@kit.AbilityKit';
import { fileIo as fs, fileUri, picker } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor as utd } from '@kit.ArkData';

interface BridgeReply {
  value: string;
  error: string;
}

const SAVE: RegExp = /^(users\.dat|user[1-9][0-9]{0,9}\.dat64|game[1-9][0-9]{0,9}_[0-9]{1,3}\.dat64)$/;
const SHARE: RegExp = /^(users\.dat|user[1-9][0-9]{0,9}\.dat64|game[1-9][0-9]{0,9}_[0-9]{1,3}(\.repaired)?\.dat64|pvz-lineup(s)?\.json)$/;
const LIMIT: number = 32 * 1024 * 1024;
const CHUNK: number = 128 * 1024;

export class Dat64Bridge {
  private context: common.UIAbilityContext;
  private current: string;
  private transaction: string;
  private staged: string;
  private shareFolder: string;
  private opened: boolean = false;
  private writing: boolean = false;
  private selected: string = '';
  private selectedJson: string = '';
  private shareDraft: string = '';
  private receive?: (id: number, reply: string) => void;
  private readyCallback?: (error: string) => void;
  private base64: util.Base64Helper = new util.Base64Helper();

  constructor(context: common.UIAbilityContext) {
    this.context = context;
    this.current = context.filesDir + '/userdata';
    this.transaction = context.filesDir + '/dat64-edit';
    this.staged = this.transaction + '/userdata';
    this.shareFolder = context.cacheDir + '/dat64-share';
  }

  open(): void {
    this.recover();
    this.opened = true;
  }

  close(): void {
    this.opened = false;
    this.writing = false;
    this.selected = '';
    this.selectedJson = '';
    this.shareDraft = '';
    this.recover();
  }

  recover(): void {
    if (!fs.accessSync(this.transaction)) return;
    const previous = this.transaction + '/previous';
    if (fs.accessSync(previous) && !fs.accessSync(this.current)) fs.renameSync(previous, this.current);
    fs.rmdirSync(this.transaction);
  }

  connect(receive: (id: number, reply: string) => void, ready: (error: string) => void): void {
    this.receive = receive;
    this.readyCallback = ready;
  }

  disconnect(): void {
    this.receive = undefined;
    this.readyCallback = undefined;
  }

  deliver(id: number, reply: string): void {
    if (this.opened) this.receive?.(id, reply);
  }

  serviceReady(error: string): void {
    if (this.opened) this.readyCallback?.(error);
  }

  command(op: string, name: string, data: string, offset: number, first: boolean): string {
    const result: BridgeReply = { value: '', error: '' };
    try {
      if (op === 'list') result.value = this.list();
      else if (op === 'read') result.value = this.read(name, offset);
      else if (op === 'begin') this.begin();
      else if (op === 'write') this.write(name, data, first);
      else if (op === 'drop') this.drop(name);
      else if (op === 'finish') this.finish();
      else if (op === 'abort') this.abort();
      else if (op === 'shareChunk') this.shareChunk(name, data, first);
      else throw new Error('未知存档操作。');
    } catch (error) {
      result.error = (error as Error).message || '存档操作失败。';
    }
    return JSON.stringify(result);
  }

  async action(op: string, name: string): Promise<string> {
    const result: BridgeReply = { value: '', error: '' };
    try {
      if (op === 'share') await this.share(name);
      else if (op === 'sharePrepared') await this.sharePrepared(name);
      else throw new Error('未知存档操作。');
    } catch (error) {
      result.error = (error as Error).message || '存档操作失败。';
    }
    return JSON.stringify(result);
  }

  private requireOpen(): void {
    if (!this.opened) throw new Error('存档编辑器已关闭。');
  }

  private name(name: string): string {
    if (!SAVE.test(name)) throw new Error('不是可编辑的存档文件名。');
    return name;
  }

  list(): string {
    this.requireOpen();
    if (!fs.accessSync(this.current)) return '[]';
    return JSON.stringify(fs.listFileSync(this.current).filter((name: string) => SAVE.test(name)
      && fs.statSync(this.current + '/' + name).isFile()).sort());
  }

  read(name: string, offset: number): string {
    this.requireOpen();
    if (!Number.isSafeInteger(offset) || offset < 0 || offset > LIMIT) throw new Error('读取位置无效。');
    const json = name === '@lineups';
    const path = json ? this.selectedJson : name === '@import' ? this.selected : this.current + '/' + this.name(name);
    if (!path) throw new Error(json ? '请先选择阵型库 JSON。' : '请先选择 DAT64 文件。');
    const f = fs.openSync(path, fs.OpenMode.READ_ONLY);
    try {
      const size = fs.statSync(f.fd).size;
      if (json && size > 1024 * 1024) throw new Error('阵型库 JSON 超过 1 MiB。');
      if (size < 1 || size > LIMIT) throw new Error('存档为空或超过 32 MiB。');
      if (offset >= size) return '';
      const buffer = new ArrayBuffer(Math.min(CHUNK, size - offset));
      if (fs.readSync(f.fd, buffer, { offset: offset }) !== buffer.byteLength)
        throw new Error('无法完整读取存档。');
      return this.base64.encodeToStringSync(new Uint8Array(buffer));
    } finally {
      fs.closeSync(f);
    }
  }

  async choose(json: boolean = false): Promise<string> {
    this.requireOpen();
    const options = new picker.DocumentSelectOptions();
    options.maxSelectNumber = 1;
    options.fileSuffixFilters = json ? ['JSON|.json'] : ['DAT64|.dat64'];
    const files = await new picker.DocumentViewPicker(this.context).select(options);
    this.requireOpen();
    if (files.length === 0) return '';
    if (json) this.selectedJson = files[0];
    else this.selected = files[0];
    return new fileUri.FileUri(files[0]).name;
  }

  begin(): void {
    this.requireOpen();
    if (this.writing) throw new Error('已有存档写入任务。');
    this.recover();
    fs.mkdirSync(this.transaction);
    try {
      if (fs.accessSync(this.current)) fs.copyDirSync(this.current, this.transaction);
      else fs.mkdirSync(this.staged);
      this.writing = true;
    } catch (error) {
      this.recover();
      throw new Error((error as Error).message);
    }
  }

  private append(path: string, data: string, first: boolean): void {
    if (data.length > Math.ceil(CHUNK / 3) * 4) throw new Error('存档数据块过大。');
    const bytes = this.base64.decodeSync(data);
    if (bytes.byteLength === 0 || bytes.byteLength > CHUNK) throw new Error('存档数据块无效。');
    const existing = first ? 0 : fs.statSync(path).size;
    if (existing + bytes.byteLength > LIMIT) throw new Error('存档超过 32 MiB。');
    const buffer = new ArrayBuffer(bytes.byteLength);
    new Uint8Array(buffer).set(bytes);
    const flags = fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE | (first ? fs.OpenMode.TRUNC : fs.OpenMode.APPEND);
    const f = fs.openSync(path, flags);
    try {
      if (fs.writeSync(f.fd, buffer) !== buffer.byteLength) throw new Error('无法完整写入存档。');
      fs.fsyncSync(f.fd);
    } finally {
      fs.closeSync(f);
    }
  }

  private removeResidue(name: string): void {
    for (const item of fs.listFileSync(this.staged)) {
      if (item.startsWith(name + '.tmp-') && fs.statSync(this.staged + '/' + item).isFile())
        fs.unlinkSync(this.staged + '/' + item);
    }
  }

  write(name: string, data: string, first: boolean): void {
    this.requireOpen();
    if (!this.writing) throw new Error('尚未开始存档写入。');
    this.name(name);
    if (first) this.removeResidue(name);
    this.append(this.staged + '/' + name, data, first);
  }

  drop(name: string): void {
    this.requireOpen();
    if (!this.writing) throw new Error('尚未开始存档写入。');
    const path = this.staged + '/' + this.name(name);
    if (fs.accessSync(path)) fs.unlinkSync(path);
    this.removeResidue(name);
  }

  finish(): void {
    this.requireOpen();
    if (!this.writing) throw new Error('尚未开始存档写入。');
    try {
      if (fs.accessSync(this.current)) fs.renameSync(this.current, this.transaction + '/previous');
      fs.renameSync(this.staged, this.current);
    } finally {
      this.writing = false;
      this.recover();
    }
  }

  abort(): void {
    this.requireOpen();
    this.writing = false;
    this.recover();
  }

  private newShareFolder(): string {
    if (!fs.accessSync(this.shareFolder)) fs.mkdirSync(this.shareFolder);
    const folder = this.shareFolder + '/' + Date.now();
    fs.mkdirSync(folder);
    return folder;
  }

  private record(path: string, name: string): systemShare.SharedRecord {
    return { utd: utd.UniformDataType.FILE, uri: fileUri.getUriFromPath(path), title: name };
  }

  private async openShare(records: systemShare.SharedRecord[]): Promise<void> {
    this.requireOpen();
    if (records.length === 0) throw new Error('没有可分享的存档。');
    const data = new systemShare.SharedData(records[0]);
    for (let i = 1; i < records.length; i++) data.addRecord(records[i]);
    await new systemShare.ShareController(data).show(this.context, {
      previewMode: systemShare.SharePreviewMode.DETAIL,
      selectionMode: systemShare.SelectionMode.SINGLE
    });
  }

  async share(name: string): Promise<void> {
    this.requireOpen();
    const names = name === '@profiles' ?
      (JSON.parse(this.list()) as string[]).filter((file: string) => file.startsWith('user')) : [this.name(name)];
    const folder = this.newShareFolder();
    const records: systemShare.SharedRecord[] = [];
    for (const file of names) {
      const path = folder + '/' + this.name(file);
      fs.copyFileSync(this.current + '/' + file, path);
      records.push(this.record(path, file));
    }
    await this.openShare(records);
  }

  shareChunk(name: string, data: string, first: boolean): void {
    this.requireOpen();
    if (!SHARE.test(name)) throw new Error('分享文件名无效。');
    if (first) this.shareDraft = this.newShareFolder() + '/' + name;
    if (!this.shareDraft.endsWith('/' + name)) throw new Error('未准备分享文件。');
    this.append(this.shareDraft, data, first);
  }

  async sharePrepared(name: string): Promise<void> {
    if (!SHARE.test(name) || !this.shareDraft.endsWith('/' + name)) throw new Error('分享文件名无效。');
    await this.openShare([this.record(this.shareDraft, name)]);
    this.shareDraft = '';
  }
}
