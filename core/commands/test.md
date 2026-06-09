---
description: Write and run tests for the given code (or recent changes).
---

Add tests for: **$ARGUMENTS** (if empty, cover my most recent changes).

Use the `write-tests` skill (or the `test-engineer` subagent). Detect the project's test runner and
style, write tests for the happy path plus edge/error cases, then **run the suite** and report the
result verbatim. Don't weaken assertions to pass — if a test exposes a real bug, report it.
