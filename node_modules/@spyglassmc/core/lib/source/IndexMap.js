import { Range } from './Range.js';
export var IndexMap;
(function (IndexMap) {
    function convertOffset(map, offset, from, to) {
        let ans = offset;
        for (const pair of map) {
            if (Range.contains(pair[from], offset)) {
                return pair[to].start;
            }
            else if (Range.endsBefore(pair[from], offset)) {
                ans = offset - pair[from].end + pair[to].end;
            }
            else {
                break;
            }
        }
        return ans;
    }
    function toInnerOffset(map, offset) {
        return convertOffset(map, offset, 'outer', 'inner');
    }
    IndexMap.toInnerOffset = toInnerOffset;
    function toInnerRange(map, outer) {
        return Range.create(toInnerOffset(map, outer.start), toInnerOffset(map, outer.end));
    }
    IndexMap.toInnerRange = toInnerRange;
    function toOuterOffset(map, offset) {
        return convertOffset(map, offset, 'inner', 'outer');
    }
    IndexMap.toOuterOffset = toOuterOffset;
    function toOuterRange(map, inner) {
        return Range.create(toOuterOffset(map, inner.start), toOuterOffset(map, inner.end));
    }
    IndexMap.toOuterRange = toOuterRange;
})(IndexMap || (IndexMap = {}));
//# sourceMappingURL=IndexMap.js.map