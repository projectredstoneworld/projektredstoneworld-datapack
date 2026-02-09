export function identifierToSeg(identifier) {
    const ans = identifier.slice(2).split('::');
    if (ans.length === 1 && ans[0] === '') {
        return [];
    }
    return ans;
}
export function segToIdentifier(seg) {
    return `::${seg.join('::')}`;
}
//# sourceMappingURL=common.js.map