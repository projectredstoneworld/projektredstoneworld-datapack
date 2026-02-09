/*
 * A series of functions that can transform `@spyglassmc/core` types to `vscode-languageserver` types.
 *
 * Functions are named after types in `vscode-languageserver`.
 */
import * as core from '@spyglassmc/core';
import * as ls from 'vscode-languageserver/node.js';
import { InsertTextFormat } from 'vscode-languageserver/node.js';
const ZeroPosition = { line: 0, character: 0 };
const ZeroRange = { start: ZeroPosition, end: ZeroPosition };
export function color(color) {
    return ls.Color.create(...color);
}
export function colorInformation(info, doc) {
    return ls.ColorInformation.create(range(info.range, doc), color(info.color));
}
export function colorInformationArray(info, doc) {
    return info.map((i) => colorInformation(i, doc));
}
export function colorPresentation(presentation, doc) {
    const edit = ls.TextEdit.replace(range(presentation.range, doc), presentation.text);
    return ls.ColorPresentation.create(presentation.label, edit);
}
export function colorPresentationArray(presentation, doc) {
    return presentation.map((p) => colorPresentation(p, doc));
}
export function diagnostic(error) {
    const ans = ls.Diagnostic.create(error.posRange, error.message, diagnosticSeverity(error.severity), undefined, error.source ? `spyglassmc(${error.source})` : 'spyglassmc');
    if (error.info?.deprecated) {
        ;
        (ans.tags ??= [])?.push(ls.DiagnosticTag.Deprecated);
    }
    if (error.info?.unnecessary) {
        ;
        (ans.tags ??= [])?.push(ls.DiagnosticTag.Unnecessary);
    }
    if (error.info?.codeAction) {
        ans.data = { codeAction: error.info?.codeAction };
    }
    if (error.info?.related) {
        ans.relatedInformation = error.info?.related.map((v) => ({
            location: location(v.location),
            message: v.message,
        }));
    }
    return ans;
}
export function diagnostics(errors) {
    return errors.map((e) => diagnostic(e));
}
export function diagnosticSeverity(severity) {
    switch (severity) {
        case core.ErrorSeverity.Hint:
            return ls.DiagnosticSeverity.Hint;
        case core.ErrorSeverity.Information:
            return ls.DiagnosticSeverity.Information;
        case core.ErrorSeverity.Warning:
            return ls.DiagnosticSeverity.Warning;
        case core.ErrorSeverity.Error:
            return ls.DiagnosticSeverity.Error;
    }
}
export function documentHighlight(locations) {
    return locations?.locations?.filter((loc) => loc.posRange)?.map((loc) => ({
        range: loc.posRange,
    }));
}
export function documentSelector(meta, { disabledLanguages } = {}) {
    const ans = meta.getLanguages().filter((id) => disabledLanguages === undefined || !disabledLanguages.includes(id)).map((id) => ({ language: id }));
    return ans;
}
export function documentSymbol(symbol, symLoc, doc, hierarchicalSupport, supportedKinds = []) {
    return {
        name: symbol.identifier,
        kind: symbolKind(symbol.category, symbol.subcategory, supportedKinds),
        range: symLoc.fullPosRange ?? symLoc.posRange ?? ZeroRange,
        selectionRange: symLoc.posRange ?? ZeroRange,
        children: hierarchicalSupport
            ? documentSymbols(symbol.members, doc, hierarchicalSupport, supportedKinds)
            : undefined,
    };
}
export function documentSymbols(map = {}, doc, hierarchicalSupport, supportedKinds = []) {
    return Object.values(map).map((s) => [
        s,
        [
            ...(s.declaration ?? []),
            ...(s.definition ?? []),
            ...(s.implementation ?? []),
            ...(s.typeDefinition ?? []),
        ].find((l) => l.uri === doc.uri),
    ]).filter(([s, l]) => !!l && s.identifier).map(([s, l]) => documentSymbol(s, l, doc, hierarchicalSupport, supportedKinds));
}
export function documentSymbolsFromTable(table, doc, hierarchicalSupport, supportedKinds = []) {
    return Object.values(table).map((m) => documentSymbols(m, doc, hierarchicalSupport, supportedKinds)).flat();
}
export function documentSymbolsFromTables(tables, doc, hierarchicalSupport, supportedKinds = []) {
    return tables.map((t) => documentSymbolsFromTable(t, doc, hierarchicalSupport, supportedKinds))
        .flat();
}
export function hover(hover, doc) {
    const ans = { contents: markupContent(hover.markdown), range: range(hover.range, doc) };
    return ans;
}
export function inlayHint(hint, doc) {
    return {
        position: doc.positionAt(hint.offset),
        label: hint.label,
        ...hint.paddingLeft ? { paddingLeft: hint.paddingLeft } : {},
        ...hint.paddingRight ? { paddingRight: hint.paddingRight } : {},
    };
}
export function inlayHints(hints, doc) {
    return hints.map((h) => inlayHint(h, doc));
}
export function codeAction(codeAction, doc) {
    return {
        title: codeAction.title,
        kind: ls.CodeActionKind.QuickFix,
        isPreferred: codeAction.isPreferred,
        diagnostics: codeAction.errors?.map(e => diagnostic(core.LanguageError.withPosRange(e, doc))),
        edit: codeAction.changes
            ? {
                documentChanges: codeAction.changes.map(change => {
                    switch (change.type) {
                        case 'edit':
                            return {
                                textDocument: { uri: doc.uri, version: doc.version },
                                edits: [{ range: range(change.range, doc), newText: change.text }],
                            };
                        case 'create':
                            return {
                                kind: 'create',
                                uri: change.uri,
                            };
                    }
                }),
            }
            : undefined,
    };
}
export function completionItem(completion, doc, requestedOffset, insertReplaceSupport) {
    const insertText = completion.insertText ?? completion.label;
    const canInsertReplace = insertReplaceSupport
        && ![core.CR, core.LF, core.CRLF].includes(insertText);
    const textEdit = canInsertReplace
        ? ls.InsertReplaceEdit.create(insertText, 
        /* insert  */ range(core.Range.create(completion.range.start, requestedOffset), doc), 
        /* replace */ range(completion.range, doc))
        : ls.TextEdit.replace(range(completion.range, doc), insertText);
    const ans = {
        label: completion.label,
        kind: completion.kind,
        ...(completion.labelSuffix ? { labelDetails: { detail: completion.labelSuffix } } : {}),
        detail: completion.detail,
        documentation: completion.documentation ? markupContent(completion.documentation) : undefined,
        filterText: completion.filterText,
        sortText: completion.sortText,
        textEdit,
        insertTextFormat: InsertTextFormat.Snippet,
        insertTextMode: ls.InsertTextMode.adjustIndentation,
        ...(completion.deprecated ? { tags: [ls.CompletionItemTag.Deprecated] } : {}),
    };
    return ans;
}
export function location(location) {
    return { uri: location.uri, range: location.posRange };
}
export function locationLink(locations, doc, linkSupport) {
    return locations?.locations
        ? linkSupport
            ? locations.locations.map((loc) => ({
                originSelectionRange: range(locations.range, doc),
                targetUri: loc.uri,
                targetRange: loc.fullPosRange ?? loc.posRange ?? ZeroRange,
                targetSelectionRange: loc.posRange ?? ZeroRange,
            }))
            : locations.locations.map((loc) => location({ uri: loc.uri, posRange: loc.posRange ?? ZeroRange }))
        : undefined;
}
export function markupContent(value) {
    return { kind: ls.MarkupKind.Markdown, value };
}
export function position(offset, doc) {
    return doc.positionAt(offset);
}
export function range(range, doc) {
    return ls.Range.create(position(range.start, doc), position(range.end, doc));
}
export function semanticTokenModifier(modifier) {
    return core.ColorTokenModifiers.indexOf(modifier);
}
export function semanticTokenModifiers(modifiers = []) {
    let ans = 0;
    for (const modifier of modifiers) {
        ans += 1 << semanticTokenModifier(modifier);
    }
    return ans;
}
const MaxCharacterNumber = 2147483647;
export function semanticTokens(tokens, doc, multilineSupport) {
    const builder = new ls.SemanticTokensBuilder();
    for (const token of tokens) {
        const pos = position(token.range.start, doc);
        const endPos = position(token.range.end, doc);
        const type = semanticTokenType(token.type);
        const modifiers = semanticTokenModifiers(token.modifiers);
        if (multilineSupport || pos.line === endPos.line) {
            const length = token.range.end - token.range.start;
            builder.push(pos.line, pos.character, length, type, modifiers);
        }
        else {
            const firstLineRemainingLength = doc.getText(ls.Range.create(pos.line, pos.character, pos.line, MaxCharacterNumber))
                .length;
            const lastLineLeadingLength = doc.getText(ls.Range.create(endPos.line, 0, endPos.line, endPos.character)).length;
            builder.push(pos.line, pos.character, firstLineRemainingLength, type, modifiers);
            for (let i = pos.line + 1; i <= endPos.line - 1; i++) {
                const lineLength = doc.getText(ls.Range.create(i, 0, i, MaxCharacterNumber)).length;
                builder.push(i, 0, lineLength, type, modifiers);
            }
            builder.push(endPos.line, 0, lastLineLeadingLength, type, modifiers);
        }
    }
    return builder.build();
}
export function semanticTokensLegend() {
    const ans = {
        tokenTypes: core.ColorTokenTypes,
        tokenModifiers: core.ColorTokenModifiers,
    };
    return ans;
}
export function semanticTokenType(type) {
    return core.ColorTokenTypes.indexOf(type);
}
export function signatureHelp(help) {
    if (!help || help.signatures.length === 0) {
        return undefined;
    }
    return {
        signatures: help.signatures.map(signatureInformation),
        activeParameter: help.signatures[help.activeSignature].activeParameter,
        activeSignature: help.activeSignature,
    };
}
export function signatureInformation(info) {
    return {
        label: info.label,
        activeParameter: info.activeParameter,
        documentation: info.documentation ? markupContent(info.documentation) : undefined,
        parameters: info.parameters.map(parameterInformation),
    };
}
export function parameterInformation(info) {
    return {
        label: info.label,
        documentation: info.documentation ? markupContent(info.documentation) : undefined,
    };
}
export function symbolInformation(symbol, symLoc, supportedKinds = []) {
    return {
        name: symbol.identifier,
        kind: symbolKind(symbol.category, symbol.subcategory, supportedKinds),
        location: location({
            uri: symLoc.uri,
            posRange: symLoc.fullPosRange ?? symLoc.posRange ?? ZeroRange,
        }),
    };
}
export function symbolInformationArray(map = {}, query, supportedKinds = []) {
    return Object.values(map).filter((s) => s.identifier.includes(query)).map((s) => [
        s,
        [
            ...(s.declaration ?? []),
            ...(s.definition ?? []),
            ...(s.implementation ?? []),
            ...(s.typeDefinition ?? []),
        ][0],
    ]).filter(([_s, l]) => !!l).map(([s, l]) => symbolInformation(s, l, supportedKinds));
}
export function symbolInformationArrayFromTable(table, query, supportedKinds = []) {
    return Object.values(table).map((m) => symbolInformationArray(m, query, supportedKinds)).flat();
}
export function symbolKind(category, subcategory = '', supportedKinds = []) {
    const UltimateFallback = ls.SymbolKind.Variable;
    const getKind = (kind, fallback) => supportedKinds?.includes(kind) ? kind : fallback;
    if (core.ResourceLocationCategory.is(category)) {
        return ls.SymbolKind.Function;
    }
    if (category === 'mcdoc') {
        const map = new Map([
            ['enum', ls.SymbolKind.Enum],
            ['enum_key', getKind(ls.SymbolKind.EnumMember, ls.SymbolKind.Field)],
            ['compound', getKind(ls.SymbolKind.Struct, ls.SymbolKind.Interface)],
            ['compound_key', ls.SymbolKind.Field],
            ['module', ls.SymbolKind.Module],
        ]);
        return map.get(subcategory) ?? UltimateFallback;
    }
    const map = new Map([
        ['attribute_modifier_uuid', ls.SymbolKind.Number],
        ['mcdoc/description', ls.SymbolKind.Constructor],
        ['objective', ls.SymbolKind.Variable],
        ['score_holder', ls.SymbolKind.Class],
        ['tag', ls.SymbolKind.String],
        ['team', ls.SymbolKind.Array],
    ]);
    return map.get(category) ?? UltimateFallback;
}
export function textEdit(editRange, text, doc) {
    return ls.TextEdit.replace(range(editRange, doc), text);
}
//# sourceMappingURL=toLS.js.map