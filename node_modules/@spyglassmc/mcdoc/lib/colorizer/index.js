import { ColorToken } from '@spyglassmc/core';
export const identifier = (node) => {
    return [ColorToken.create(node, 'variable')];
};
export const literal = (node) => {
    return [ColorToken.create(node, node.colorTokenType ?? 'literal')];
};
export function registerMcdocColorizer(meta) {
    meta.registerColorizer('mcdoc:literal', literal);
    meta.registerColorizer('mcdoc:identifier', identifier);
}
//# sourceMappingURL=index.js.map