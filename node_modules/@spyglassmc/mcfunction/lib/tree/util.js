export function redirect(rootTreeNode, path) {
    return path.reduce((p, c) => p?.children?.[c], rootTreeNode);
}
export function resolveParentTreeNode(parentTreeNode, rootTreeNode, parentPath) {
    if (parentTreeNode?.redirect) {
        return {
            treeNode: redirect(rootTreeNode, parentTreeNode.redirect),
            path: [...parentTreeNode.redirect],
        };
    }
    else if (parentTreeNode && !parentTreeNode.children && !parentTreeNode.executable) {
        // The `execute.run` literal tree node doesn't have any property.
        // We should use children from the root tree node in this case.
        return { treeNode: rootTreeNode, path: [] };
    }
    else {
        return { treeNode: parentTreeNode, path: parentPath };
    }
}
/**
 * Categorize command tree children to literal entries and argument entries.
 */
export function categorizeTreeChildren(children) {
    const ans = {
        literalTreeNodes: [],
        argumentTreeNodes: [],
    };
    for (const e of Object.entries(children)) {
        /* istanbul ignore else */
        if (e[1].type === 'literal') {
            ans.literalTreeNodes.push(e);
        }
        else if (e[1].type === 'argument') {
            ans.argumentTreeNodes.push(e);
        }
    }
    return ans;
}
//# sourceMappingURL=util.js.map