import { readFileSync, writeFileSync } from 'node:fs';
import { isAbsolute, join, relative, resolve, sep } from 'node:path';
import type { HvigorPlugin } from '@ohos/hvigor';

const childProcess = require('node:child_process');

export const disableWindowsResourceCompression: HvigorPlugin = {
    pluginId: 'pvz-windows-resource-compiler',
    apply(node) {
        if (process.platform !== 'win32') return;

        const buildPath = join(node.getNodePath(), 'entry', 'build');
        // The API 24 Windows restool loads the optional transcoder whenever
        // this field is present, even when media compression is disabled.
        for (const method of ['spawn', 'spawnSync', 'execFile', 'execFileSync']) {
            const run = childProcess[method];
            childProcess[method] = function(command: string, ...parameters: unknown[]) {
                const args = parameters[0];
                if (/[\\/]restool\.exe$/i.test(command) && Array.isArray(args)) {
                    const index = args.indexOf('-l');
                    const config = index >= 0 ? args[index + 1] : undefined;
                    if (typeof config === 'string' && /[\\/]resConfig\.json$/i.test(config)) {
                        const file = resolve(config);
                        const origin = relative(buildPath, file);
                        if (origin !== '..' && !origin.startsWith('..' + sep) && !isAbsolute(origin)) {
                            const options = JSON.parse(readFileSync(file, 'utf8'));
                            delete options.compression;
                            writeFileSync(file, JSON.stringify(options));
                        }
                    }
                }
                return run.call(this, command, ...parameters);
            };
        }
    },
};
