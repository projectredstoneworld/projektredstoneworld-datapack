import { PositionRange } from './PositionRange.js';
export var LanguageError;
(function (LanguageError) {
    function create(message, range, severity = ErrorSeverity.Error, info, source) {
        const ans = { range, message, severity };
        if (info) {
            ans.info = info;
        }
        if (source) {
            ans.source = source;
        }
        return ans;
    }
    LanguageError.create = create;
    /**
     * @returns A {@link PosRangeLanguageError}.
     */
    function withPosRange(error, doc) {
        return {
            posRange: PositionRange.from(error.range, doc),
            message: error.message,
            severity: error.severity,
            ...(error.info && { info: error.info }),
            ...(error.source && { source: error.source }),
        };
    }
    LanguageError.withPosRange = withPosRange;
})(LanguageError || (LanguageError = {}));
export var ErrorSeverity;
(function (ErrorSeverity) {
    ErrorSeverity[ErrorSeverity["Hint"] = 0] = "Hint";
    ErrorSeverity[ErrorSeverity["Information"] = 1] = "Information";
    ErrorSeverity[ErrorSeverity["Warning"] = 2] = "Warning";
    ErrorSeverity[ErrorSeverity["Error"] = 3] = "Error";
})(ErrorSeverity || (ErrorSeverity = {}));
//# sourceMappingURL=LanguageError.js.map