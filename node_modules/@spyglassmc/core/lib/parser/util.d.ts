import type { AstNode } from '../node/index.js';
import { SequenceUtil } from '../node/index.js';
import type { ParserContext } from '../service/index.js';
import type { ErrorSeverity, ReadonlySource } from '../source/index.js';
import { Source } from '../source/index.js';
import type { InfallibleParser, Parser, Result, Returnable } from './Parser.js';
type ExtractNodeType<P extends Parser<Returnable>> = P extends Parser<infer V> ? V : never;
/**
 * @template PA Parser array.
 */
type ExtractNodeTypes<PA extends Parser<Returnable>[]> = ExtractNodeType<PA[number]>;
export interface AttemptResult<N extends Returnable = AstNode> {
    result: Result<N>;
    updateSrcAndCtx: () => void;
    endCursor: number;
    errorAmount: number;
}
interface InfallibleAttemptResult<N extends Returnable = AstNode> extends AttemptResult<N> {
    result: N;
}
/**
 * Attempts to parse using the given `parser`.
 * @returns
 * - `result`: The result returned by the `parser`.
 * - `updateSrcAndCtx`: A function that will update the passed-in `src` and `ctx` to the state where `parser` has been executed.
 * - `endCursor`: The offset where the `parser` stopped  parsing.
 * - `errorAmount`: The amount of errors created by the `parser`.
 */
export declare function attempt<N extends Returnable = AstNode>(parser: InfallibleParser<N>, src: Source, ctx: ParserContext): InfallibleAttemptResult<N>;
export declare function attempt<N extends Returnable = AstNode>(parser: Parser<N>, src: Source, ctx: ParserContext): AttemptResult<N>;
type SP<CN extends AstNode> = SIP<CN> | Parser<CN | SequenceUtil<CN> | undefined> | {
    get: (result: SequenceUtil<CN>) => Parser<CN | SequenceUtil<CN> | undefined> | undefined;
};
type SIP<CN extends AstNode> = InfallibleParser<CN | SequenceUtil<CN> | undefined> | {
    get: (result: SequenceUtil<CN>) => InfallibleParser<CN | SequenceUtil<CN> | undefined> | undefined;
};
/**
 * @template GN Gap node.
 * @template PA Parser array.
 *
 * @param parseGap A parser that parses gaps between nodes in the sequence.
 *
 * @returns A parser that takes a sequence built with the passed-in parsers.
 *
 * `Failure` when any of the `parsers` returns a `Failure`.
 */
export declare function sequence<GN extends AstNode = never, PA extends SIP<AstNode>[] = SIP<AstNode>[]>(parsers: PA, parseGap?: InfallibleParser<GN[]>): InfallibleParser<SequenceUtil<GN | {
    [K in number]: PA[K] extends SP<infer V> ? V : never;
}[number]>>;
export declare function sequence<GN extends AstNode = never, PA extends SP<AstNode>[] = SP<AstNode>[]>(parsers: PA, parseGap?: InfallibleParser<GN[]>): Parser<SequenceUtil<GN | {
    [K in number]: PA[K] extends SP<infer V> ? V : never;
}[number]>>;
/**
 * @template CN Child node.
 *
 * @param parser Must be fallible, as an infallible parser being repeated will result in an infinite loop.
 * @param parseGap A parser that parses gaps between nodes in the sequence.
 *
 * @returns A parser that takes a sequence with the passed-in parser being repeated zero or more times.
 */
export declare function repeat<CN extends AstNode>(parser: InfallibleParser<CN | SequenceUtil<CN>>, parseGap?: InfallibleParser<CN[]>): {
    _inputParserIsInfallible: never;
} & void;
export declare function repeat<CN extends AstNode>(parser: Parser<CN | SequenceUtil<CN>>, parseGap?: InfallibleParser<CN[]>): InfallibleParser<SequenceUtil<CN>>;
export interface AnyOutObject {
    /**
     * The index of the parser in the provided `parsers` array that was ultimately taken. `-1` if all parsers failed.
     */
    index: number;
}
/**
 * @param out An optional object that will be modified with additional information if provided.
 *
 * @returns A parser that returns the result of the passed-in parser which produces the least amount of error.
 * If there are more than one `parsers` produced the same amount of errors, it then takes the parser that went the furthest in `Source`.
 * If there is still a tie, it takes the one closer to the beginning of the `parsers` array.
 *
 * `Failure` when all of the `parsers` failed.
 */
export declare function any<PA extends [...Parser<Returnable>[], InfallibleParser<Returnable>]>(parsers: PA, out?: AnyOutObject): InfallibleParser<ExtractNodeTypes<PA>>;
export declare function any<PA extends Parser<Returnable>[]>(parsers: PA, out?: AnyOutObject): Parser<ExtractNodeTypes<PA>>;
/**
 * @returns A parser that fails when the passed-in parser didn't move the cursor at all.
 */
export declare function failOnEmpty<T extends Returnable>(parser: Parser<T>): Parser<T>;
/**
 * @returns A parser that fails when the passed-in parser produced any errors.
 */
export declare function failOnError<T extends Returnable>(parser: Parser<T>): Parser<T>;
/**
 * @returns A parser that takes an optional syntax component.
 */
export declare function optional<N extends Returnable>(parser: InfallibleParser<N>): {
    _inputParserIsInfallible: never;
} & void;
export declare function optional<N extends Returnable>(parser: Parser<N>): InfallibleParser<N | undefined>;
/**
 * @param parser Must be fallible.
 *
 * @returns A parser that returns the return value of the `parser`, or the return value of `defaultValue` it it's a `Failure`.
 */
export declare function recover<N extends Returnable>(parser: InfallibleParser<N>, defaultValue: (src: Source, ctx: ParserContext) => N): {
    _inputParserIsInfallible: never;
} & void;
export declare function recover<N extends Returnable>(parser: Parser<N>, defaultValue: (src: Source, ctx: ParserContext) => N): InfallibleParser<N>;
type GettableParser = Parser<Returnable> | {
    get: () => Parser<Returnable>;
};
type ExtractFromGettableParser<T extends GettableParser> = T extends {
    get: () => infer V;
} ? V : T extends Parser<Returnable> ? T : never;
type Case = {
    predicate?: (this: void, src: ReadonlySource) => boolean;
    prefix?: string;
    regex?: RegExp;
    parser: GettableParser;
};
/**
 * @template CA Case array.
 */
export declare function select<CA extends readonly Case[]>(cases: CA): ExtractFromGettableParser<CA[number]['parser']> extends InfallibleParser<Returnable> ? InfallibleParser<ExtractNodeType<ExtractFromGettableParser<CA[number]['parser']>>> : Parser<ExtractNodeType<ExtractFromGettableParser<CA[number]['parser']>>>;
/**
 * @returns A parser that returns the return value of `fn`.
 *
 * `Failure` when the `parser` returns a `Failure`.
 */
export declare function map<NA extends Returnable, NB extends Returnable = NA>(parser: InfallibleParser<NA>, fn: (res: NA, src: Source, ctx: ParserContext) => NB): InfallibleParser<NB>;
export declare function map<NA extends Returnable, NB extends Returnable = NA>(parser: Parser<NA>, fn: (res: NA, src: Source, ctx: ParserContext) => NB): Parser<NB>;
export declare function setType<N extends Omit<AstNode, 'type'>, T extends string>(type: T, parser: InfallibleParser<N>): InfallibleParser<Omit<N, 'type'> & {
    type: T;
}>;
export declare function setType<N extends Omit<AstNode, 'type'>, T extends string>(type: T, parser: Parser<N>): Parser<Omit<N, 'type'> & {
    type: T;
}>;
/**
 * Checks if the result of `parser` is valid, and reports an error if it's not.
 *
 * `Failure` when the `parser` returns a `Failure`.
 */
export declare function validate<N extends AstNode>(parser: InfallibleParser<N>, validator: (res: N, src: Source, ctx: ParserContext) => boolean, message: string, severity?: ErrorSeverity): InfallibleParser<N>;
export declare function validate<N extends AstNode>(parser: Parser<N>, validator: (res: N, src: Source, ctx: ParserContext) => boolean, message: string, severity?: ErrorSeverity): Parser<N>;
/**
 * @returns A parser that is based on the passed-in `parser`, but will never read to any of the terminator strings.
 */
export declare function stopBefore<N extends Returnable>(parser: InfallibleParser<N>, ...terminators: (string | readonly string[])[]): InfallibleParser<N>;
export declare function stopBefore<N extends Returnable>(parser: Parser<N>, ...terminators: (string | readonly string[])[]): Parser<N>;
/**
 * @returns A parser that is based on the passed-in `parser`, but concatenates lines
 * together when we reach, in order:
 * - a backslash
 * - whitespace (optional)
 * - a newline
 * - whitespace (optional)
 */
export declare function concatOnTrailingBackslash<N extends Returnable>(parser: InfallibleParser<N>): InfallibleParser<N>;
export declare function concatOnTrailingBackslash<N extends Returnable>(parser: Parser<N>): Parser<N>;
/**
 * @returns A parser that is based on the passed-in `parser`, but will only read the acceptable characters.
 */
export declare function acceptOnly<N extends Returnable>(parser: InfallibleParser<N>, ...characters: (string | readonly string[])[]): InfallibleParser<N>;
export declare function acceptOnly<N extends Returnable>(parser: Parser<N>, ...characters: (string | readonly string[])[]): Parser<N>;
export declare function acceptIf<P extends Parser<AstNode>>(parser: P, predicate: (this: void, char: string) => boolean): P extends InfallibleParser<infer N> ? InfallibleParser<N> : P extends Parser<infer N> ? Parser<N> : never;
/**
 * @returns A parser that dumps any parser errors after it finishes parsing.
 */
export declare function dumpErrors<P extends Parser<AstNode>>(parser: P): P;
export {};
//# sourceMappingURL=util.d.ts.map