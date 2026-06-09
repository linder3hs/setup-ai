---
name: review-diff
description: Review the current diff/PR for correctness bugs, reuse, simplification, and efficiency. Use before merging, after finishing a change, or when asked to review code.
---

# Review the diff

Review only what changed, plus the context needed to judge it.

## Steps
1. **Get the diff.** `git diff --staged` for staged work, or `git diff <base>...HEAD` for a branch
   (find the base with `git merge-base HEAD origin/main`).
2. **Inspect**, in priority order:
   - **Correctness:** null/undefined, off-by-one, wrong conditionals, unhandled error paths, broken
     caller contracts, races.
   - **Reuse/simplification:** duplicates an existing helper, dead code, collapsible conditions,
     needless abstraction.
   - **Efficiency:** N+1 queries, work that could hoist out of a loop, unnecessary React re-renders.
3. **Confirm before reporting.** Read the surrounding code; don't report an unverified bug.
4. **Classify.** Must-fix (bug/security) vs nice-to-have (cleanup).

## Output
Flat list. Each finding: `severity — file_path:line — what's wrong — the fix`. No praise, no
description of what the code does. If clean, say so in one line.

For deeper security concerns, hand off to the `security-reviewer` agent / `security-audit` skill.
