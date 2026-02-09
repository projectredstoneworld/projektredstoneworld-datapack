import { Range } from '../source/index.js';
export var SymbolLocations;
(function (SymbolLocations) {
    /* istanbul ignore next */
    function create(range, locations) {
        return { range: Range.get(range), locations };
    }
    SymbolLocations.create = create;
})(SymbolLocations || (SymbolLocations = {}));
//# sourceMappingURL=SymbolLocations.js.map