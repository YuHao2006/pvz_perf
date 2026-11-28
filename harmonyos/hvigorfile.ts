import { disableWindowsResourceCompression } from './hvigor/windows-resource-compiler';
import { appTasks } from '@ohos/hvigor-ohos-plugin';

export default {
    system: appTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins: [disableWindowsResourceCompression]         /* Custom plugin to extend the functionality of Hvigor. */
}
