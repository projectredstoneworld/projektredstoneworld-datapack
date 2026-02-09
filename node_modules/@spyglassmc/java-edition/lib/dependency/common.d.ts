import type * as core from '@spyglassmc/core';
export type ReleaseVersion = `${bigint}.${bigint}.${bigint}` | `${bigint}.${bigint}`;
export declare namespace ReleaseVersion {
    /**
     * @returns
     * * `-1` if `a` is older than `b`.
     * * `0` if `a` is the same as `b`.
     * * `1` if `a` is newer than `b`.
     */
    function cmp(a: ReleaseVersion, b: ReleaseVersion): number;
    /**
     * @returns `true` if `version` is newer than `since` (inclusive) and older
     * than `until` (exclusive)
     */
    function isBetween(version: ReleaseVersion, since: ReleaseVersion, until: ReleaseVersion): boolean;
}
export interface VersionInfo {
    release: ReleaseVersion;
    id: string;
    name: string;
    data_pack_version: number;
    resource_pack_version: number;
}
export declare namespace PackMcmeta {
    function readPackFormat(data: any): number;
    function getType(packRoot: string, externals: core.Externals): Promise<"assets" | "data">;
}
export interface PackInfo {
    type: 'data' | 'assets';
    packRoot: string;
    format: number;
}
//# sourceMappingURL=common.d.ts.map