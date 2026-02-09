import { PositionRange } from './PositionRange.js';
import { Range } from './Range.js';
export var Location;
(function (Location) {
    function get(partial) {
        return {
            uri: partial.uri ?? '',
            range: Range.get(partial.range ?? { start: 0, end: 0 }),
            posRange: partial.posRange
                ?? { start: { line: 0, character: 0 }, end: { line: 0, character: 0 } },
        };
    }
    Location.get = get;
    function create(doc, range) {
        return Location.get({ uri: doc.uri, range, posRange: PositionRange.from(range, doc) });
    }
    Location.create = create;
})(Location || (Location = {}));
//# sourceMappingURL=Location.js.map