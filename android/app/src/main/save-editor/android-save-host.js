const CHUNK = 128 * 1024;
const LIMIT = 32 * 1024 * 1024;

function call(op, name = '', data = '', offset = 0, first = false) {
    const {value, error} = JSON.parse(PvzAndroid.command(op, name, data, offset, first));
    if (error) throw Error(error);
    return value;
}

function read(name) {
    const chunks = [];
    let length = 0;
    for (;;) {
        const encoded = call('read', name, '', length);
        if (!encoded) break;
        const bytes = Uint8Array.from(atob(encoded), char => char.charCodeAt(0));
        length += bytes.length;
        if (bytes.length > CHUNK || length > LIMIT) throw Error('存档超过 32 MiB。');
        chunks.push(bytes);
        if (bytes.length < CHUNK) break;
    }
    const result = new Uint8Array(length);
    let offset = 0;
    for (const part of chunks) {
        result.set(part, offset);
        offset += part.length;
    }
    return result;
}

function write(op, name, bytes) {
    if (!(bytes instanceof Uint8Array) || !bytes.length || bytes.length > LIMIT) {
        throw Error('存档大小无效。');
    }
    for (let offset = 0; offset < bytes.length; offset += CHUNK) {
        const part = bytes.subarray(offset, offset + CHUNK);
        let text = '';
        for (let i = 0; i < part.length; i += 8192) {
            text += String.fromCharCode(...part.subarray(i, i + 8192));
        }
        call(op, name, btoa(text), 0, offset === 0);
    }
}

export const storage = {
    list: () => call('list'),
    read,
    commit(plan) {
        call('begin');
        try {
            for (const [name, bytes] of plan.writes) write('write', name, bytes);
            for (const name of plan.removes) {
                if (!plan.writes.has(name)) call('drop', name);
            }
            call('finish');
        } catch (error) {
            try { call('abort'); } catch {}
            throw error;
        }
    },
    close: () => call('close'),
};

let shareScheduled = false;

export function download(data, name) {
    write('exportChunk', name, typeof data === 'string' ? new TextEncoder().encode(data) : data);
    call('export', name);
    if (shareScheduled) return;
    shareScheduled = true;
    queueMicrotask(() => {
        shareScheduled = false;
        call('share');
    });
}

