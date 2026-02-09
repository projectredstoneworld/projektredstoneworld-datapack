import type { CommentNode } from '../node/index.js';
import type { Parser } from './Parser.js';
interface Options {
    singleLinePrefixes: Set<string>;
    includesEol?: boolean;
}
/**
 * `Failure` when three isn't a comment.
 */
export declare function comment({ singleLinePrefixes, includesEol }: Options): Parser<CommentNode>;
export {};
//# sourceMappingURL=comment.d.ts.map