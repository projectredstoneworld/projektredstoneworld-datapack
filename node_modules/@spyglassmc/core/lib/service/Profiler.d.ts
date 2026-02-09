import { Logger } from '../common/index.js';
/**
 * @example
 * ```typescript
 * const __profiler = profilerFactory.get('id')
 *
 * // Do Task 1 here
 * // ...
 * __profiler.task('Task 1')
 *
 * // Do Task 2 here
 * // ...
 * __profiler.task('Task 2').finalize()
 * ```
 */
export interface Profiler {
    /**
     * Call after a task has been finished.
     */
    task(name: string): this;
    /**
     * Call after the whole procedure that is being profiled is done.
     */
    finalize(): void;
}
export declare class ProfilerFactory {
    #private;
    private readonly logger;
    constructor(logger: Logger, enabledProfilers: string[]);
    get(id: string, style: 'top-n', n: number): Profiler;
    get(id: string, style?: 'total'): Profiler;
    static noop(): ProfilerFactory;
}
//# sourceMappingURL=Profiler.d.ts.map