# CLAUDE.md

Project guidance for Claude Code. Edit the placeholders (`<…>`) to fit this repo.

## Project
- **What:** <one-line description of this app>
- **Stack:** Next.js 16 (App Router) · React 19 · TypeScript (strict) · Tailwind · <db/auth/etc.>

## Commands
- Dev: `<npm|pnpm> run dev`
- Build: `<npm|pnpm> run build`
- Test: `<npm|pnpm> test`
- Lint / typecheck: `<npm|pnpm> run lint` · `<npm|pnpm> run typecheck`

## Conventions
- Server Components by default; `"use client"` only when interactivity requires it.
- Fetch data on the server, not in client `useEffect`. Mutations via Server Actions / route handlers.
- Components `PascalCase.tsx`; route segments lowercase. Colocate tests.
- TypeScript strict — no `any`. Tailwind for styling; respect existing design tokens / `cn()`.
- Reuse existing helpers and components before adding new ones.

## This harness (setup-ai)
Installed via setup-ai. Available: `/plan`, `/review`, `/test`, `/scaffold`; subagents
`planner`, `code-reviewer`, `security-reviewer`, `test-engineer`, `scaffolder`.
Deep stack notes live in `setup-ai/stacks/nextjs-react.md` (skills load it on demand).

## Notes
- <gotchas, env vars, deploy target (e.g. Vercel), anything non-obvious>
