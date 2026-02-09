import { localize } from '@spyglassmc/locales';
import { Range } from '../source/index.js';
/**
 * Returns an error node containing all the remaining text (including whitespace),
 * or returns `undefined` if the `Source` has already reached its end.
 */
export const error = (src, ctx) => {
    if (!src.canRead()) {
        return undefined;
    }
    const ans = { type: 'error', range: Range.create(src, () => src.skipRemaining()) };
    ctx.err.report(localize('error.unparseable-content'), ans);
    return ans;
};
//# sourceMappingURL=error.js.map