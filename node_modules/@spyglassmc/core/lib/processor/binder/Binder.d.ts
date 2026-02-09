import type { AstNode } from '../../node/index.js';
import type { BinderContext } from '../../service/index.js';
declare const IsAsync: unique symbol;
export type Binder<N extends AstNode> = SyncBinder<N> | AsyncBinder<N>;
export interface SyncBinderInitializer<N extends AstNode> {
    (node: N, ctx: BinderContext): void;
}
export interface SyncBinder<N extends AstNode> extends SyncBinderInitializer<N> {
    [IsAsync]?: never;
}
export declare namespace SyncBinder {
    function create<N extends AstNode>(binder: SyncBinderInitializer<N>): SyncBinder<N>;
    function is(binder: Binder<any>): binder is SyncBinder<any>;
}
interface AsyncBinderInitializer<N extends AstNode> {
    (node: N, ctx: BinderContext): Promise<void>;
}
export interface AsyncBinder<N extends AstNode> extends AsyncBinderInitializer<N> {
    [IsAsync]: true;
}
export declare namespace AsyncBinder {
    function create<N extends AstNode>(binder: AsyncBinderInitializer<N>): AsyncBinder<N>;
    function is(binder: Binder<any>): binder is AsyncBinder<any>;
}
export {};
//# sourceMappingURL=Binder.d.ts.map