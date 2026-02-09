import type { AstNode, ListNode } from '../node/index.js';
import type { InfallibleParser, Parser } from './Parser.js';
/** @internal For test only */
export interface Options<V extends AstNode> {
    start: string;
    value: Parser<V>;
    sep: string;
    trailingSep: boolean;
    end: string;
}
export declare function list<V extends AstNode>({ start, value, sep, trailingSep, end }: Options<V>): InfallibleParser<ListNode<V>>;
//# sourceMappingURL=list.d.ts.map