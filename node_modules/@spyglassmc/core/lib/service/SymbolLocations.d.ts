import type { RangeLike } from '../source/index.js';
import { Range } from '../source/index.js';
import type { SymbolLocation } from '../symbol/index.js';
export interface SymbolLocations {
    /**
     * The range of the currently selected symbol.
     */
    range: Range;
    /**
     * All locations of the symbol for the specific usage, or `undefined` if this symbol doesn't have the said usage.
     */
    locations: SymbolLocation[] | undefined;
}
export declare namespace SymbolLocations {
    function create(range: RangeLike, locations: SymbolLocation[] | undefined): SymbolLocations;
}
//# sourceMappingURL=SymbolLocations.d.ts.map