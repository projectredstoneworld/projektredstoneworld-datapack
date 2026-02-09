import type { Externals, Logger } from '../common/index.js';
import type { Dependency } from './Dependency.js';
import type { RootUriString } from './fileUtil.js';
export interface UriProtocolSupporter {
    /**
     * @throws
     *
     * @returns A hash created from the content of the item at `uri`. This hash is used by the cache invalidation
     * mechanism to check if an item has been modified, therefore it doesn't need to use a super duper secure hash
     * algorithm. Algorithms like SHA-1 or MD5 should be good enough.
     */
    hash(uri: string): Promise<string>;
    /**
     * @param uri A file URI.
     * @returns The content of the file at `uri`.
     * @throws If the URI doesn't exist in the file system.
     */
    readFile(uri: string): Promise<Uint8Array<ArrayBuffer>>;
    listFiles(): Iterable<string>;
    /**
     * Each URI in this array must end with a slash (`/`).
     */
    listRoots(): Iterable<RootUriString>;
}
type Protocol = `${string}:`;
export interface FileService extends UriProtocolSupporter {
    /**
     * @param protocol A protocol of URI, including the colon. e.g. `file:`.
     * @param supporter The supporter for that `protocol`.
     * @param force If the protocol is already supported, whether to override it or not.
     *
     * @throws If `protocol` is already registered, unless `force` is set to `true`.
     */
    register(protocol: Protocol, supporter: UriProtocolSupporter, force?: boolean): void;
    /**
     * Unregister the supported associated with `protocol`. Nothing happens if the `protocol` isn't supported.
     */
    unregister(protocol: Protocol): void;
    /**
     * Map the item at `uri` to physical disk.
     *
     * @returns The `file:` URI of the mapped file, or `undefined` if it cannot be mapped.
     */
    mapToDisk(uri: string): Promise<string | undefined>;
    /**
     * Map the item at `uri` from physical disk back to a (virtual) URI used by Spyglass internally.
     */
    mapFromDisk(uri: string): string;
}
export declare namespace FileService {
    function create(externals: Externals, cacheRoot: RootUriString): FileService;
}
export declare class FileServiceImpl implements FileService {
    private readonly externals;
    private readonly virtualUrisRoot?;
    private readonly supporters;
    /**
     * A two-way map from mapped physical URIs to virtual URIs.
     */
    private readonly map;
    constructor(externals: Externals, virtualUrisRoot?: RootUriString | undefined);
    register(protocol: Protocol, supporter: UriProtocolSupporter, force?: boolean): void;
    unregister(protocol: Protocol): void;
    /**
     * @throws If the protocol of `uri` isn't supported.
     *
     * @returns The protocol if it's supported.
     */
    private getSupportedProtocol;
    /**
     * @throws
     */
    hash(uri: string): Promise<string>;
    /**
     * @throws
     */
    readFile(uri: string): Promise<Uint8Array<ArrayBuffer>>;
    listFiles(): Generator<string, void, any>;
    listRoots(): Generator<`${string}/`, void, any>;
    mapToDisk(virtualUri: string): Promise<string | undefined>;
    mapFromDisk(mappedUri: string): string;
}
export declare class FileUriSupporter implements UriProtocolSupporter {
    private readonly externals;
    private readonly roots;
    private readonly files;
    readonly protocol = "file:";
    private constructor();
    hash(uri: string): Promise<string>;
    readFile(uri: string): Promise<Uint8Array<ArrayBuffer>>;
    listFiles(): Generator<string, void, unknown>;
    listRoots(): `${string}/`[];
    mapToDisk(uri: string): Promise<string | undefined>;
    static create(dependencies: readonly Dependency[], externals: Externals, logger: Logger): Promise<FileUriSupporter>;
}
export declare class ArchiveUriSupporter implements UriProtocolSupporter {
    private readonly externals;
    private readonly logger;
    private readonly archiveHashes;
    private readonly entries;
    static readonly Protocol = "archive:";
    readonly protocol = "archive:";
    /**
     * @param entries A map from archive names to unzipped entries.
     */
    private constructor();
    hash(uri: string): Promise<string>;
    readFile(uri: string): Promise<Uint8Array<ArrayBuffer>>;
    /**
     * @throws
     */
    private getDataInArchive;
    listFiles(): Generator<string, void, unknown>;
    listRoots(): Generator<`${string}/`, void, unknown>;
    private static getUri;
    /**
     * @throws When `uri` has the wrong protocol or hostname.
     */
    private static decodeUri;
    static create(dependencies: readonly Dependency[], externals: Externals, logger: Logger): Promise<ArchiveUriSupporter>;
}
export {};
//# sourceMappingURL=FileService.d.ts.map