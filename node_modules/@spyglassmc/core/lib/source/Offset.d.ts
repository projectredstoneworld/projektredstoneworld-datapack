import { ReadonlySource } from './Source.js';
export type OffsetLike = number | ReadonlySource | ((this: void) => number | ReadonlySource);
export declare namespace Offset {
    /**
     * Get an offset from a `OffsetLike`.
     *
     * @returns
     * - `number`: itself.
     * - `Source`: its `cursor`.
     */
    function get(offset: OffsetLike): number;
}
//# sourceMappingURL=Offset.d.ts.map