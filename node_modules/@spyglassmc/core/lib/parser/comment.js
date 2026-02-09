import { Range } from '../source/index.js';
import { Failure } from './Parser.js';
/**
 * `Failure` when three isn't a comment.
 */
export function comment({ singleLinePrefixes, includesEol }) {
    return (src, _ctx) => {
        const start = src.cursor;
        const ans = {
            type: 'comment',
            range: Range.create(start),
            comment: '',
            prefix: '',
        };
        for (const prefix of singleLinePrefixes) {
            if (src.peek(prefix.length) === prefix) {
                if (includesEol) {
                    src.nextLine();
                }
                else {
                    src.skipLine();
                }
                ans.range.end = src.cursor;
                ans.comment = src.sliceToCursor(start + prefix.length);
                ans.prefix = prefix;
                return ans;
            }
        }
        return Failure;
    };
}
//# sourceMappingURL=comment.js.map