import { spawn } from "node:child_process";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { readFile } from "node:fs/promises";

import {
  createMessageConnection,
  StreamMessageReader,
  StreamMessageWriter,
} from "vscode-jsonrpc/node.js";

import { globSync } from "glob";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");

const mcVersion = process.env.SPYGLASS_MC_VERSION || "1.20";

// Choose file set: changed list if provided, else all
const listFile = process.env.SPYGLASS_FILE_LIST || "";
let files = [];
if (listFile) {
  try {
    const raw = await readFile(path.resolve(repoRoot, listFile), "utf8");
    files = raw
      .split("\n")
      .map((s) => s.trim())
      .filter((p) => p.endsWith(".mcfunction") && p.length > 0);
  } catch {
    // ignore
  }
}
if (files.length === 0) {
  files = globSync("**/*.mcfunction", { cwd: repoRoot, nodir: true });
}

// If no mcfunction changes, exit fast
if (listFile && files.length === 0) {
  console.log("No changed .mcfunction files. Skipping Spyglass.");
  process.exit(0);
}

// Start Spyglass language server (stdio)
const bin =
  process.platform === "win32"
    ? path.join(repoRoot, "node_modules", ".bin", "spyglassmc-language-server.cmd")
    : path.join(repoRoot, "node_modules", ".bin", "spyglassmc-language-server");

const server = spawn(bin, ["--stdio"], {
  cwd: repoRoot,
  stdio: ["pipe", "pipe", "inherit"],
  env: {
    ...process.env,
    // Spyglass/Mecha doesn't accept patch versions like 1.20.4, so use 1.20
    MINECRAFT_VERSION: mcVersion,
  },
});

const connection = createMessageConnection(
  new StreamMessageReader(server.stdout),
  new StreamMessageWriter(server.stdin)
);

let hadError = false;

// Only fail on severity=1 (Error). Ignore warnings.
connection.onNotification("textDocument/publishDiagnostics", (params) => {
  const diags = params.diagnostics ?? [];
  const errors = diags.filter((d) => (d.severity ?? 0) === 1);
  if (errors.length) {
    hadError = true;
    console.log(`\nErrors in: ${params.uri}`);
    for (const d of errors) {
      const where = `${d.range.start.line + 1}:${d.range.start.character + 1}`;
      console.log(`  [ERROR] ${where} ${d.message}`);
    }
  }
});
// Spyglass LSP will ask for workspace configuration; answer with empty configs.
connection.onRequest("workspace/configuration", (params) => {
  // Must return an array with one entry per requested item.
  return (params?.items ?? []).map(() => ({}));
});

// Some servers also request workspace folders.
connection.onRequest("workspace/workspaceFolders", () => {
  return [];
});
connection.listen();

await connection.sendRequest("initialize", {
  processId: process.pid,
  rootUri: `file://${repoRoot}`,
  capabilities: { textDocument: { publishDiagnostics: {} }, workspace: {} },
});
connection.sendNotification("initialized", {});

// Open each mcfunction to trigger diagnostics
for (const f of files) {
  const abs = path.join(repoRoot, f);
  const uri = `file://${abs}`;
  const content = await readFile(abs, "utf8");
  connection.sendNotification("textDocument/didOpen", {
    textDocument: { uri, languageId: "mcfunction", version: 1, text: content },
  });
}

// Wait briefly for diagnostics
await new Promise((r) => setTimeout(r, 1500));

try { await connection.sendRequest("shutdown"); } catch {}
try { connection.sendNotification("exit"); } catch {}
try { server.kill(); } catch {}

if (hadError) {
  console.error("\nSpyglass found ERROR diagnostics. Failing tests.");
  process.exit(1);
}
console.log("\nSpyglass: no errors.");
