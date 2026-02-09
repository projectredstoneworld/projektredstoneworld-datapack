import type { SymbolNode, SymbolOptions } from '../node/SymbolNode.js';
import type { AllCategory } from '../symbol/index.js';
import type { InfallibleParser } from './Parser.js';
/**
 * This parser reads _everything_ until the end of the {@link Source}.
 *
 * You might want to use {@link acceptOnly}, {@link stopBefore}, or {@link string} to restrict what this parser can read.
 */
export declare function symbol(category: AllCategory): InfallibleParser<SymbolNode>;
export declare function symbol(category: string): InfallibleParser<SymbolNode>;
export declare function symbol(options: SymbolOptions): InfallibleParser<SymbolNode>;
//# sourceMappingURL=symbol.d.ts.map