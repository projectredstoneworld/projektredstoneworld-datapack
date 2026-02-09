import type * as core from '@spyglassmc/core';
import type * as mcdoc from '@spyglassmc/mcdoc';
interface NbtBaseNode {
    typeDef?: mcdoc.runtime.checker.SimplifiedMcdocType;
    requireCanonical?: boolean;
}
export type NbtNode = NbtPrimitiveNode | NbtCompoundNode | NbtCollectionNode;
export declare namespace NbtNode {
    function is(node: core.AstNode | undefined): node is NbtNode;
}
export type NbtPrimitiveNode = NbtNumberNode | NbtStringNode;
export declare namespace NbtPrimitiveNode {
    function is(node: core.AstNode | undefined): node is NbtPrimitiveNode;
}
export interface NbtStringNode extends core.StringBaseNode, NbtBaseNode {
    readonly type: 'nbt:string';
}
export declare namespace NbtStringNode {
    function is(obj: object | undefined): obj is NbtStringNode;
}
export type NbtNumberNode = NbtIntegerAlikeNode | NbtFloatAlikeNode;
export declare namespace NbtNumberNode {
    function is(node: core.AstNode | undefined): node is NbtNumberNode;
}
export type NbtIntegerAlikeNode = NbtByteNode | NbtShortNode | NbtIntNode | NbtLongNode;
export declare namespace NbtIntegerAlikeNode {
    function is(node: core.AstNode | undefined): node is NbtIntegerAlikeNode;
}
export interface NbtByteNode extends core.IntegerBaseNode, NbtBaseNode {
    readonly type: 'nbt:byte';
}
export declare namespace NbtByteNode {
    function is(node: core.AstNode | undefined): node is NbtByteNode;
}
export interface NbtShortNode extends core.IntegerBaseNode, NbtBaseNode {
    readonly type: 'nbt:short';
}
export declare namespace NbtShortNode {
    function is(node: core.AstNode | undefined): node is NbtShortNode;
}
export interface NbtIntNode extends core.IntegerBaseNode, NbtBaseNode {
    readonly type: 'nbt:int';
}
export declare namespace NbtIntNode {
    function is(node: core.AstNode | undefined): node is NbtIntNode;
}
export interface NbtLongNode extends core.LongBaseNode, NbtBaseNode {
    readonly type: 'nbt:long';
}
export declare namespace NbtLongNode {
    function is(node: core.AstNode | undefined): node is NbtLongNode;
}
export type NbtFloatAlikeNode = NbtFloatNode | NbtDoubleNode;
export declare namespace NbtFloatAlikeNode {
    function is(node: core.AstNode | undefined): node is NbtFloatAlikeNode;
}
export interface NbtFloatNode extends core.FloatBaseNode, NbtBaseNode {
    readonly type: 'nbt:float';
}
export declare namespace NbtFloatNode {
    function is(node: core.AstNode | undefined): node is NbtFloatNode;
}
export interface NbtDoubleNode extends core.FloatBaseNode, NbtBaseNode {
    readonly type: 'nbt:double';
}
export declare namespace NbtDoubleNode {
    function is(node: core.AstNode | undefined): node is NbtDoubleNode;
}
export interface NbtCompoundNode extends core.RecordBaseNode<NbtStringNode, NbtNode>, NbtBaseNode {
    readonly type: 'nbt:compound';
}
export declare namespace NbtCompoundNode {
    function is(node: core.AstNode | undefined): node is NbtCompoundNode;
}
export type NbtCollectionNode = NbtListNode | NbtPrimitiveArrayNode;
export declare namespace NbtCollectionNode {
    function is(node: core.AstNode | undefined): node is NbtCollectionNode;
}
export interface NbtListNode extends core.ListNode<NbtNode>, NbtBaseNode {
    type: 'nbt:list';
    valueType?: NbtNode['type'];
}
export declare namespace NbtListNode {
    function is(node: core.AstNode | undefined): node is NbtListNode;
}
export type NbtPrimitiveArrayNode = NbtByteArrayNode | NbtIntArrayNode | NbtLongArrayNode;
export declare namespace NbtPrimitiveArrayNode {
    function is(node: core.AstNode | undefined): node is NbtPrimitiveArrayNode;
}
export interface NbtByteArrayNode extends core.ListNode<NbtByteNode>, NbtBaseNode {
    type: 'nbt:byte_array';
}
export declare namespace NbtByteArrayNode {
    function is(node: core.AstNode | undefined): node is NbtByteArrayNode;
}
export interface NbtIntArrayNode extends core.ListNode<NbtIntNode>, NbtBaseNode {
    type: 'nbt:int_array';
}
export declare namespace NbtIntArrayNode {
    function is(node: core.AstNode | undefined): node is NbtIntArrayNode;
}
export interface NbtLongArrayNode extends core.ListNode<NbtLongNode>, NbtBaseNode {
    type: 'nbt:long_array';
}
export declare namespace NbtLongArrayNode {
    function is(node: core.AstNode | undefined): node is NbtLongArrayNode;
}
export type NbtPathChild = NbtPathKeyNode | NbtPathFilterNode | NbtPathIndexNode;
export interface NbtPathNode extends core.AstNode {
    type: 'nbt:path';
    children: NbtPathChild[];
    /**
     * The type definition at the end of the path
     */
    endTypeDef?: mcdoc.runtime.checker.SimplifiedMcdocType;
}
export declare namespace NbtPathNode {
    function is(node: core.AstNode | undefined): node is NbtPathNode;
}
export interface NbtPathKeyNode extends core.AstNode, NbtBaseNode {
    type: 'nbt:path/key';
    children: [NbtStringNode];
}
export declare namespace NbtPathKeyNode {
    function is(node: core.AstNode | undefined): node is NbtPathKeyNode;
}
export interface NbtPathFilterNode extends core.AstNode, NbtBaseNode {
    type: 'nbt:path/filter';
    children: [NbtCompoundNode];
}
export declare namespace NbtPathFilterNode {
    function is(node: core.AstNode | undefined): node is NbtPathFilterNode;
}
export interface NbtPathIndexNode extends core.AstNode, NbtBaseNode {
    type: 'nbt:path/index';
    children: [core.IntegerNode] | [NbtCompoundNode] | undefined;
}
export declare namespace NbtPathIndexNode {
    function is(node: core.AstNode | undefined): node is NbtPathIndexNode;
}
export interface TypedNbtNode extends core.AstNode {
    type: 'nbt:typed';
    children: [NbtNode];
    targetType: mcdoc.McdocType;
}
export declare namespace TypedNbtNode {
    function is(node: core.AstNode | undefined): node is TypedNbtNode;
}
export {};
//# sourceMappingURL=index.d.ts.map