import * as core from '@spyglassmc/core';
import { entry } from './entry.js';
export const compound = (src, ctx) => {
    return core.setType('nbt:compound', core.record({
        start: '{',
        pair: {
            key: core.failOnEmpty(core.setType('nbt:string', core.string({ ...core.BrigadierStringOptions, colorTokenType: 'property' }))),
            sep: ':',
            value: entry,
            end: ',',
            trailingEnd: true,
        },
        end: '}',
    }))(src, ctx);
};
//# sourceMappingURL=compound.js.map