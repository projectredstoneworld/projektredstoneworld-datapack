import { localize } from '@spyglassmc/locales';
import { ErrorSeverity, LanguageError, Range } from '../source/index.js';
export class ErrorReporter {
    source;
    errors = [];
    constructor(source) {
        this.source = source;
    }
    /**
     * Reports a new error.
     */
    report(message, range, severity = ErrorSeverity.Error, info) {
        if (message.trim() === '') {
            throw new Error('Tried to report an error with no message');
        }
        this.errors.push(LanguageError.create(message, Range.get(range), severity, info, this.source));
    }
    /**
     * @returns All reported errors, and then clears the error stack.
     */
    dump() {
        const ans = Object.freeze(this.errors);
        this.errors = [];
        return ans;
    }
    /**
     * Adds all errors from another reporter's error stack to the current reporter.
     * This method does not affect the passed-in reporter.
     */
    absorb(reporter) {
        this.errors.push(...reporter.errors);
    }
}
export class LinterErrorReporter extends ErrorReporter {
    ruleName;
    ruleSeverity;
    constructor(ruleName, ruleSeverity, source) {
        super(source);
        this.ruleName = ruleName;
        this.ruleSeverity = ruleSeverity;
    }
    lint(message, range, info, severityOverride) {
        return this.report(localize('linter.diagnostic-message-wrapper', message, this.ruleName), range, severityOverride ?? this.ruleSeverity, info);
    }
    static fromErrorReporter(reporter, ruleName, ruleSeverity) {
        const ans = new LinterErrorReporter(ruleName, ruleSeverity, reporter.source);
        ans.errors = reporter.errors;
        return ans;
    }
}
//# sourceMappingURL=ErrorReporter.js.map