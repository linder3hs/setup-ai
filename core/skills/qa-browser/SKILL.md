---
name: qa-browser
description: QA a web app/UI in a real browser — navigate flows, verify state, catch console/network errors, take screenshots as evidence. Use when asked to QA, test the site, verify a deployment, or confirm a UI feature works end-to-end.
---

# Browser QA

Verify the app actually works by driving it, not by reading code.

## Steps
1. **Find the URL.** Local dev server (start it if needed: `npm run dev` and read the port) or a
   deployed/preview URL the user gives.
2. **Pick the driver.** Prefer an available browser tool/MCP (Playwright, the `browse`/`gstack`
   skill, or Claude-in-Chrome). Don't pixel-click if a DOM-aware tool exists.
3. **Test the flow.** Walk the user-facing path: load → interact (click, fill, submit) → assert the
   resulting state. Check the critical happy path first, then key edge cases (empty form, invalid
   input, auth-required route).
4. **Collect evidence.** Screenshot before/after key actions. Capture console errors and failed
   network requests — these are bugs even if the UI looks fine.
5. **Check responsive** if relevant: mobile + desktop widths.

## Output
Per issue: what you did → what happened → what was expected → screenshot/console evidence. End with
a ship/no-ship call. If everything passed, say so with the flows you covered.
