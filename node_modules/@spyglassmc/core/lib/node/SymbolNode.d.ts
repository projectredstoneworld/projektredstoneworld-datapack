import type { RangeLike } from '../source/index.js';
import type { SymbolAccessType, SymbolUsageType } from '../symbol/index.js';
import type { AstNode } from './AstNode.js';
export interface SymbolOptions {
    category: string;
    subcategory?: string;
    parentPath?: string[];
    accessType?: SymbolAccessType;
    usageType?: SymbolUsageType;
}
export interface SymbolBaseNode extends AstNode {
    readonly options: SymbolOptions;
    value: string;
}
export interface SymbolNode extends SymbolBaseNode {
    readonly type: 'symbol';
}
export declare namespace SymbolNode {
    function is(obj: AstNode | undefined): obj is SymbolNode;
    function mock(range: RangeLike, options: SymbolOptions): SymbolNode;
}
//# sourceMappingURL=SymbolNode.d.ts.map