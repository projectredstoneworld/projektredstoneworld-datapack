import type { TextDocument } from 'vscode-languageserver-textdocument';
import { PositionRange } from './PositionRange.js';
import type { RangeLike } from './Range.js';
import { Range } from './Range.js';
export interface Location {
    uri: string;
    range: Range;
    posRange: PositionRange;
}
export type LocationLike = Partial<{
    uri: string;
    range: RangeLike;
    posRange: PositionRange;
}>;
export declare namespace Location {
    function get(partial: LocationLike): Location;
    function create(doc: TextDocument, range: RangeLike): Location;
}
//# sourceMappingURL=Location.d.ts.map