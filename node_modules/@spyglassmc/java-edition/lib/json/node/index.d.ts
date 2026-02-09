import type * as core from '@spyglassmc/core';
export type TextureSlotKind = 'definition' | 'value' | 'reference';
export interface TextureSlotNode extends core.AstNode {
    type: 'java_edition:texture_slot';
    kind: TextureSlotKind;
    children: (core.LiteralNode | core.SymbolNode | core.ResourceLocationNode)[];
    slot?: core.SymbolNode;
    id?: core.ResourceLocationNode;
}
export declare namespace TextureSlotNode {
    function is(node: core.AstNode): node is TextureSlotNode;
}
export interface TranslationValueNode extends core.AstNode {
    type: 'java_edition:translation_value';
    children: core.LiteralNode[];
    value: string;
}
export declare namespace TranslationValueNode {
    function is(node: core.AstNode): node is TranslationValueNode;
}
//# sourceMappingURL=index.d.ts.map