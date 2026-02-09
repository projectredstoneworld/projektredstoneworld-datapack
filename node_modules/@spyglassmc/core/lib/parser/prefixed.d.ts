import type { AstNode, PrefixedNode } from '../node/index.js';
import type { InfallibleParser, Parser } from './Parser.js';
export interface Options<C extends AstNode> {
    prefix: string;
    child: Parser<C>;
}
export declare function prefixed<C extends AstNode>(options: Options<C>): InfallibleParser<PrefixedNode<C>>;
//# sourceMappingURL=prefixed.d.ts.map