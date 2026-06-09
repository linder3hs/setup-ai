---
name: plan-feature
description: Plan a feature end-to-end before coding — clarify intent, explore existing code for reuse, design the approach, list files to change, and define how to verify. Use before implementing any non-trivial feature or when asked to plan or design work.
---

# Plan a feature

Produce an executable plan, not code. Keep it concise enough to scan, detailed enough to execute.

## Steps
1. **Clarify intent.** One-sentence goal. List assumptions and any decision that changes the design.
   Ask the user only if a choice is genuinely theirs to make and you can't pick a sensible default.
2. **Explore.** Read the relevant code first. Search for existing helpers, patterns, and utilities
   to reuse — reuse beats new code. Note key files as `file_path:line`.
3. **Design.** One recommended approach. Describe data flow, modules touched, and edge cases.
   Mention an alternative only when there's a real trade-off.
4. **List the work.** Files to create/modify, one-line reason each. For a repeated pattern, describe
   it once + 2-3 representative paths.
5. **Verify.** Exact commands/tests/manual checks that prove it works.

## Output format
```
Goal: …
Assumptions: …
Approach: …
Files to change:
  - path — why
Verification: …
```

## Stack context
For Next.js/React work, load `stacks/nextjs-react.md`. For Node/Fastify backends, load
`stacks/node-fastify.md`. Only read them when the task touches that stack.
