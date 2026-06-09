---
description: Review the current diff for bugs, simplification, and security.
---

Review my current changes$ARGUMENTS.

Use the `review-diff` skill. Get the diff (`git diff --staged`, or `git diff` against the merge-base
with the default branch), then report correctness bugs, reuse/simplification opportunities, and
efficiency issues as a flat list of `severity — file:line — problem — fix`. If the change touches
auth, payments, or input handling, also run the `security-audit` skill. If the diff is clean, say so.
