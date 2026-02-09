import { Range } from '../source/index.js';
import { literal } from './literal.js';
import { Failure } from './Parser.js';
export function prefixed(options) {
    return (src, ctx) => {
        const ans = {
            type: 'prefixed',
            range: Range.create(src),
            prefix: options.prefix,
            children: [],
        };
        const prefix = literal(options.prefix)(src, ctx);
        ans.children.push(prefix);
        ans.range.end = src.cursor;
        const child = options.child(src, ctx);
        if (child !== Failure) {
            ans.children.push(child);
        }
        ans.range.end = src.cursor;
        return ans;
    };
}
//# sourceMappingURL=prefixed.js.map