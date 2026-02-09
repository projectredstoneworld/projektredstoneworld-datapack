import { Range } from '../source/index.js';
export var Hover;
(function (Hover) {
    /* istanbul ignore next */
    function create(range, markdown) {
        return { range: Range.get(range), markdown };
    }
    Hover.create = create;
})(Hover || (Hover = {}));
//# sourceMappingURL=Hover.js.map