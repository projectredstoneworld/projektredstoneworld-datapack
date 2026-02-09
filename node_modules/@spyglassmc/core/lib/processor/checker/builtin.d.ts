import type { AstNode, ResourceLocationNode, SymbolBaseNode } from '../../node/index.js';
import type { CheckerContext, MetaRegistry } from '../../service/index.js';
import type { Checker, SyncChecker } from './Checker.js';
export type AttemptResult = {
    errorAmount: number;
    totalErrorSpan: number;
    updateNodeAndCtx: () => void;
};
export declare function attempt<N extends AstNode>(checker: Checker<N>, node: N, ctx: CheckerContext): AttemptResult;
export declare function any<N extends AstNode>(checkers: Checker<N>[]): Checker<N>;
/**
 * No operation.
 */
export declare const noop: SyncChecker<AstNode>;
/**
 * Use the shallowest children that have their own checker to validate.
 */
export declare const fallback: Checker<AstNode>;
export declare const fallbackSync: SyncChecker<AstNode>;
export declare const dispatchSync: SyncChecker<AstNode>;
export declare const resourceLocation: Checker<ResourceLocationNode>;
export declare const symbol: Checker<SymbolBaseNode>;
export declare function registerCheckers(meta: MetaRegistry): void;
//# sourceMappingURL=builtin.d.ts.map