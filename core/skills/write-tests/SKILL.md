---
name: write-tests
description: Write and run tests that catch real regressions, match the project's existing harness and style, and cover edge/error paths. Use when adding tests, improving coverage, or after implementing a feature.
---

# Write tests

Tests that catch regressions, not coverage padding.

## Steps
1. **Detect the harness.** Read `package.json` scripts + devDeps to find the runner and command
   (Vitest, Jest, Playwright, `node:test`). Match the existing test file location and naming.
   Never introduce a new framework.
2. **Pick targets.** Business logic, edge cases, error paths, regressions for known bugs. Skip
   trivial getters and framework glue.
3. **Write.** One behavior per test. Descriptive name. Arrange-act-assert. Cover happy path + the
   boundaries (empty, null, max, error). Mock only true external boundaries (network, clock, fs).
4. **Run.** Execute the suite (`npm test` / `pnpm test` / the detected command). Report output
   verbatim. A test not run is not done.

## Rule
If a test fails because of a real product bug, report the bug — never weaken the assertion to make
it pass.

## Output
Files added (paths), command run, pass/fail result. State honestly what remains untested.
