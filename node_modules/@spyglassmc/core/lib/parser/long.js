import { localize } from '@spyglassmc/locales';
import { ErrorSeverity, Range, Source } from '../source/index.js';
import { Failure } from './Parser.js';
const fallbackOnOutOfRange = (ans, _src, ctx, options) => {
    ctx.err.report(localize('expected', localize('long.between', options.min ?? '-∞', options.max ?? '+∞')), ans, ErrorSeverity.Error);
};
export function long(options) {
    return (src, ctx) => {
        const ans = { type: 'long', range: Range.create(src), value: 0n };
        if (src.peek() === '-' || src.peek() === '+') {
            src.skip();
        }
        while (src.canRead() && Source.isDigit(src.peek())) {
            src.skip();
        }
        ans.range.end = src.cursor;
        const raw = src.sliceToCursor(ans.range.start);
        let isOnlySign = false;
        try {
            ans.value = BigInt(raw);
        }
        catch (_) {
            // `raw` might be "+" or "-" here.
            isOnlySign = true;
        }
        if (!raw) {
            if (options.failsOnEmpty) {
                return Failure;
            }
            ctx.err.report(localize('expected', localize('long')), ans);
        }
        else if (!options.pattern.test(raw) || isOnlySign) {
            ctx.err.report(localize('parser.long.illegal', options.pattern), ans);
        }
        else if ((options.min && ans.value < options.min) || (options.max && ans.value > options.max)) {
            const onOutOfRange = options.onOutOfRange ?? fallbackOnOutOfRange;
            onOutOfRange(ans, src, ctx, options);
        }
        return ans;
    };
}
//# sourceMappingURL=long.js.map