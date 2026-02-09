import type { ArgumentTreeNode, LiteralTreeNode, RootTreeNode, TreeNode } from './type.js';
export declare function redirect(rootTreeNode: TreeNode, path: readonly string[]): TreeNode | undefined;
/**
 * @returns A `TreeNode` whose `children` property, if exists, contains its subsequent `TreeNode`s.
 */
export declare function resolveParentTreeNode(parentTreeNode: TreeNode | undefined, rootTreeNode: RootTreeNode): {
    treeNode: TreeNode | undefined;
    path: undefined;
};
export declare function resolveParentTreeNode(parentTreeNode: TreeNode | undefined, rootTreeNode: RootTreeNode, parentPath: string[]): {
    treeNode: TreeNode | undefined;
    path: string[];
};
/**
 * Categorize command tree children to literal entries and argument entries.
 */
export declare function categorizeTreeChildren(children: Exclude<TreeNode['children'], undefined>): {
    literalTreeNodes: [string, LiteralTreeNode][];
    argumentTreeNodes: [string, ArgumentTreeNode][];
};
//# sourceMappingURL=util.d.ts.map