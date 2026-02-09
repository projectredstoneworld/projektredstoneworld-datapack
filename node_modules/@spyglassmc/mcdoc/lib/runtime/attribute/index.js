import * as core from '@spyglassmc/core';
export * as validator from './validator.js';
export function registerAttribute(meta, name, validator, attribute) {
    meta.registerCustom('mcdoc:attribute', name, { validator, attribute });
}
export function getAttribute(meta, name) {
    return meta.getCustom('mcdoc:attribute')?.get(name);
}
export function handleAttributes(attributes, ctx, fn) {
    for (const { name, value } of attributes ?? []) {
        const handler = getAttribute(ctx.meta, name);
        if (!handler) {
            continue;
        }
        const config = handler.validator(value, ctx);
        if (config === core.Failure) {
            continue;
        }
        fn(handler.attribute, config);
    }
}
export function shouldKeepAccordingToAttributeFilters(attributes, ctx) {
    let keep = true;
    handleAttributes(attributes, ctx, (handler, config) => {
        if (!keep || !handler.filterElement) {
            return;
        }
        if (!handler.filterElement(config, ctx)) {
            keep = false;
        }
    });
    return keep;
}
//# sourceMappingURL=index.js.map