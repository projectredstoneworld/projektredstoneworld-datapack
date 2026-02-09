export type Dependency = {
    type: 'directory';
    uri: string;
} | {
    type: 'tarball-file';
    uri: string;
    stripLevel?: number;
} | {
    type: 'tarball-ram';
    name: string;
    data: Uint8Array<ArrayBuffer>;
    stripLevel?: number;
};
export type DependencyKey = `@${string}`;
export declare namespace DependencyKey {
    function is(value: string): value is DependencyKey;
}
export type DependencyProvider = () => PromiseLike<Dependency> | Dependency;
//# sourceMappingURL=Dependency.d.ts.map