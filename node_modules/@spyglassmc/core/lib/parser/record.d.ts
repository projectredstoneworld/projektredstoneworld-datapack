import type { AstNode } from '../node/index.js';
import type { RecordNode } from '../node/RecordNode.js';
import type { InfallibleParser, Parser } from './Parser.js';
/** @internal For test only */
export interface Options<K extends AstNode, V extends AstNode> {
    start: string;
    pair: {
        key: Parser<K>;
        sep: string;
        value: Parser<V> | {
            get: (recordResult: RecordNode<K, V>, keyResult: K | undefined) => Parser<V>;
        };
        end: string;
        trailingEnd: boolean;
    };
    end: string;
}
/**
 * @returns A parser that parses something coming in a key-value pair form. e.g. SNBT objects, entity selector arguments.
 */
export declare function record<K extends AstNode, V extends AstNode>({ start, pair, end }: Options<K, V>): InfallibleParser<RecordNode<K, V>>;
//# sourceMappingURL=record.d.ts.map