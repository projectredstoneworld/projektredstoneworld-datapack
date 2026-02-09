export function argumentTreeNodeToString(name, treeNode) {
    const parserName = treeNode.parser.slice(treeNode.parser.indexOf(':') + 1);
    return `<${name}: ${parserName}>`;
}
//# sourceMappingURL=argument.js.map