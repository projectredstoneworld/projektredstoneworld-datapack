export var Logger;
(function (Logger) {
    /* istanbul ignore next */
    /**
     * @returns The built-in `console`.
     * Do **not** use this implementation in language servers, as some clients cannot handle
     * non-LSP stdout. (https://github.com/SpyglassMC/Spyglass/issues/845)
     */
    function create() {
        return console;
    }
    Logger.create = create;
    /**
     * @returns A logger that does nothing.
     */
    function noop() {
        return new NoopLogger();
    }
    Logger.noop = noop;
})(Logger || (Logger = {}));
class NoopLogger {
    error() { }
    info() { }
    log() { }
    warn() { }
}
//# sourceMappingURL=Logger.js.map