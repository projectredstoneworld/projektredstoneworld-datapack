import { ResourceLocation } from '../common/index.js';
import { Range } from '../source/index.js';
export var ResourceLocationNode;
(function (ResourceLocationNode) {
    /**
     * The prefix for tags.
     */
    const TagPrefix = ResourceLocation.TagPrefix;
    /**
     * The seperator of namespace and path.
     */
    const NamespacePathSep = ResourceLocation.NamespacePathSep;
    /**
     * The seperator between different path segments.
     */
    const PathSep = ResourceLocation.PathSep;
    const DefaultNamespace = ResourceLocation.DefaultNamespace;
    /* istanbul ignore next */
    function is(obj) {
        return (obj?.type === 'resource_location');
    }
    ResourceLocationNode.is = is;
    function mock(range, options) {
        return { type: 'resource_location', range: Range.get(range), options };
    }
    ResourceLocationNode.mock = mock;
    function toString(node, type = 'origin', includesTagPrefix = false) {
        const path = node.path ? node.path.join(PathSep) : '';
        let id;
        /*
         * `node.namespace` has four statuses here:
         * - `minecraft`
         * - `` (yes, empty string)
         * - undefined
         * - any other namespaces.
         *
         * Whether `node.namespace !== undefined` or simply `node.namespace` is used in the condition is carefully selected.
         */
        switch (type) {
            case 'origin':
                // Use `node.namespace !== undefined`, so that empty namespaces can be correctly restored to string.
                id = node.namespace !== undefined ? `${node.namespace}${NamespacePathSep}${path}` : path;
                break;
            case 'full':
                // Use `node.namespace` before `||`, so that both undefined and empty value can result in the default namespace.
                // Use `||` instead of `??`, so that empty namespaces can be converted to the default namespace.
                id = `${node.namespace || DefaultNamespace}${NamespacePathSep}${path}`;
                break;
            case 'short':
                // Use `node.namespace` before `&&` for the same reason stated above.
                id = node.namespace && node.namespace !== DefaultNamespace
                    ? `${node.namespace}${NamespacePathSep}${path}`
                    : path;
                break;
        }
        return includesTagPrefix && node.isTag ? `${TagPrefix}${id}` : id;
    }
    ResourceLocationNode.toString = toString;
})(ResourceLocationNode || (ResourceLocationNode = {}));
//# sourceMappingURL=ResourceLocationNode.js.map