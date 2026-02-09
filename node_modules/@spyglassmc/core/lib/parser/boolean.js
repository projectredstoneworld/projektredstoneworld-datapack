import { literal } from './literal.js';
import { map } from './util.js';
export const boolean = map(literal('false', 'true'), (res) => ({
    type: 'boolean',
    range: res.range,
    value: res.value === '' ? undefined : res.value === 'true',
}));
//# sourceMappingURL=boolean.js.map