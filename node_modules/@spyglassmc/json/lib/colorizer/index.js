import * as core from '@spyglassmc/core';
import { ColorToken } from '@spyglassmc/core';
export const boolean = (node) => {
    return [ColorToken.create(node, 'literal')];
};
export const null_ = (node) => {
    return [ColorToken.create(node, 'literal')];
};
export const object = (node, ctx) => {
    const ans = [];
    for (const pair of node.children) {
        if (pair.key) {
            ans.push(ColorToken.create(pair.key, 'property'));
        }
        if (pair.value) {
            const colorizer = ctx.meta.getColorizer(pair.value.type);
            ans.push(...colorizer(pair.value, ctx));
        }
    }
    return ans;
};
export const string = (node, ctx) => {
    if (node.children && node.children?.length > 0) {
        const child = node.children[0];
        const colorizer = ctx.meta.getColorizer(child.type);
        return colorizer(child, ctx);
    }
    return core.colorizer.string(node, ctx);
};
export function register(meta) {
    meta.registerColorizer('json:boolean', boolean);
    meta.registerColorizer('json:null', null_);
    meta.registerColorizer('json:number', core.colorizer.number);
    meta.registerColorizer('json:object', object);
    meta.registerColorizer('json:string', string);
}
//# sourceMappingURL=index.js.map