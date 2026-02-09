export const SequenceUtilDiscriminator = Symbol('SequenceUtilDiscriminator');
export var SequenceUtil;
(function (SequenceUtil) {
    function is(obj) {
        return !!obj && obj[SequenceUtilDiscriminator];
    }
    SequenceUtil.is = is;
})(SequenceUtil || (SequenceUtil = {}));
//# sourceMappingURL=Sequence.js.map