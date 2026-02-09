import { Range } from '../../source/index.js';
import { traversePreOrder } from '../util.js';
import { ColorToken } from './Colorizer.js';
/**
 * Use the shallowest children that have their own colorizers to provide the color tokens.
 */
export const fallback = (node, ctx) => {
    const ans = [];
    traversePreOrder(node, (node) => !ctx.meta.hasColorizer(node.type)
        && (!ctx.range || Range.intersects(node.range, ctx.range)), (node) => ctx.meta.hasColorizer(node.type), (node) => {
        const colorizer = ctx.meta.getColorizer(node.type);
        const result = colorizer(node, ctx);
        ans.push(...result);
    });
    return Object.freeze(ans);
};
export const boolean = (node) => {
    return [ColorToken.create(node, 'literal')];
};
export const comment = (node) => {
    return [ColorToken.create(node, 'comment')];
};
export const error = (node) => {
    // return [ColorToken.create(node, 'error')]
    return [];
};
export const literal = (node) => {
    return [ColorToken.create(node, node.options.colorTokenType ?? 'literal')];
};
export const number = (node) => {
    return [ColorToken.create(node, 'number')];
};
export const resourceLocation = (node, _ctx) => {
    let type;
    switch (node.options.category) {
        case 'function':
        case 'tag/function':
            type = 'function';
            break;
        default:
            type = 'resourceLocation';
            break;
    }
    return [ColorToken.create(node, type)];
};
export const string = (node, ctx) => {
    if (node.children) {
        const colorizer = ctx.meta.getColorizer(node.children[0].type);
        const result = colorizer(node.children[0], ctx);
        // TODO: Fill the gap between the last token and the ending quote with errors.
        return ColorToken.fillGap(result, node.range, node.options.colorTokenType ?? 'string');
    }
    else {
        return [ColorToken.create(node, node.options.colorTokenType ?? 'string')];
    }
};
export const symbol = (node) => {
    // TODO: Set the modifiers according to `node.symbol`.
    return [ColorToken.create(node, 'variable')];
};
export function registerColorizers(meta) {
    meta.registerColorizer('boolean', boolean);
    meta.registerColorizer('comment', comment);
    meta.registerColorizer('error', error);
    meta.registerColorizer('float', number);
    meta.registerColorizer('integer', number);
    meta.registerColorizer('long', number);
    meta.registerColorizer('literal', literal);
    meta.registerColorizer('resource_location', resourceLocation);
    meta.registerColorizer('string', string);
    meta.registerColorizer('symbol', symbol);
}
//# sourceMappingURL=builtin.js.map