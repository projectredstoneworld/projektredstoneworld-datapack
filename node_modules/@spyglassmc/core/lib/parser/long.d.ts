import type { LongNode } from '../node/index.js';
import type { ParserContext } from '../service/index.js';
import { Source } from '../source/index.js';
import type { InfallibleParser, Parser } from './Parser.js';
interface OptionsBase {
    pattern: RegExp;
    /**
     * Inclusive.
     */
    min?: bigint;
    /**
     * Inclusive.
     */
    max?: bigint;
    /**
     * A callback function that will be called when the numeral value is out of range.
     *
     * Defaults to a function that marks an `Error` at the range of the node.
     */
    onOutOfRange?: (ans: LongNode, src: Source, ctx: ParserContext, options: Options) => void;
}
interface FallibleOptions extends OptionsBase {
    failsOnEmpty: true;
}
interface InfallibleOptions extends OptionsBase {
    failsOnEmpty?: false;
}
/** @internal For test only */
export type Options = FallibleOptions | InfallibleOptions;
export declare function long(options: InfallibleOptions): InfallibleParser<LongNode>;
export declare function long(options: FallibleOptions): Parser<LongNode>;
export {};
//# sourceMappingURL=long.d.ts.map