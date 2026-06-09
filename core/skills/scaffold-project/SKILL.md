---
name: scaffold-project
description: Bootstrap a new project, module, component, or route following existing conventions (or sensible Next.js/React/TS defaults for a fresh repo). Use when asked to scaffold, set up, or create a new component/route/module/project.
---

# Scaffold

Generate the minimal, convention-correct skeleton. Don't over-build.

## Steps
1. **Learn conventions.** Read sibling files: folder layout, naming (PascalCase vs kebab-case),
   import style, how components/routes/modules are organized, styling approach. New code must blend
   in. Load `stacks/nextjs-react.md` or `stacks/node-fastify.md` for stack specifics.
2. **Detect the stack.** App Router vs Pages, React 19, TS strict, Tailwind/CSS-modules, data layer.
   Reuse what the project already uses; never swap its tools.
3. **Generate.** Only the needed files: the thing itself, its types, a test stub, and an index/barrel
   export if the project uses one. Wire it into routing/exports so it's reachable.
4. **Leave it runnable.** No unresolved imports, no build-breaking TODOs. Run the type-check/build if
   quick.

## Fresh-repo defaults (no existing convention)
Next.js 16 App Router · React 19 · TypeScript strict · Tailwind · colocated tests. Server Components
by default; `"use client"` only when interactivity needs it. For a Node API: Fastify 5 + TS.
Use `--yes` non-interactive scaffolding commands where available.

## Output
Files created (paths) + how to reach/use the new thing.
