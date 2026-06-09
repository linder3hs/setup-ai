# Stack reference — Next.js 16 / React 19 / TypeScript

Load this only when working on a Next.js/React project. Conventions, not law — defer to what the
target repo already does.

## Framework
- **Next.js 16, App Router** (`app/`). Avoid the legacy `pages/` router for new code.
- **React 19**: Server Components are the default. Add `"use client"` only when a component needs
  state, effects, browser APIs, or event handlers. Push client boundaries as low as possible.
- Data fetching happens in Server Components / route handlers, not in client `useEffect`. Use
  `async` Server Components and `fetch` with appropriate caching.
- Mutations via Server Actions (`"use server"`) or route handlers; revalidate with
  `revalidatePath`/`revalidateTag`.

## TypeScript
- `strict: true`. No `any` — use `unknown` + narrowing. Type props explicitly.
- Prefer `type` aliases for props/unions; `interface` when extending is needed.

## Components & files
- Components: `PascalCase.tsx`. Routes/segments: lowercase folders (`app/dashboard/page.tsx`).
- Colocate: component + its test + its styles in the same folder when practical.
- One component per file for shared/reusable ones; small helpers can colocate.

## Styling
- Tailwind by default. Keep class lists readable; extract to a component when a className repeats.
- Respect any existing design tokens / `cn()` helper / shadcn setup in the repo.

## React 19 specifics
- Use the new `use()` hook for unwrapping promises/context where it fits.
- `useActionState` / `useFormStatus` for form + Server Action flows.
- `ref` as a prop (no more `forwardRef` needed in React 19).

## Performance
- Avoid inline object/array literals as props on hot paths (new ref → re-render). Memoize only when
  it measurably matters; don't sprinkle `useMemo`/`useCallback` everywhere.
- `next/image` for images, `next/font` for fonts, dynamic `import()` for heavy client-only chunks.

## Don't
- Don't fetch on the client what the server can fetch. Don't mark everything `"use client"`.
- Don't add a state-management library for state the URL or server already holds.
