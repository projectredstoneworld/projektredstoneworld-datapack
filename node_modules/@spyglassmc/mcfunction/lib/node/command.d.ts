import * as core from '@spyglassmc/core';
export interface CommandOptions {
    slash?: 'allowed' | 'required';
    maxLength?: number;
}
export interface CommandNode extends core.SequenceNode<CommandChildNode> {
    type: 'mcfunction:command';
    readonly options: CommandOptions;
    slash?: core.Range;
}
export declare namespace CommandNode {
    function is<T extends core.DeepReadonly<core.AstNode> | undefined>(node: T): node is core.InheritReadonly<CommandNode, T>;
    function mock(range: core.RangeLike, options?: CommandOptions): CommandNode;
}
export interface CommandChildNode extends core.AstNode {
    type: 'mcfunction:command_child';
    /**
     * The path of this node in the command tree. Empty if the current node does not correspond to an actual tree node.
     */
    path: string[];
    children: [core.AstNode];
}
export declare namespace CommandChildNode {
    function is(node: core.AstNode): node is CommandChildNode;
}
export interface TrailingCommandChildNode extends core.AstNode {
    type: 'mcfunction:command_child/trailing';
    value: string;
}
export interface UnknownCommandChildNode extends core.AstNode {
    type: 'mcfunction:command_child/unknown';
    value: string;
}
export interface LiteralCommandChildNode extends core.LiteralBaseNode {
    type: 'mcfunction:command_child/literal';
}
export declare namespace LiteralCommandChildNode {
    function is(node: core.AstNode | undefined): node is LiteralCommandChildNode;
}
//# sourceMappingURL=command.d.ts.map