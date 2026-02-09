import * as core from '@spyglassmc/core';
export const objectiveCriterion = (node) => [core.ColorToken.create(node, 'type')];
export const vector = (node) => {
    return [core.ColorToken.create(node, 'vector')];
};
export function register(meta) {
    meta.registerColorizer('mcfunction:coordinate', core.colorizer.number);
    meta.registerColorizer('mcfunction:vector', vector);
    meta.registerColorizer('mcfunction:objective_criteria', objectiveCriterion);
}
//# sourceMappingURL=index.js.map