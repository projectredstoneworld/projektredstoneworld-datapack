import type { LanguageErrorInfo, RangeLike } from '../source/index.js';
import { ErrorSeverity, LanguageError } from '../source/index.js';
export declare class ErrorReporter {
    readonly source?: string | undefined;
    errors: LanguageError[];
    constructor(source?: string | undefined);
    /**
     * Reports a new error.
     */
    report(message: string, range: RangeLike, severity?: ErrorSeverity, info?: LanguageErrorInfo): void;
    /**
     * @returns All reported errors, and then clears the error stack.
     */
    dump(): readonly LanguageError[];
    /**
     * Adds all errors from another reporter's error stack to the current reporter.
     * This method does not affect the passed-in reporter.
     */
    absorb(reporter: ErrorReporter): void;
}
export declare class LinterErrorReporter extends ErrorReporter {
    ruleName: string;
    ruleSeverity: ErrorSeverity;
    constructor(ruleName: string, ruleSeverity: ErrorSeverity, source?: string);
    lint(message: string, range: RangeLike, info?: LanguageErrorInfo, severityOverride?: ErrorSeverity): void;
    static fromErrorReporter(reporter: ErrorReporter, ruleName: string, ruleSeverity: ErrorSeverity): LinterErrorReporter;
}
//# sourceMappingURL=ErrorReporter.d.ts.map