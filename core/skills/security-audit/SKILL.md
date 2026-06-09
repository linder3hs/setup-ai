---
name: security-audit
description: Audit code for exploitable security vulnerabilities — injection, auth/authorization flaws, secrets, trust-boundary violations, OWASP Top 10. Use when reviewing security-sensitive code (auth, payments, input handling) or when asked for a security audit. Defensive use only.
---

# Security audit

Find exploitable vulnerabilities and give a concrete fix for each. Defensive review only.

## Checklist
1. **Injection** — SQL/NoSQL, command, path traversal, SSRF, XSS. Trace untrusted input from entry
   point to sink. Grep for sinks: `exec`, `spawn`, raw `query`, `eval`, `dangerouslySetInnerHTML`,
   string-built SQL/paths — then trace backward to the source.
2. **Auth / authorization** — missing authz checks, IDOR (object accessed without ownership check),
   broken sessions, JWT misuse, privilege escalation.
3. **Secrets** — hardcoded keys/tokens/passwords, secrets in logs, committed `.env`, secrets leaked
   to third parties.
4. **Trust boundaries** — client→server, server→DB, app→external API. Never trust client-supplied
   authorization data. Validate at the boundary.
5. **Deps & config** — known-vulnerable packages (`npm audit`), permissive CORS, missing security
   headers, dangerous framework defaults.

## Rules
- Only report a path you can trace end to end. Rate by exploitability + impact; high-confidence first.
- Mark uncertain findings as such. Do not pad with theoretical issues.

## Output
Per finding: `severity — file_path:line — attack path (1 sentence) — fix`. If nothing exploitable,
say so and name the riskiest area to watch.
