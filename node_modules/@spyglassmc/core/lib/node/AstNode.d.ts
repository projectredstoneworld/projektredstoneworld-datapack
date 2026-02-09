import type { DeepReadonly } from '../common/index.js';
import type { Color, FormattableColor } from '../processor/index.js';
import { Range } from '../source/index.js';
import type { Symbol, SymbolTable } from '../symbol/index.js';
export interface AstNode {
    type: string;
    range: Range;
    /**
     * All child nodes of this AST node.
     */
    children?: AstNode[];
    parent?: AstNode;
    locals?: SymbolTable;
    symbol?: Symbol;
    hover?: string;
    /**
     * An actual color that this node represents.
     */
    color?: Color | FormattableColor;
}
export declare namespace AstNode {
    export function is(obj: unknown): obj is AstNode;
    export function setParents(node: AstNode): void;
    /**
     * @param endInclusive Defaults to `false`.
     */
    export function findChildIndex(node: DeepReadonly<AstNode>, needle: number | Range, endInclusive?: boolean): number;
    /**
     * @param endInclusive Defaults to `false`.
     */
    export function findChild<N extends DeepReadonly<AstNode>>(node: N, needle: number | Range, endInclusive?: boolean): Exclude<N['children'], undefined>[number] | undefined;
    /**
     * Returns the index of the last child node that ends before the `needle`.
     *
     * @param endInclusive Defaults to `false`.
     */
    export function findLastChildIndex(node: DeepReadonly<AstNode>, needle: number | Range, endInclusive?: boolean): number;
    /**
     * @param endInclusive Defaults to `false`.
     */
    export function findLastChild<N extends DeepReadonly<AstNode>>(node: N, needle: number | Range, endInclusive?: boolean): (N['children'] extends readonly unknown[] ? N['children'][number] : undefined) | undefined;
    interface FindRecursivelyOptions<P = (node: AstNode) => boolean> {
        node: AstNode;
        needle: number;
        endInclusive?: boolean;
        predicate?: P;
    }
    /**
     * @returns The deepest node that both contains `needle` and satisfies the `predicate`.
     */
    export function findDeepestChild<N extends AstNode>(options: FindRecursivelyOptions<(node: AstNode) => node is N>): N | undefined;
    export function findDeepestChild(options: FindRecursivelyOptions): AstNode | undefined;
    /**
     * @returns The shallowest node that both contains `needle` and satisfies the `predicate`.
     */
    export function findShallowestChild<N extends AstNode>(options: FindRecursivelyOptions<(node: AstNode) => node is N>): N | undefined;
    export function findShallowestChild(options: FindRecursivelyOptions): AstNode | undefined;
    export function getLocalsToRoot(node: AstNode): Generator<SymbolTable>;
    export function getLocalsToLeaves(node: AstNode): Generator<SymbolTable>;
    export {};
}
export type Mutable<N> = N extends AstNode ? {
    -readonly [K in keyof N]: Mutable<N[K]>;
} : N;
//# sourceMappingURL=AstNode.d.ts.map