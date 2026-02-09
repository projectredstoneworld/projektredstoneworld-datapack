import { FileNode } from '../../node/index.js';
import { Range } from '../../source/index.js';
import { traversePreOrder } from '../util.js';
export const fallback = (node, ctx) => {
    const ans = [];
    traversePreOrder(node, (node) => Range.containsRange(node.range, ctx.range, true), (node) => ctx.meta.hasCodeActionProvider(node.type), (node) => ans.push(...ctx.meta.getCodeActionProvider(node.type)(node, ctx)));
    return ans;
};
export const file = (node, ctx) => {
    const ans = [];
    for (const error of FileNode.getErrors(node)) {
        const action = error.info?.codeAction;
        if (!action) {
            continue;
        }
        if (!Range.containsRange(error.range, ctx.range, true)) {
            continue;
        }
        ans.push({
            ...action,
            errors: [error],
        });
    }
    return ans;
};
export function registerProviders(meta) {
    meta.registerCodeActionProvider('file', file);
}
//# sourceMappingURL=builtin.js.map