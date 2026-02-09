import * as core from '@spyglassmc/core';
import { entry } from './entry.js';
export const file = core.map(core.dumpErrors(entry), (res) => ({ type: 'json:file', range: res.range, children: [res] }));
//# sourceMappingURL=file.js.map