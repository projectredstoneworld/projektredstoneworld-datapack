import { AstNode } from '../node/index.js';
import { Range } from '../source/index.js';
import { error } from './error.js';
import { Failure } from './Parser.js';
/**
 * Dispatches to the corresponding parser for the language.
 * @throws If there's no parser registered for this language ID.
 */
export function file(parser) {
    return (src, ctx) => {
        const fullRange = Range.create(src, src.string.length);
        const ans = {
            type: 'file',
            range: fullRange,
            children: [],
            locals: Object.create(null),
            parserErrors: [],
        };
        src.skipWhitespace();
        const result = parser(src, ctx);
        if (result && result !== Failure) {
            ans.children.push(result);
        }
        if (src.skipWhitespace().canRead()) {
            ans.children.push(error(src, ctx));
        }
        AstNode.setParents(ans);
        ans.parserErrors = ctx.err.dump();
        return ans;
    };
}
//# sourceMappingURL=file.js.map