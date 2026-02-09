import * as core from '@spyglassmc/core';
import { localize } from '@spyglassmc/locales';
import { command } from './command.js';
import { macro } from './macro.js';
function mcfunction(commandTree, argument, options) {
    return (src, ctx) => {
        const ans = {
            type: 'mcfunction:entry',
            range: core.Range.create(src),
            children: [],
        };
        while (src.skipWhitespace().canReadInLine()) {
            let result;
            if (src.peek() === '#') {
                result = comment(src, ctx);
            }
            else if (src.peek() === '$') {
                const start = src.cursor;
                if (options.macros) {
                    result = macro()(src, ctx);
                }
                else {
                    src.skipLine();
                    ans.range.end = src.cursor;
                    result = {
                        type: 'error',
                        range: core.Range.create(start, src),
                    };
                    ctx.err.report(localize('mcfunction.parser.macro.disallowed'), result);
                }
            }
            else {
                result = command(commandTree, argument, options.commandOptions)(src, ctx);
            }
            ans.children.push(result);
            src.nextLine();
        }
        ans.range.end = src.cursor;
        return ans;
    };
}
const comment = core.comment({ singleLinePrefixes: new Set(['#']) });
export const entry = (commandTree, argument, options = {}) => {
    const parser = mcfunction(commandTree, argument, options);
    return options.lineContinuation ? core.concatOnTrailingBackslash(parser) : parser;
};
//# sourceMappingURL=entry.js.map