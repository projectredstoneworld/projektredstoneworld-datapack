import type { Range } from '../source/index.js';
export interface ColorInfo {
    range: Range;
    color: Color;
}
/**
 * An array of four decimal numbers within the interval [0, 1] that represent R, G, B, and A respectively.
 */
export type Color = [number, number, number, number];
export declare namespace Color {
    const NamedColors: Map<string, number>;
    const ColorNames: string[];
    function fromNamed(value: string): Color | undefined;
    /**
     * @param r A decimal within [0.0, 1.0].
     * @param g A decimal within [0.0, 1.0].
     * @param b A decimal within [0.0, 1.0].
     * @param a A decimal within [0.0, 1.0].
     */
    function fromDecRGBA(r: number, g: number, b: number, a: number): Color;
    /**
     * @param r A decimal within [0.0, 1.0].
     * @param g A decimal within [0.0, 1.0].
     * @param b A decimal within [0.0, 1.0].
     */
    function fromDecRGB(r: number, g: number, b: number): Color;
    /**
     * @param r An integer within [0, 255].
     * @param g An integer within [0, 255].
     * @param b An integer within [0, 255].
     * @param a An integer within [0, 255].
     */
    function fromIntRGBA(r: number, g: number, b: number, a: number): Color;
    /**
     * @param r An integer within [0, 255].
     * @param g An integer within [0, 255].
     * @param b An integer within [0, 255].
     */
    function fromIntRGB(r: number, g: number, b: number): Color;
    /**
     * @param value A string in the format `#rrggbb`
     */
    function fromHexRGB(value: string): Color;
    /**
     * @param value `R << 16 + G << 8 + B`.
     */
    function fromCompositeRGB(value: number): Color;
    /**
     * @param value `A << 24 + R << 16 + G << 8 + B`.
     */
    function fromCompositeARGB(value: number): Color;
}
export declare enum ColorFormat {
    /**
     * `1 0.6 0.2 1.0`
     */
    DecRGBA = 0,
    /**
     * `1 0.6 0.2`
     */
    DecRGB = 1,
    /**
     * `255 153 51 25`
     */
    IntRGBA = 2,
    /**
     * `255 153 51`
     */
    IntRGB = 3,
    /**
     * `#ff9933ff`
     */
    HexRGBA = 4,
    /**
     * `#ff9933`
     */
    HexRGB = 5,
    /**
     * `16620441`
     */
    CompositeRGB = 6,
    /**
     * `4294945365`
     */
    CompositeARGB = 7
}
export type FormattableColor = {
    value: Color;
    format: ColorFormat[];
    range?: Range;
};
export type ColorPresentation = {
    label: string;
    text: string;
    range: Range;
};
export declare namespace ColorPresentation {
    function fromColorFormat(format: ColorFormat, color: Color, range: Range): ColorPresentation;
}
//# sourceMappingURL=ColorInfoProvider.d.ts.map