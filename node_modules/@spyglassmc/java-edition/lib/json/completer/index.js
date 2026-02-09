import * as core from '@spyglassmc/core';
const textureSlot = (node, ctx) => {
    const slot = node.slot ?? core.SymbolNode.mock(node, {
        category: 'texture_slot',
        usageType: node.kind === 'definition' ? 'definition' : 'reference',
    });
    const slotItems = core.completer.symbol(slot, ctx);
    if (node.kind === 'definition') {
        return slotItems;
    }
    if (node.kind === 'reference') {
        return slotItems.map(item => ({
            ...item,
            range: node.range,
            label: '#' + item.label,
            insertText: '#' + (item.insertText ?? item.label),
        }));
    }
    const id = node.id ?? core.ResourceLocationNode.mock(node, { category: 'texture' });
    return core.completer.resourceLocation(id, ctx);
};
export function register(meta) {
    meta.registerCompleter('java_edition:texture_slot', textureSlot);
}
//# sourceMappingURL=index.js.map