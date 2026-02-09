import * as core from '@spyglassmc/core';
import type { CommandNode, CommandOptions } from '../node/index.js';
import type { RootTreeNode, TreeNode } from '../tree/type.js';
import type { ArgumentParserGetter } from './argument.js';
/**
 * @returns A parser that always takes a whole line (excluding line turn characters) and tries to parse it as a command.
 */
export declare function command(tree: RootTreeNode, argument: ArgumentParserGetter, options?: CommandOptions): core.InfallibleParser<CommandNode>;
export declare function treeNodeChildrenToStringArray(children: Exclude<TreeNode['children'], undefined>, executable?: boolean): string[];
export declare function treeNodeChildrenToString(children: Exclude<TreeNode['children'], undefined>): string;
export declare function treeNodeToString(name: string, treeNode: TreeNode): string;
//# sourceMappingURL=command.d.ts.map