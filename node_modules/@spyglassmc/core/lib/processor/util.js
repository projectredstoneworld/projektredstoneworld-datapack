export function traversePreOrder(node, shouldContinue, shouldCallFn, fn) {
    traversePreOrderImpl(node, shouldContinue, shouldCallFn, fn, []);
}
function traversePreOrderImpl(node, shouldContinue, shouldCallFn, fn, parents) {
    if (shouldCallFn(node, parents)) {
        fn(node, parents);
    }
    if (!node.children || !shouldContinue(node, parents)) {
        return;
    }
    for (const child of node.children ?? []) {
        parents.unshift(node);
        traversePreOrderImpl(child, shouldContinue, shouldCallFn, fn, parents);
        parents.shift();
    }
}
//# sourceMappingURL=util.js.map