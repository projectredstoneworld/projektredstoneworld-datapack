export var ReleaseVersion;
(function (ReleaseVersion) {
    /**
     * @returns
     * * `-1` if `a` is older than `b`.
     * * `0` if `a` is the same as `b`.
     * * `1` if `a` is newer than `b`.
     */
    function cmp(a, b) {
        const [majorA, minorA, patchA = 0] = a.split('.');
        const [majorB, minorB, patchB = 0] = b.split('.');
        if (majorA !== majorB) {
            return Math.sign(Number(majorA) - Number(majorB));
        }
        if (minorA !== minorB) {
            return Math.sign(Number(minorA) - Number(minorB));
        }
        return Math.sign(Number(patchA) - Number(patchB));
    }
    ReleaseVersion.cmp = cmp;
    /**
     * @returns `true` if `version` is newer than `since` (inclusive) and older
     * than `until` (exclusive)
     */
    function isBetween(version, since, until) {
        return cmp(version, since) >= 0 && cmp(version, until) < 0;
    }
    ReleaseVersion.isBetween = isBetween;
})(ReleaseVersion || (ReleaseVersion = {}));
export var PackMcmeta;
(function (PackMcmeta) {
    function readPackFormat(data) {
        const max = data?.pack?.max_format;
        if (Array.isArray(max) && max.length >= 1 && typeof max[0] === 'number') {
            return max[0]; // only return major pack format
        }
        if (typeof max === 'number') {
            return max;
        }
        const supported = data?.pack?.supported_formats;
        if (Array.isArray(supported) && supported.length === 2 && typeof supported[1] === 'number') {
            return supported[1];
        }
        if (typeof supported === 'object' && typeof supported?.max_inclusive === 'number') {
            return supported.max_inclusive;
        }
        const format = data?.pack?.pack_format;
        if (typeof format === 'number') {
            return format;
        }
        throw new Error('No pack format found');
    }
    PackMcmeta.readPackFormat = readPackFormat;
    async function getType(packRoot, externals) {
        const dir = await externals.fs.readdir(packRoot);
        const isResourcePack = dir.some(e => e.isDirectory() && e.name === 'assets')
            && !dir.some(e => e.isDirectory() && e.name === 'data');
        return isResourcePack ? 'assets' : 'data';
    }
    PackMcmeta.getType = getType;
})(PackMcmeta || (PackMcmeta = {}));
//# sourceMappingURL=common.js.map