import * as core from '@spyglassmc/core';
export const string = (value) => {
    if (value === undefined) {
        return core.Failure;
    }
    if (value.kind === 'literal' && value.value.kind === 'string') {
        return value.value.value;
    }
    if (value.kind === 'reference' && value.path) {
        return value.path.replace(/.*::/, '');
    }
    return core.Failure;
};
export const number = (value) => {
    if (value === undefined) {
        return core.Failure;
    }
    if (value.kind === 'literal' && typeof value.value.value === 'number') {
        return value.value.value;
    }
    return core.Failure;
};
export const boolean = (value) => {
    if (value === undefined) {
        return core.Failure;
    }
    if (value.kind === 'literal' && value.value.kind === 'boolean') {
        return value.value.value;
    }
    return core.Failure;
};
export function options(...options) {
    return (value, ctx) => {
        const stringValue = string(value, ctx);
        if (stringValue === core.Failure) {
            return core.Failure;
        }
        if (options.includes(stringValue)) {
            return stringValue;
        }
        return core.Failure;
    };
}
export function tree(properties) {
    return (value, ctx) => {
        if (value?.kind !== 'tree') {
            return core.Failure;
        }
        const result = {};
        for (const key in properties) {
            const validator = properties[key];
            const propValue = value.values[key];
            const property = validator(propValue, ctx);
            if (property === core.Failure) {
                return core.Failure;
            }
            result[key] = property;
        }
        return result;
    };
}
export function list(itemValidator) {
    return (value, ctx) => {
        if (value?.kind !== 'tree') {
            return core.Failure;
        }
        const result = [];
        for (const element of Object.values(value.values)) {
            const item = itemValidator(element, ctx);
            if (item === core.Failure) {
                return core.Failure;
            }
            result.push(item);
        }
        return result;
    };
}
export function optional(validator) {
    return (value, ctx) => {
        const config = validator(value, ctx);
        return config === core.Failure ? undefined : config;
    };
}
export function map(validator, mapper) {
    return (value, ctx) => {
        const config = validator(value, ctx);
        return config === core.Failure ? core.Failure : mapper(config);
    };
}
export function alternatives(...validators) {
    return (value, ctx) => {
        for (const validator of validators) {
            const result = validator(value, ctx);
            if (result !== core.Failure) {
                return result;
            }
        }
        return core.Failure;
    };
}
//# sourceMappingURL=validator.js.map