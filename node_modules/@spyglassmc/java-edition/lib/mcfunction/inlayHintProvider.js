import * as core from '@spyglassmc/core';
import * as mcf from '@spyglassmc/mcfunction';
export const inlayHintProvider = (node, ctx) => {
    if (node.children[0]?.type !== 'mcfunction:entry') {
        return [];
    }
    const ans = [];
    core.traversePreOrder(node, (_) => true, mcf.CommandChildNode.is, (n) => {
        const node = n;
        const config = ctx.config.env.feature.inlayHint;
        if (config === true
            || (typeof config === 'object' && config.enabledNodes.includes(node.children[0].type))) {
            ans.push({
                offset: node.range.start,
                label: `${node.path[node.path.length - 1]}:`,
                paddingRight: true,
            });
        }
    });
    return ans;
};
//# sourceMappingURL=inlayHintProvider.js.map