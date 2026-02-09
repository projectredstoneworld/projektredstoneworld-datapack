import { Dev, Logger } from '../common/index.js';
class TopNImpl {
    id;
    logger;
    n;
    #finalized = false;
    #startTime;
    #lastTime;
    #taskCount = 0;
    #topTasks = [];
    #minTime = Infinity;
    #maxTime = 0;
    constructor(id, logger, n) {
        this.id = id;
        this.logger = logger;
        this.n = n;
        this.#startTime = this.#lastTime = performance.now();
    }
    task(name) {
        if (this.#finalized) {
            throw new Error('The profiler has already been finalized');
        }
        this.#taskCount++;
        const time = performance.now();
        const duration = time - this.#lastTime;
        this.#lastTime = time;
        this.#minTime = Math.min(this.#minTime, duration);
        this.#maxTime = Math.max(this.#maxTime, duration);
        this.#topTasks.push([name, duration]);
        this.#topTasks.sort((a, b) => b[1] - a[1]);
        if (this.#topTasks.length > this.n) {
            this.#topTasks = this.#topTasks.slice(0, -1);
        }
        return this;
    }
    finalize() {
        this.#finalized = true;
        const longestTaskNameLength = this.#topTasks.reduce((length, [name]) => Math.max(length, name.length), 0);
        const totalDuration = this.#lastTime - this.#startTime;
        this.logger.info(`[Profiler: ${this.id}] == Summary ==`);
        this.logger.info(`[Profiler: ${this.id}] Total tasks: ${this.#taskCount} done in ${totalDuration} ms`);
        this.logger.info(`[Profiler: ${this.id}] Min/Avg/Max: ${this.#minTime} / ${totalDuration / this.#taskCount} / ${this.#maxTime} ms`);
        this.logger.info(`[Profiler: ${this.id}] Top ${Math.min(this.n, this.#topTasks.length)} task(s):`);
        for (const [name, time] of this.#topTasks) {
            this.logger.info(`[Profiler: ${this.id}] ${name}${' '.repeat(longestTaskNameLength - name.length)} - ${time} ms (${(time / totalDuration) * 100}%)`);
        }
    }
}
const TotalTaskName = 'Total';
class TotalImpl {
    id;
    logger;
    #finalized = false;
    #startTime;
    #lastTime;
    #tasks = [];
    #longestTaskNameLength = 0;
    constructor(id, logger) {
        this.id = id;
        this.logger = logger;
        this.#startTime = this.#lastTime = performance.now();
    }
    task(name) {
        if (this.#finalized) {
            throw new Error('The profiler is finalized.');
        }
        const time = performance.now();
        const duration = time - this.#lastTime;
        this.#lastTime = time;
        this.#tasks.push([name, duration]);
        this.#longestTaskNameLength = Math.max(this.#longestTaskNameLength, name.length);
        this.logger.info(`[Profiler: ${this.id}] Done: ${name} in ${duration} ms`);
        return this;
    }
    finalize() {
        this.#finalized = true;
        this.#tasks.push([TotalTaskName, this.#lastTime - this.#startTime]);
        this.#longestTaskNameLength = Math.max(this.#longestTaskNameLength, TotalTaskName.length);
        this.logger.info(`[Profiler: ${this.id}] == Summary ==`);
        for (const [name, time] of this.#tasks) {
            this.logger.info(`[Profiler: ${this.id}] ${name}${' '.repeat(this.#longestTaskNameLength - name.length)} - ${time} ms`);
        }
    }
}
class NoopImpl {
    task() {
        return this;
    }
    finalize() { }
}
export class ProfilerFactory {
    logger;
    #enabledProfilers;
    constructor(logger, enabledProfilers) {
        this.logger = logger;
        this.#enabledProfilers = new Set(enabledProfilers);
    }
    get(id, style = 'total', n) {
        if (this.#enabledProfilers.has(id)) {
            switch (style) {
                case 'top-n':
                    return new TopNImpl(id, this.logger, n);
                case 'total':
                    return new TotalImpl(id, this.logger);
                default:
                    return Dev.assertNever(style);
            }
        }
        else {
            return new NoopImpl();
        }
    }
    static noop() {
        return new ProfilerFactory(Logger.noop(), []);
    }
}
//# sourceMappingURL=Profiler.js.map