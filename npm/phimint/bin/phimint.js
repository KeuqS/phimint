#!/usr/bin/env node
// phimint npm launcher: resolves the platform-specific binary package
// (esbuild-style optionalDependencies) and hands over to it.
//
// No postinstall scripts — pnpm/yarn work without build-script approval, and
// registry mirrors (npmmirror) carry the binaries automatically.
'use strict';

const { spawnSync } = require('child_process');
const path = require('path');

// npm reports `process.platform === "win32"`, but the Windows package is
// named `phimint-windows-x64` — the `phimint-win32-x64` spelling trips npm's
// spam detection (dropper-like `win32` naming) and was never publishable.
const key = process.platform === 'win32' ? `windows-${process.arch}` : `${process.platform}-${process.arch}`;
const pkgName = `phimint-${key}`;
const binName = process.platform === 'win32' ? 'phimint.exe' : 'phimint';

let binPath;
try {
  const pkgDir = path.dirname(require.resolve(`${pkgName}/package.json`));
  binPath = path.join(pkgDir, 'bin', binName);
} catch {
  console.error(
    `phimint: platform package "${pkgName}" is not installed.\n` +
      `Reinstall with: npm install -g phimint\n` +
      `(pnpm users: pnpm add -g phimint)`
  );
  process.exit(1);
}

const result = spawnSync(binPath, process.argv.slice(2), { stdio: 'inherit' });
if (result.error) {
  console.error(`phimint: failed to run ${binPath}: ${result.error.message}`);
  process.exit(1);
}
process.exit(result.status === null ? 1 : result.status);
