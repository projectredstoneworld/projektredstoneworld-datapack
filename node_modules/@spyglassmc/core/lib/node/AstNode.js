import binarySearch from 'binary-search';
import { Range } from '../source/index.js';
export var AstNode;
(function (AstNode) {
    /* istanbul ignore next */
    function is(obj) {
        return (!!obj
            && typeof obj === 'object'
            && typeof obj.type === 'string'
            && Range.is(obj.range));
    }
    AstNode.is = is;
    function setParents(node) {
        for (const child of node.children ?? []) {
            child.parent = node;
            setParents(child);
        }
    }
    AstNode.setParents = setParents;
    /**
     * @param endInclusive Defaults to `false`.
     */
    function findChildIndex(node, needle, endInclusive = false) {
        if (!node.children) {
            return -1;
        }
        const comparator = typeof needle === 'number' ? Range.compareOffset : Range.compare;
        return binarySearch(node.children, needle, (a, b) => comparator(a.range, b, endInclusive));
    }
    AstNode.findChildIndex = findChildIndex;
    /**
     * @param endInclusive Defaults to `false`.
     */
    function findChild(node, needle, endInclusive = false) {
        return node.children?.[findChildIndex(node, needle, endInclusive)];
    }
    AstNode.findChild = findChild;
    /**
     * Returns the index of the last child node that ends before the `needle`.
     *
     * @param endInclusive Defaults to `false`.
     */
    function findLastChildIndex(node, needle, endInclusive = false) {
        if (!node.children) {
            return -1;
        }
        let ans = -1;
        for (const [i, childNode] of node.children.entries()) {
            if (Range.endsBefore(childNode.range, needle, endInclusive)) {
                ans = i;
            }
            else {
                break;
            }
        }
        return ans;
    }
    AstNode.findLastChildIndex = findLastChildIndex;
    /**
     * @param endInclusive Defaults to `false`.
     */
    function findLastChild(node, needle, endInclusive = false) {
        return node.children?.[findLastChildIndex(node, needle, endInclusive)];
    }
    AstNode.findLastChild = findLastChild;
    function findDeepestChild({ node, needle, endInclusive = false, predicate = () => true }) {
        let last;
        let head = Range.contains(node, needle, endInclusive) ? node : undefined;
        while (head && predicate(head)) {
            last = head;
            head = findChild(head, needle, endInclusive);
        }
        return last;
    }
    AstNode.findDeepestChild = findDeepestChild;
    function findShallowestChild({ node, needle, endInclusive = false, predicate = () => true }) {
        let head = Range.contains(node, needle, endInclusive) ? node : undefined;
        while (head && !predicate(head)) {
            head = findChild(head, needle, endInclusive);
        }
        return head;
    }
    AstNode.findShallowestChild = findShallowestChild;
    function* getLocalsToRoot(node) {
        let head = node;
        while (head) {
            if (head.locals) {
                yield head.locals;
            }
            head = node.parent;
        }
    }
    AstNode.getLocalsToRoot = getLocalsToRoot;
    function* getLocalsToLeaves(node) {
        if (node.locals) {
            yield node.locals;
        }
        for (const child of node.children ?? []) {
            yield* getLocalsToLeaves(child);
        }
    }
    AstNode.getLocalsToLeaves = getLocalsToLeaves;
})(AstNode || (AstNode = {}));
//# sourceMappingURL=AstNode.js.map