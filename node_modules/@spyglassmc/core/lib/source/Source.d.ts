import { IndexMap } from './IndexMap.js';
import type { RangeContainer } from './Range.js';
import { Range } from './Range.js';
type Digit = '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9';
type Space = ' ' | '\t';
type Newline = '\r\n' | '\r' | '\n';
type Whitespace = Space | Newline;
export declare const CRLF = "\r\n";
export declare const CR = "\r";
export declare const LF = "\n";
export declare const Whitespaces: readonly [" ", "\n", "\r", "\t"];
export declare class ReadonlySource {
    readonly string: string;
    readonly indexMap: IndexMap;
    innerCursor: number;
    constructor(string: string, indexMap?: IndexMap);
    get cursor(): number;
    /**
     * @param offset The index to offset from cursor. Defaults to 0.
     *
     * @returns The range of the specified character.
     *
     * @example
     * getCharRange(-1) // Returns the range of the character before cursor.
     * getCharRange()   // Returns the range of the character at cursor.
     * getCharRange(1)  // Returns the range of the character after cursor.
     */
    getCharRange(offset?: number): Range;
    /**
     * Returns a string that helps visualize this `Source`'s index map.
     * Primarily intended for debugging purposes.
     */
    visualizeIndexMap(): string;
    /**
     * Peeks a substring from the current cursor.
     * @param length The length of the substring. Defaults to 1
     * @param offset The index to offset from cursor. Defaults to 0
     */
    peek(length?: number, offset?: number): string;
    canRead(length?: number): boolean;
    canReadInLine(): boolean;
    /**
     * If the `expectedValue` is right after the cursor, returns `true`. Otherwise returns `false`.
     *
     * @param offset Defaults to 0.
     *
     * @see {@link Source.trySkip}
     */
    tryPeek(expectedValue: string, offset?: number): boolean;
    tryPeekAfterWhitespace(expectedValue: string): boolean;
    peekUntil(...terminators: string[]): string;
    peekLine(): string;
    peekRemaining(offset?: number): string;
    matchPattern(regex: RegExp, offset?: number): boolean;
    /**
     * If there is a non-space character between `cursor + offset` (inclusive) and the next newline, returns `true`. Otherwise returns `false`.
     *
     * @param offset Defaults to 0.
     */
    hasNonSpaceAheadInLine(offset?: number): boolean;
    slice(start: number, end?: number): string;
    slice(rangeLike: Range | RangeContainer): string;
    sliceToCursor(start: number): string;
}
export declare class Source extends ReadonlySource {
    string: string;
    indexMap: IndexMap;
    constructor(string: string, indexMap?: IndexMap);
    get cursor(): number;
    set cursor(cursor: number);
    clone(): Source;
    read(): string;
    /**
     * Skips the current character.
     * @param step The step to skip. Defaults to 1
     */
    skip(step?: number): this;
    /**
     * If the `expectedValue` is right after the cursor, skips it and returns `true`. Otherwise returns `false`.
     *
     * This is a shortcut for the following piece of code:
     * ```typescript
     * declare const src: Source
     * if (src.peek(expectedValue.length) === expectedValue) {
     * 	src.skip(expectedValue.length)
     * 	// Do something here.
     * }
     * ```
     *
     * @see {@link Source.tryPeek}
     */
    trySkip(expectedValue: string): boolean;
    /**
     * Reads until the end of this line.
     */
    readLine(): string;
    /**
     * Skips until the end of this line.
     */
    skipLine(): this;
    /**
     * Jumps to the beginning of the next line.
     */
    nextLine(): this;
    readSpace(): string;
    skipSpace(): this;
    readWhitespace(): string;
    skipWhitespace(): this;
    readIf(predicate: (this: void, char: string) => boolean): string;
    skipIf(predicate: (this: void, char: string) => boolean): this;
    /**
     * @param terminators Ending character. Will not be skipped or included in the result.
     */
    readUntil(...terminators: string[]): string;
    /**
     * @param terminators Ending character. Will not be skipped.
     */
    skipUntilOrEnd(...terminators: string[]): this;
    readUntilLineEnd(): string;
    skipUntilLineEnd(): this;
    readRemaining(): string;
    skipRemaining(): this;
}
export declare namespace Source {
    function isDigit(c: string): c is Digit;
    function isBrigadierQuote(c: string): c is '"' | "'";
    function isNewline(c: string): c is Newline;
    function isSpace(c: string): c is Space;
    function isWhitespace(c: string): c is Whitespace;
}
export {};
//# sourceMappingURL=Source.d.ts.map