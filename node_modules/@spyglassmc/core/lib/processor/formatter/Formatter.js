export function formatterContextIndentation(ctx, additionalLevels = 0) {
    const total = ctx.indentLevel + additionalLevels;
    return ctx.insertSpaces ? ' '.repeat(total * ctx.tabSize) : '\t'.repeat(total);
}
export function indentFormatter(ctx, additionalLevels = 1) {
    return {
        ...ctx,
        indentLevel: ctx.indentLevel + additionalLevels,
        indent(additionalLevels) {
            return formatterContextIndentation(this, additionalLevels);
        },
    };
}
//# sourceMappingURL=Formatter.js.map