import * as core from '@spyglassmc/core';
import type { CommandChildNode, McfunctionNode } from '../node/index.js';
import { CommandNode } from '../node/index.js';
import type { ArgumentTreeNode, RootTreeNode } from '../tree/index.js';
export type MockNodesGetter = (treeNode: ArgumentTreeNode, prevNodes: CommandChildNode[], range: core.CompleterContext) => core.Arrayable<core.AstNode>;
/**
 * @param getMockNodes A function that returns a mock AST Node from given {@link ArgumentTreeNode}. These mock nodes
 * will be used for completing the argument.
 */
export declare function entry(tree: RootTreeNode, getMockNodes: MockNodesGetter): core.Completer<McfunctionNode>;
export declare function command(tree: RootTreeNode, getMockNodes: MockNodesGetter): core.Completer<CommandNode>;
//# sourceMappingURL=index.d.ts.map