import { ResourceLocationNode } from '../../node/index.js';
export const fallback = (node) => {
    throw new Error(`No formatter registered for type ${node.type}`);
};
export const error = (node) => {
    return '';
};
export const file = (node, ctx) => {
    return node.children.map((child) => {
        return ctx.meta.getFormatter(child.type)(child, ctx);
    }).join('');
};
export const boolean = (node) => {
    return node.value ? 'true' : 'false';
};
export const comment = (node) => {
    return node.prefix + node.comment;
};
export const float = (node) => {
    return node.value.toString();
};
export const integer = (node) => {
    return node.value.toFixed();
};
export const literal = (node) => {
    return node.value;
};
export const long = (node) => {
    return node.value.toString();
};
export const resourceLocation = (node) => {
    return ResourceLocationNode.toString(node, 'origin', true);
};
export const string = (node) => {
    // FIXME: escape this value according to the node's IndexMap and context
    return `"${node.value}"`;
};
export function registerFormatters(meta) {
    meta.registerFormatter('error', error);
    meta.registerFormatter('file', file);
    meta.registerFormatter('boolean', boolean);
    meta.registerFormatter('comment', comment);
    meta.registerFormatter('float', float);
    meta.registerFormatter('integer', integer);
    meta.registerFormatter('long', long);
    meta.registerFormatter('literal', literal);
    meta.registerFormatter('resource_location', resourceLocation);
    meta.registerFormatter('string', string);
}
//# sourceMappingURL=builtin.js.map