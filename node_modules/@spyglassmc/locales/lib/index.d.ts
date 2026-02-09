type Parameter = string | number | boolean | bigint | RegExp | Date | Iterable<string>;
/**
 * @param key The locale key.
 * @param params All parameters that will be filled into the locale string.
 * If a string array is provided as a parameter, it will be converted to
 * string by the `arrayToMessage` method with `quoted=true, conjunction='or'` arguments.
 */
export declare function localize(key: string, ...params: Parameter[]): string;
export declare function localeQuote(content: string): string;
/**
 * @param locale A case-insensitive language tag following the format of
 * `\w+(-\w+)*` that should ideally correspond to the file name of one of the
 * files under `locales/`. Defaults to `en`.
 * @param dry @internal Don't actually change the locale.
 *
 * @returns The locale loaded.
 */
export declare function loadLocale(locale?: string, dry?: boolean): Promise<string>;
/**
 * Convert an array to human-readable message.
 * @param quoted Whether or not to quote the parts. Defaults to `true`
 * @param conjunction The conjunction to use. Defaults to `or`.
 * @returns Human-readable message.
 * @example // Using English
 * arrayToMessage([]) // "nothing"
 * arrayToMessage('foo') // "“foo”"
 * arrayToMessage(['foo']) // "“foo”"
 * arrayToMessage(['bar', 'foo']) // "“bar” or “foo”"
 * arrayToMessage(['bar', 'baz', 'foo']) // "“bar”, “baz”, or “foo”"
 * @example // Using Locale
 * arrayToMessage([], false) // "{nothing}"
 * arrayToMessage(['A'], false) // "A"
 * arrayToMessage(['A', 'B'], false) // "A{conjunction.or_2}B"
 * arrayToMessage(['A', 'B', 'C'], false) // "A{conjunction.or_3+_1}B{conjunction.or_3+_2}C"
 */
export declare function arrayToMessage(param: string | Iterable<string>, quoted?: boolean, conjunction?: 'and' | 'or'): string;
export {};
//# sourceMappingURL=index.d.ts.map