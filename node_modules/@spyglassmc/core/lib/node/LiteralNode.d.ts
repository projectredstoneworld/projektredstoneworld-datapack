import type { ColorTokenType } from '../processor/index.js';
import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
export interface LiteralOptions {
    pool: string[];
    colorTokenType?: ColorTokenType;
}
export interface LiteralBaseNode extends AstNode {
    readonly options: LiteralOptions;
    value: string;
}
export interface LiteralNode extends LiteralBaseNode {
    readonly type: 'literal';
}
export declare namespace LiteralNode {
    function is(obj: object | undefined): obj is LiteralNode;
    function mock(range: RangeLike, options: LiteralOptions): LiteralNode;
}
//# sourceMappingURL=LiteralNode.d.ts.map