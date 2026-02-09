import * as core from '@spyglassmc/core';
import { indentFormatter } from '@spyglassmc/core';
const file = (node, ctx) => {
    const child = node.children[0];
    return ctx.meta.getFormatter(child.type)(child, ctx);
};
const array = (node, ctx) => {
    if (node.children.length === 0) {
        return '[]';
    }
    const values = node.children.map((child) => {
        const value = child.value
            && ctx.meta.getFormatter(child.value.type)(child.value, indentFormatter(ctx));
        return `${ctx.indent(1)}${value ?? ''}`;
    });
    return `[\n${values.join(',\n')}\n${ctx.indent()}]`;
};
const object = (node, ctx) => {
    if (node.children.length === 0) {
        return '{}';
    }
    const fields = node.children.map((child) => {
        const key = child.key && string(child.key, ctx);
        const value = child.value
            && ctx.meta.getFormatter(child.value.type)(child.value, indentFormatter(ctx));
        return `${ctx.indent(1)}${key ?? ''}: ${value ?? ''}`;
    });
    return `{\n${fields.join(',\n')}\n${ctx.indent()}}`;
};
const number = (node, ctx) => {
    return ctx.meta.getFormatter(node.value.type)(node.value, ctx);
};
const string = (node, ctx) => {
    // TODO: Use core.formatter.string when it correctly escapes the string
    return JSON.stringify(node.value);
};
export function register(meta) {
    meta.registerFormatter('json:file', file);
    meta.registerFormatter('json:array', array);
    meta.registerFormatter('json:boolean', core.formatter.boolean);
    meta.registerFormatter('json:null', () => 'null');
    meta.registerFormatter('json:number', number);
    meta.registerFormatter('json:object', object);
    meta.registerFormatter('json:string', string);
}
//# sourceMappingURL=index.js.map