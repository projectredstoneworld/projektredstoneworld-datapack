import { localize } from '@spyglassmc/locales';
import { TypeDefSymbolData } from '../binder/index.js';
import { PathNode, ReferenceTypeNode, TypeArgBlockNode, TypeBaseNode } from '../node/index.js';
const reference = (node, ctx) => {
    const { path } = ReferenceTypeNode.destruct(node);
    const { children } = PathNode.destruct(path);
    const symbol = children.findLast((c) => c.symbol && c.symbol.category === 'mcdoc' && c.symbol.subcategory !== 'module')?.symbol;
    if (!TypeDefSymbolData.is(symbol?.data)) {
        return;
    }
    const { appendixes } = TypeBaseNode.destruct(node);
    let typeArgs = [];
    if (TypeArgBlockNode.is(appendixes[0])) {
        const { args } = TypeArgBlockNode.destruct(appendixes[0]);
        typeArgs = args;
    }
    let typeParams = [];
    if (symbol.data.typeDef.kind === 'template') {
        typeParams = symbol.data.typeDef.typeParams;
    }
    if (typeParams.length !== typeArgs.length) {
        ctx.err.report(localize('mcdoc.checker.reference.unexpected-number-of-type-arguments', symbol.identifier, typeParams.length, typeArgs.length), node);
    }
};
export function registerMcdocChecker(meta) {
    meta.registerChecker('mcdoc:type/reference', reference);
}
//# sourceMappingURL=index.js.map