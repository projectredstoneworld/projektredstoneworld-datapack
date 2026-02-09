import * as core from '@spyglassmc/core';
import { localize } from '@spyglassmc/locales';
import * as mcdoc from '@spyglassmc/mcdoc';
import { entry } from './parser/entry.js';
import { path } from './parser/path.js';
const nbtValidator = (value) => {
    if (!value || value?.kind === 'tree') {
        return core.Failure;
    }
    return value;
};
export function registerMcdocAttributes(meta) {
    mcdoc.runtime.registerAttribute(meta, 'nbt', nbtValidator, {
        stringParser: (config) => makeInfallible(core.map(entry, res => ({
            type: 'nbt:typed',
            range: res.range,
            children: [res],
            targetType: config,
        })), localize('nbt.node')),
    });
    mcdoc.runtime.registerAttribute(meta, 'nbt_path', nbtValidator, {
        stringParser: () => makeInfallible(path, localize('nbt.path')),
    });
}
function makeInfallible(parser, message) {
    return (src, ctx) => {
        const start = src.cursor;
        const res = parser(src, ctx);
        if (res === core.Failure) {
            ctx.err.report(localize('expected', message), core.Range.create(start, src.skipRemaining()));
            return undefined;
        }
        return res;
    };
}
//# sourceMappingURL=mcdocAttributes.js.map