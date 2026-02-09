import type { AstNode, SymbolBaseNode } from '../../node/index.js';
import { ResourceLocationNode } from '../../node/index.js';
import type { BinderContext, MetaRegistry } from '../../service/index.js';
import type { Binder } from './Binder.js';
import { AsyncBinder, SyncBinder } from './Binder.js';
export type AttemptResult = {
    errorAmount: number;
    totalErrorSpan: number;
    updateNodeAndCtx: () => void;
};
export declare function attempt<B extends Binder<never>>(binder: B, node: B extends Binder<infer N extends AstNode> ? N : never, ctx: BinderContext): B extends SyncBinder<any> ? AttemptResult : Promise<AttemptResult>;
type ExtractBinder<B extends Binder<never>> = B extends Binder<infer N extends AstNode> ? N : never;
export declare function any<Binders extends Binder<never>[]>(binders: Binders): Binders extends SyncBinder<never>[] ? SyncBinder<ExtractBinder<Binders[number]>> : AsyncBinder<ExtractBinder<Binders[number]>>;
/**
 * No operation.
 */
export declare const noop: SyncBinder<AstNode>;
/**
 * Use the shallowest children that have their own binder to validate.
 */
export declare const fallback: AsyncBinder<AstNode>;
export declare const fallbackSync: SyncBinder<AstNode>;
export declare const dispatchSync: SyncBinder<AstNode>;
export declare const resourceLocation: SyncBinder<ResourceLocationNode>;
export declare const symbol: SyncBinder<SymbolBaseNode>;
export declare function registerBinders(meta: MetaRegistry): void;
export {};
//# sourceMappingURL=builtin.d.ts.map