import * as core from '@spyglassmc/core';
import { localeQuote, localize } from '@spyglassmc/locales';
import { categorizeTreeChildren, resolveParentTreeNode } from '../tree/index.js';
import { argumentTreeNodeToString } from './argument.js';
import { sep } from './common.js';
import { literal } from './literal.js';
/**
 * @returns A parser that always takes a whole line (excluding line turn characters) and tries to parse it as a command.
 */
export function command(tree, argument, options = {}) {
    return (src, ctx) => {
        const ans = {
            type: 'mcfunction:command',
            range: core.Range.create(src),
            children: [],
            options,
        };
        const start = src.cursor;
        const innerStart = src.innerCursor;
        if (src.trySkip('/')) {
            ans.slash = core.Range.create(start, src.cursor);
            if (!options.slash) {
                ctx.err.report(localize('mcfunction.parser.leading-slash.unexpected'), ans.slash, core.ErrorSeverity.Error, {
                    codeAction: {
                        title: localize('code-action.remove-leading-slash'),
                        isPreferred: true,
                        changes: [
                            {
                                type: 'edit',
                                range: ans.slash,
                                text: '',
                            },
                        ],
                    },
                });
            }
        }
        else if (options.slash === 'required') {
            ctx.err.report(localize('expected', localize('mcfunction.parser.leading-slash')), core.Range.create(start, start + 1), core.ErrorSeverity.Error, {
                codeAction: {
                    title: localize('code-action.add-leading-slash'),
                    isPreferred: true,
                    changes: [
                        {
                            type: 'edit',
                            range: core.Range.create(start),
                            text: '/',
                        },
                    ],
                },
            });
        }
        dispatch(ans.children, src, ctx, [], tree, tree, argument);
        if (src.canReadInLine()) {
            // There is trailing string after the command.
            const node = trailing(src, ctx);
            ans.children.push({
                type: 'mcfunction:command_child',
                range: node.range,
                children: [node],
                path: [],
            });
        }
        ans.range.end = src.cursor;
        if (options.maxLength) {
            const commandLength = src.innerCursor - innerStart;
            if (commandLength > options.maxLength) {
                ctx.err.report(localize('mcfunction.parser.command-too-long', commandLength, options.maxLength), ans);
            }
        }
        return ans;
    };
}
/**
 * Dispatch and parse based on the specified command tree node's children.
 *
 * @param ans An array where child nodes will be pushed into.
 */
function dispatch(ans, src, ctx, path, rootTreeNode, parentTreeNode, argument) {
    // Convention: suffix `Node` is for AST nodes; `TreeNode` is for command tree nodes.
    function _dispatch(path, parentTreeNode) {
        const { treeNode: parent, path: resolvedPath } = resolveParentTreeNode(parentTreeNode, rootTreeNode, path);
        path = resolvedPath;
        const children = parent?.children;
        if (!children) {
            return false;
        }
        const { literalTreeNodes, argumentTreeNodes } = categorizeTreeChildren(children);
        const argumentParsers = argumentTreeNodes.map(([name, treeNode]) => ({ name, parser: argument(treeNode, ans) ?? unknown(treeNode) }));
        const literalParser = literalTreeNodes.length
            ? literal(literalTreeNodes.map(([name, _treeNode]) => name), parent.type === 'root')
            : undefined;
        const parsers = [
            ...(literalParser ? [literalParser] : []),
            ...argumentParsers.map((v) => v.parser),
        ];
        const out = { index: 0 };
        if (parsers.length === 0) {
            return false;
        }
        const parser = parsers.length > 1 ? core.any(parsers, out) : parsers[0];
        const result = parser(src, ctx);
        if (result !== core.Failure) {
            const takenName = argumentParsers[out.index - (literalParser ? 1 : 0)]?.name
                ?? result.value;
            const childPath = [...path, takenName];
            ans.push({
                type: 'mcfunction:command_child',
                range: result.range,
                children: [result],
                path: childPath,
            });
            const childTreeNode = children[takenName];
            if (!childTreeNode) {
                return false;
            }
            const requiredPermissionLevel = childTreeNode.permission ?? 2;
            if (ctx.config.env.permissionLevel < requiredPermissionLevel) {
                ctx.err.report(localize('mcfunction.parser.no-permission', requiredPermissionLevel, ctx.config.env.permissionLevel), result);
            }
            if (result.type === 'mcfunction:command_child/unknown') {
                // Encountered an unsupported parser. Stop parsing this command.
                return false;
            }
            if (src.canReadInLine()) {
                // Skip command argument separation (a space).
                sep(src, ctx);
                return { childPath, childTreeNode };
            }
            else {
                // End-of-command.
                if (!childTreeNode.executable) {
                    ctx.err.report(localize('mcfunction.parser.eoc-unexpected'), src);
                }
            }
        }
        else {
            // Failed to parse as any arguments.
            ctx.err.report(localize('expected', treeNodeChildrenToString(children)), core.Range.create(src));
        }
        return false;
    }
    let result = _dispatch(path, parentTreeNode);
    while (result) {
        result = _dispatch(result.childPath, result.childTreeNode);
    }
}
function unknown(treeNode) {
    return (src, ctx) => {
        const start = src.cursor;
        const value = src.readUntilLineEnd();
        const range = core.Range.create(start, src);
        ctx.err.report(localize('mcfunction.parser.unknown-parser', localeQuote(treeNode.parser)), range, core.ErrorSeverity.Hint);
        return { type: 'mcfunction:command_child/unknown', range, value };
    };
}
const trailing = (src, ctx) => {
    const start = src.cursor;
    const value = src.readUntilLineEnd();
    const range = core.Range.create(start, src);
    ctx.err.report(localize('mcfunction.parser.trailing', localeQuote(value)), range);
    return { type: 'mcfunction:command_child/trailing', range, value };
};
function wrapWithBrackets(syntax, executable) {
    return executable ? `[${syntax}]` : syntax;
}
export function treeNodeChildrenToStringArray(children, executable = false) {
    const entries = Object.entries(children).map(([name, treeNode]) => wrapWithBrackets(treeNodeToString(name, treeNode), executable));
    return entries;
}
export function treeNodeChildrenToString(children) {
    const entries = treeNodeChildrenToStringArray(children);
    return entries.length > 5
        ? `${entries.slice(0, 3).join('|')}|...|${entries.slice(-2).join('|')}`
        : entries.join('|');
}
export function treeNodeToString(name, treeNode) {
    if (treeNode.type === 'argument') {
        return argumentTreeNodeToString(name, treeNode);
    }
    else {
        return name;
    }
}
//# sourceMappingURL=command.js.map