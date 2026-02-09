import type { DeepReadonly } from '../index.js';
import type { AstNode } from '../node/index.js';
type Callback<R> = (this: void, node: AstNode, parents: AstNode[]) => R;
export declare function traversePreOrder<CN extends AstNode>(node: DeepReadonly<AstNode>, shouldContinue: Callback<unknown>, shouldCallFn: (this: void, node: AstNode, parents: AstNode[]) => node is CN, fn: (this: void, node: CN, parents: AstNode[]) => void): void;
export declare function traversePreOrder(node: DeepReadonly<AstNode>, shouldContinue: Callback<unknown>, shouldCallFn: Callback<unknown>, fn: Callback<void>): void;
export {};
//# sourceMappingURL=util.d.ts.map