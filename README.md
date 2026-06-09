# setup-ai

A reusable AI coding harness for [Claude Code](https://code.claude.com). One source of truth for
your **agents, skills, slash commands, hooks and CLAUDE.md templates** — installed into any project
with one command, updated everywhere with a single `git pull`.

Built for a Next.js 16 / React 19 / TypeScript + Node/Fastify workflow, but works in any repo.

## What you get

| Type | Items |
|------|-------|
| **Slash commands** | `/plan` · `/review` · `/test` · `/scaffold` |
| **Subagents** | `planner` · `code-reviewer` · `security-reviewer` · `test-engineer` · `scaffolder` |
| **Skills** | plan-feature · review-diff · security-audit · write-tests · qa-browser · scaffold-project |
| **Hooks** (opt-in) | auto-format on save (prettier) · guard against `rm -rf` / force-push / `DROP TABLE` |
| **Templates** | stack-aware `CLAUDE.md` (Next.js / Node / generic) |
| **Stack refs** | `stacks/nextjs-react.md`, `stacks/node-fastify.md` (loaded on demand) |

## Install the CLI (once per machine)

```bash
bash install.sh        # links bin/setup-ai → ~/.local/bin/setup-ai
# ensure ~/.local/bin is on PATH
```

## Use it in a project

```bash
cd ~/dev/my-app
setup-ai install              # symlinks the harness into ./.claude/ + drops a CLAUDE.md
setup-ai install --with-hooks # also enable format + guard hooks
```

Then open Claude Code in that project — `/help` lists the commands, `/agents` lists the subagents.

## How it works

`setup-ai install` **symlinks** each file from `core/{agents,skills,commands}` into the project's
`.claude/`. Because they're symlinks, editing a skill here updates every project instantly — no
reinstall. A `.claude/.setup-ai-manifest.json` records exactly what was installed for clean updates
and removal. Your project's own `.claude/` files are never overwritten.

## Commands

```
setup-ai install [path] [--with-hooks] [--force]   install into a project (default: cwd)
setup-ai update  [path]                             sync new files, prune dead links
setup-ai list    [path]                             show what's installed
setup-ai uninstall [path]                           remove only setup-ai's files
setup-ai doctor  [path]                             check for broken links / version drift
setup-ai version
```

## Updating the harness

```bash
cd ~/dev/setup-ai && git pull   # symlinked projects pick up changes immediately
setup-ai update                 # in a project, only if files were added/removed
```

## Layout

```
core/agents/    core/skills/<name>/SKILL.md    core/commands/   ← the harness (symlinked in)
hooks/hooks.json        templates/CLAUDE.*.md        stacks/*.md
bin/setup-ai            install.sh
.claude-plugin/marketplace.json + core/.claude-plugin/plugin.json  ← optional: install as a plugin
```

## Bonus: install as a plugin instead

The repo is also a valid Claude Code plugin marketplace. From any project:

```
/plugin marketplace add ~/dev/setup-ai
/plugin install setup-ai@setup-ai
```

This namespaces the commands (`/setup-ai:plan`) and skips the symlink installer — useful for
sharing with a team. The `setup-ai` CLI remains the simpler path for solo, always-latest use.

## Extending

Add a new skill: create `core/skills/<name>/SKILL.md` with a `description` frontmatter. Add an
agent: drop `core/agents/<name>.md`. Add a command: `core/commands/<name>.md`. Run
`setup-ai update` in your projects (or just `git pull` — symlinks already point at the new files
once you re-run `install`/`update` to link the new paths).
