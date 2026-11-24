import { readFileSync, existsSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
const root = fileURLToPath(new URL('../', import.meta.url));
export function workspacePath(key) {
  const project = JSON.parse(readFileSync(path.join(root, 'config/workspace-paths.json'),'utf8'));
  const file = path.resolve(root, process.env.PVZ_PATHS_CONFIG || project.machineConfig);
  if (!existsSync(file)) return undefined;
  const value = JSON.parse(readFileSync(file,'utf8'))[key];
  return value ? path.resolve(path.dirname(file), value) : undefined;
}
