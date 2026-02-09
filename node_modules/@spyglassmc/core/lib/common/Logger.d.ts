export interface Logger {
    /**
     * Output an error message.
     */
    error(data: any, ...args: any[]): void;
    /**
     * Log an information.
     */
    info(data: any, ...args: any[]): void;
    /**
     * Log a message.
     */
    log(data: any, ...args: any[]): void;
    /**
     * Output a warning message.
     */
    warn(data: any, ...args: any[]): void;
}
export declare namespace Logger {
    /**
     * @returns The built-in `console`.
     * Do **not** use this implementation in language servers, as some clients cannot handle
     * non-LSP stdout. (https://github.com/SpyglassMC/Spyglass/issues/845)
     */
    function create(): Logger;
    /**
     * @returns A logger that does nothing.
     */
    function noop(): Logger;
}
//# sourceMappingURL=Logger.d.ts.map