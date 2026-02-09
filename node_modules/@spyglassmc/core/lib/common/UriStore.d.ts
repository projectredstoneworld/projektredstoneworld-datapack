import type { RootUriString } from '../service/index.js';
/**
 * Stores a collection of URIs in a trie. Each file URI can optionally have a metadata associated
 * with it. No actual file system I/O is performed by this class.
 */
export declare class UriStore {
    #private;
    /**
     * Adds a file URI or a directory URI to the store.
     * Directory URIs must end with a slash (`/`), otherwise it will be treated as a file URI.
     */
    add(uri: string): void;
    /**
     * Returns true if the specified URI exists in the store and is of the expected type.
     * Directory URIs must end with a slash (`/`), otherwise it will be treated as a file URI.
     */
    has(uri: string): boolean;
    /**
     * Deletes a URI from the store if it exists.
     * For directories, all sub URIs under them will be recursively removed.
     */
    delete(uri: string): void;
    /**
     * Returns names of all direct children of the URI.
     * An empty result is generated if the directory URI does not exist.
     */
    getChildrenNames(uri: RootUriString): Generator<string>;
    /**
     * Returns URIs of all files under a directory and its subdirectories.
     * An empty result is generated if the directory URI does not exist.
     */
    getSubFiles(uri: RootUriString): Generator<string>;
    /**
     * Removes all URIs from the store.
     */
    clear(): void;
    /**
     * Creates a deep copy of this store.
     */
    clone(): UriStore;
    [Symbol.iterator](): Generator<string, any, any>;
}
//# sourceMappingURL=UriStore.d.ts.map