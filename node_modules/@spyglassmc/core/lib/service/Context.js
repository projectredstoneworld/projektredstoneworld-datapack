/* istanbul ignore file */
import { formatterContextIndentation } from '../processor/index.js';
import { ReadonlySource } from '../source/index.js';
import { ErrorReporter } from './ErrorReporter.js';
export var ContextBase;
(function (ContextBase) {
    function create(project) {
        return {
            fs: project.fs,
            isDebugging: project.isDebugging,
            logger: project.logger,
            meta: project.meta,
            profilers: project.profilers,
            roots: project.roots,
            project: project.ctx,
        };
    }
    ContextBase.create = create;
})(ContextBase || (ContextBase = {}));
export var ParserContext;
(function (ParserContext) {
    function create(project, opts) {
        return {
            ...ContextBase.create(project),
            config: project.config,
            doc: opts.doc,
            err: opts.err ?? new ErrorReporter(project.ctx['errorSource']),
        };
    }
    ParserContext.create = create;
})(ParserContext || (ParserContext = {}));
export var ProcessorContext;
(function (ProcessorContext) {
    function create(project, opts) {
        return {
            ...ContextBase.create(project),
            config: project.config,
            doc: opts.doc,
            src: opts.src ?? new ReadonlySource(opts.doc.getText()),
            symbols: project.symbols,
        };
    }
    ProcessorContext.create = create;
})(ProcessorContext || (ProcessorContext = {}));
var ProcessorWithRangeContext;
(function (ProcessorWithRangeContext) {
    function create(project, opts) {
        return { ...ProcessorContext.create(project, opts), range: opts.range };
    }
    ProcessorWithRangeContext.create = create;
})(ProcessorWithRangeContext || (ProcessorWithRangeContext = {}));
var ProcessorWithOffsetContext;
(function (ProcessorWithOffsetContext) {
    function create(project, opts) {
        return { ...ProcessorContext.create(project, opts), offset: opts.offset };
    }
    ProcessorWithOffsetContext.create = create;
})(ProcessorWithOffsetContext || (ProcessorWithOffsetContext = {}));
export var BinderContext;
(function (BinderContext) {
    function create(project, opts) {
        return {
            ...ProcessorContext.create(project, opts),
            err: opts.err ?? new ErrorReporter(project.ctx['errorSource']),
            ensureBindingStarted: project.ensureBindingStarted?.bind(project),
        };
    }
    BinderContext.create = create;
})(BinderContext || (BinderContext = {}));
export var CheckerContext;
(function (CheckerContext) {
    function create(project, opts) {
        return {
            ...ProcessorContext.create(project, opts),
            err: opts.err ?? new ErrorReporter(project.ctx['errorSource']),
            ensureBindingStarted: project.ensureBindingStarted?.bind(project),
        };
    }
    CheckerContext.create = create;
})(CheckerContext || (CheckerContext = {}));
export var LinterContext;
(function (LinterContext) {
    function create(project, opts) {
        return {
            ...ProcessorContext.create(project, opts),
            err: opts.err,
            ruleName: opts.ruleName,
            ruleValue: opts.ruleValue,
        };
    }
    LinterContext.create = create;
})(LinterContext || (LinterContext = {}));
export var FormatterContext;
(function (FormatterContext) {
    function create(project, opts) {
        return {
            ...ProcessorContext.create(project, opts),
            ...opts,
            indentLevel: 0,
            indent(additionalLevels) {
                return formatterContextIndentation(this, additionalLevels);
            },
        };
    }
    FormatterContext.create = create;
})(FormatterContext || (FormatterContext = {}));
export var CodeActionProviderContext;
(function (CodeActionProviderContext) {
    function create(project, opts) {
        return { ...ProcessorContext.create(project, opts), range: opts.range };
    }
    CodeActionProviderContext.create = create;
})(CodeActionProviderContext || (CodeActionProviderContext = {}));
export var ColorizerContext;
(function (ColorizerContext) {
    function create(project, opts) {
        return ProcessorWithRangeContext.create(project, opts);
    }
    ColorizerContext.create = create;
})(ColorizerContext || (ColorizerContext = {}));
export var CompleterContext;
(function (CompleterContext) {
    function create(project, opts) {
        return {
            ...ProcessorContext.create(project, opts),
            offset: opts.offset,
            triggerCharacter: opts.triggerCharacter,
        };
    }
    CompleterContext.create = create;
})(CompleterContext || (CompleterContext = {}));
export var SignatureHelpProviderContext;
(function (SignatureHelpProviderContext) {
    function create(project, opts) {
        return ProcessorWithOffsetContext.create(project, opts);
    }
    SignatureHelpProviderContext.create = create;
})(SignatureHelpProviderContext || (SignatureHelpProviderContext = {}));
export var UriBinderContext;
(function (UriBinderContext) {
    function create(project) {
        return { ...ContextBase.create(project), config: project.config, symbols: project.symbols };
    }
    UriBinderContext.create = create;
})(UriBinderContext || (UriBinderContext = {}));
export var UriPredicateContext;
(function (UriPredicateContext) {
    function create(project) {
        return { ...ContextBase.create(project) };
    }
    UriPredicateContext.create = create;
})(UriPredicateContext || (UriPredicateContext = {}));
//# sourceMappingURL=Context.js.map