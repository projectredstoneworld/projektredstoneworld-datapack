import { localize } from '@spyglassmc/locales';
import { ErrorSeverity, Range, Source } from '../source/index.js';
import { Failure } from './Parser.js';
const fallbackOnOutOfRange = (ans, _src, ctx, options) => {
    ctx.err.report(localize('expected', localize('integer.between', options.min ?? '-∞', options.max ?? '+∞')), ans, ErrorSeverity.Error);
};
export function integer(options) {
    return (src, ctx) => {
        const ans = { type: 'integer', range: Range.create(src), value: 0 };
        if (src.peek() === '-' || src.peek() === '+') {
            src.skip();
        }
        while (src.canRead() && Source.isDigit(src.peek())) {
            src.skip();
        }
        ans.range.end = src.cursor;
        const raw = src.sliceToCursor(ans.range.start);
        const isOnlySign = raw === '-' || raw === '+';
        if (!isOnlySign) {
            ans.value = Number(raw);
        }
        if (!raw) {
            if (options.failsOnEmpty) {
                return Failure;
            }
            ctx.err.report(localize('expected', localize('integer')), ans);
        }
        else if (!options.pattern.test(raw) || isOnlySign) {
            ctx.err.report(localize('parser.integer.illegal', options.pattern), ans);
        }
        else if ((options.min !== undefined && ans.value < options.min)
            || (options.max !== undefined && ans.value > options.max)) {
            const onOutOfRange = options.onOutOfRange ?? fallbackOnOutOfRange;
            onOutOfRange(ans, src, ctx, options);
        }
        return ans;
    };
}
//# sourceMappingURL=integer.js.map