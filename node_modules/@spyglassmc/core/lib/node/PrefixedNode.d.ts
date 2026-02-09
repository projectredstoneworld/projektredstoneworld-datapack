import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
import { LiteralNode } from './LiteralNode.js';
export interface PrefixedNode<C extends AstNode = AstNode> extends AstNode {
    readonly type: 'prefixed';
    readonly children: (LiteralNode | C)[];
    readonly prefix: string;
}
export declare namespace PrefixedNode {
    function is<C extends AstNode>(obj: object): obj is PrefixedNode<C>;
    function mock<C extends AstNode>(range: RangeLike, prefix: string, child: C): PrefixedNode<C>;
}
//# sourceMappingURL=PrefixedNode.d.ts.map