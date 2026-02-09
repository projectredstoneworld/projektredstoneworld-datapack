import * as core from '@spyglassmc/core';
import { localize } from '@spyglassmc/locales';
import { localizeTag, newSyntax } from '../util.js';
import { entry } from './entry.js';
import { primitive } from './primitive.js';
export const list = (src, ctx) => {
    const parser = core.list({
        start: '[',
        value: entry,
        sep: ',',
        trailingSep: true,
        end: ']',
    });
    const ans = parser(src, ctx);
    ans.type = 'nbt:list';
    ans.valueType = ans.children[0]?.value?.type;
    // Check if every element is of the same type.
    if (ans.valueType && !newSyntax(ctx)) {
        for (const { value } of ans.children) {
            if (value && value.type !== ans.valueType) {
                ctx.err.report(localize('expected-got', localizeTag(ans.valueType), localizeTag(value.type)), value);
            }
        }
    }
    return ans;
};
export const byteArray = (src, ctx) => {
    const parser = core.list({
        start: '[B;',
        value: primitive,
        sep: ',',
        trailingSep: true,
        end: ']',
    });
    const ans = parser(src, ctx);
    ans.type = 'nbt:byte_array';
    // Check if every element is of the required type.
    for (const { value } of ans.children) {
        if (value && value.type !== 'nbt:byte') {
            ctx.err.report(localize('expected-got', localize('nbt.node.byte'), localizeTag(value.type)), value);
        }
    }
    return ans;
};
export const intArray = (src, ctx) => {
    const parser = core.list({
        start: '[I;',
        value: primitive,
        sep: ',',
        trailingSep: true,
        end: ']',
    });
    const ans = parser(src, ctx);
    ans.type = 'nbt:int_array';
    // Check if every element is of the required type.
    for (const { value } of ans.children) {
        if (value && value.type !== 'nbt:int') {
            ctx.err.report(localize('expected-got', localize('nbt.node.int'), localizeTag(value.type)), value);
        }
    }
    return ans;
};
export const longArray = (src, ctx) => {
    const parser = core.list({
        start: '[L;',
        value: primitive,
        sep: ',',
        trailingSep: true,
        end: ']',
    });
    const ans = parser(src, ctx);
    ans.type = 'nbt:long_array';
    // Check if every element is of the required type.
    for (const { value } of ans.children) {
        if (value && value.type !== 'nbt:long') {
            ctx.err.report(localize('expected-got', localize('nbt.node.long'), localizeTag(value.type)), value);
        }
    }
    return ans;
};
//# sourceMappingURL=collection.js.map