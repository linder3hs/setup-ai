# Stack reference — Node / Fastify 5 / TypeScript

Load this only when working on a Node/Fastify backend. Defer to the target repo's conventions.

## Framework
- **Fastify 5**, TypeScript. Organize with plugins (`fastify-plugin`) — one plugin per concern
  (db, auth, a feature's routes). Register routes via `fastify.register`.
- Use Fastify's **JSON Schema** on every route (`schema: { body, params, querystring, response }`).
  This validates input at the boundary and serializes responses fast. Schemas are your first line
  of input validation.
- Prefer `async`/`await` handlers; return the payload (don't mix `reply.send` and `return`).
- Decorate shared instances (`fastify.decorate('db', …)`) instead of importing singletons.

## Structure
- `src/routes/<feature>/` — route plugins. `src/plugins/` — cross-cutting (db, auth, cors).
  `src/lib/` or `src/services/` — business logic, framework-agnostic and unit-testable.
- Keep handlers thin: parse/validate → call a service → shape the response. Logic lives in services.

## TypeScript
- `strict: true`. Type request generics: `FastifyRequest<{ Body: …; Params: … }>` or infer from the
  schema with a type provider (`@fastify/type-provider-typebox` / zod) if the repo uses one.

## Errors & validation
- Throw typed errors; use a `setErrorHandler` to map them to status codes + safe messages. Never
  leak stack traces or internal details to clients.
- Validate all untrusted input via route schemas. Never trust client-supplied authorization fields.

## Security & ops
- `@fastify/helmet`, `@fastify/cors` (explicit origins, not `*`), `@fastify/rate-limit` on public
  endpoints. Secrets from env (`@fastify/env`), never hardcoded.
- Use the built-in pino logger; never log secrets or full request bodies with credentials.

## Testing
- `fastify.inject()` for fast route tests without a live socket. Test services in isolation.
