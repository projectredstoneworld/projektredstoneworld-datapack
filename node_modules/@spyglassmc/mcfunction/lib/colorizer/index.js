import * as core from '@spyglassmc/core';
import { macro } from './macro.js';
export function register(meta) {
    meta.registerColorizer('mcfunction:command_child/literal', core.colorizer.literal);
    meta.registerColorizer('mcfunction:command_child/trailing', core.colorizer.error);
    meta.registerColorizer('mcfunction:macro', macro);
}
//# sourceMappingURL=index.js.map