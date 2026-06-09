# CLAUDE.md

Project guidance for Claude Code. Edit the placeholders (`<…>`) to fit this repo.

## Project
- **What:** <one-line description of this service>
- **Stack:** Node · Fastify 5 · TypeScript (strict) · <db/orm> · <auth>

## Commands
- Dev: `<npm|pnpm> run dev`
- Build: `<npm|pnpm> run build`
- Test: `<npm|pnpm> test`
- Lint / typecheck: `<npm|pnpm> run lint` · `<npm|pnpm> run typecheck`

## Conventions
- Fastify plugins per concern; thin handlers (validate → service → respond). Logic in `src/services`.
- JSON Schema on every route for input validation + response serialization.
- TypeScript strict — no `any`. Typed errors mapped via a central error handler; never leak stacks.
- Secrets from env, never hardcoded. CORS with explicit origins. Validate all untrusted input.
- Reuse existing plugins/services before adding new ones.

## This harness (setup-ai)
Installed via setup-ai. Available: `/plan`, `/review`, `/test`, `/scaffold`; subagents
`planner`, `code-reviewer`, `security-reviewer`, `test-engineer`, `scaffolder`.
Deep stack notes live in `setup-ai/stacks/node-fastify.md` (skills load it on demand).

## Notes
- <gotchas, env vars, deploy target, anything non-obvious>
