import type { DeepReadonly } from '../../common/index.js';
import type { BooleanBaseNode } from '../../node/BooleanNode.js';
import type { FileNode, LiteralBaseNode, PairNode, Quote, RecordBaseNode, ResourceLocationNode, StringBaseNode, SymbolBaseNode } from '../../node/index.js';
import { AstNode } from '../../node/index.js';
import type { CompleterContext, MetaRegistry } from '../../service/index.js';
import type { RangeLike } from '../../source/index.js';
import type { Completer } from './Completer.js';
import { CompletionItem } from './Completer.js';
/**
 * Uses the shallowest selected node that has its own completer to provide the completion items.
 */
export declare const dispatch: Completer<AstNode>;
export declare const fallback: Completer<AstNode>;
export declare const boolean: Completer<BooleanBaseNode>;
/**
 * Dispatches to the corresponding file for the language.
 */
export declare const file: Completer<FileNode<AstNode>>;
export declare const literal: Completer<LiteralBaseNode>;
export declare const noop: Completer<any>;
interface RecordOptions<K extends AstNode, V extends AstNode, N extends RecordBaseNode<K, V>> {
    key: (record: DeepReadonly<N>, pair: DeepReadonly<PairNode<K, V>> | undefined, ctx: CompleterContext, range: RangeLike, insertValue: boolean, insertPairEnd: boolean, existingKeys: DeepReadonly<K>[]) => CompletionItem[];
    value: (record: DeepReadonly<N>, pair: DeepReadonly<PairNode<K, V>>, ctx: CompleterContext, range: RangeLike) => CompletionItem[];
}
export declare function record<K extends AstNode, V extends AstNode, N extends RecordBaseNode<K, V>>(o: RecordOptions<K, V, N>): Completer<N>;
export declare const resourceLocation: Completer<ResourceLocationNode>;
export declare const string: Completer<StringBaseNode>;
export declare function escapeString(value: string, quote?: Quote): string;
export declare const symbol: Completer<SymbolBaseNode>;
export declare function registerCompleters(meta: MetaRegistry): void;
export {};
//# sourceMappingURL=builtin.d.ts.map