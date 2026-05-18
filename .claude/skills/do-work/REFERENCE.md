# do-work — Reference

Detailed material referenced from [SKILL.md](SKILL.md). Load only when a step needs deeper guidance.

## Self-review checklist (full)

Apply when reading `git diff <base>..HEAD` in step 6.

### Clarity & complexity

- [ ] Functions over ~30 lines — split if doing more than one thing
- [ ] More than 3 levels of nesting — flatten with early returns or extract helpers
- [ ] Nested ternaries (`a ? b : c ? d : e`) — replace with `if/else` chain or `switch`
- [ ] Boolean parameters that change behavior — split into two functions, or use a named enum
- [ ] Comments that just restate the code — delete
- [ ] Comments explaining *what* (delete) vs *why* (keep)

### Naming

- [ ] Single-letter vars outside tight loops (`i`, `j` in `for` is fine; `d`, `x`, `obj` elsewhere is not)
- [ ] Abbreviations that aren't industry-standard (`usr` → `user`, `cfg` → `config`)
- [ ] Booleans without `is`/`has`/`should` prefix
- [ ] Functions whose name doesn't match what they actually do

### Redundancy

- [ ] Duplicated logic appearing 3+ times — extract to helper
- [ ] Wrapper functions that just call another function with no transformation
- [ ] Re-computing the same value multiple times in one scope
- [ ] Default values set in multiple places — consolidate to one

### Type safety (TS / Python / Java)

- [ ] `any` (TS) — tighten or use `unknown` + type guard
- [ ] `as` casts — verify they're actually safe; prefer guards
- [ ] Optional chains where the value is known to exist
- [ ] Missing null/undefined handling at boundaries

### Correctness checks (don't change behavior, but flag for user)

- [ ] Edge cases — empty array, null input, zero, negative, very large
- [ ] Off-by-one suspects in loops
- [ ] Race conditions in concurrent code
- [ ] Unhandled rejected promises / unawaited async calls
- [ ] Resource leaks — unclosed streams, intervals, subscriptions

### Security

- [ ] String interpolation into SQL → parameterized queries
- [ ] Shell command construction from user input → escape or use array form
- [ ] User input rendered to HTML without escaping
- [ ] Secrets logged or returned in responses
- [ ] Unauthenticated routes that should require auth

### What NOT to do in self-review

- Never change behavior. If you spot a real bug, surface it to the user — don't silently fix during review.
- Never combine unrelated cleanups into one commit. If the original change was about X and you want to clean Y, commit Y separately or skip it.
- Don't over-engineer. "Could be more DRY" is not a reason to refactor working, readable code.
- Don't add abstractions speculatively. Wait for the third use case.

## RGR example (TypeScript)

Task: add a `formatCurrency(amount: number, currency: string): string` helper.

### Cycle 1 — basic case

**RED**
```ts
// formatCurrency.test.ts
import { formatCurrency } from "./formatCurrency";

test("formats USD with 2 decimals", () => {
  expect(formatCurrency(1234.5, "USD")).toBe("$1,234.50");
});
```
Run test → fails (`formatCurrency is not defined`).

**GREEN**
```ts
// formatCurrency.ts
export const formatCurrency = (amount: number, currency: string): string =>
  new Intl.NumberFormat("en-US", { style: "currency", currency }).format(amount);
```
Run test → passes.

### Cycle 2 — zero handling

**RED**
```ts
test("formats zero", () => {
  expect(formatCurrency(0, "USD")).toBe("$0.00");
});
```
Run → passes already. No new code needed. Skip to next cycle.

### Cycle 3 — different currency

**RED**
```ts
test("formats EUR with European separator", () => {
  expect(formatCurrency(1234.5, "EUR")).toBe("€1,234.50");
});
```
Run → passes. Done. No refactor needed.

**REFACTOR** — re-read diff. Nothing to tighten. Verify all tests pass. Commit.

## Commit message — real examples

Default: [Conventional Commits](https://www.conventionalcommits.org/) — `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `perf`, `style`. If `git log --oneline -10` shows the repo uses a different prefix (e.g. Jira key, scope tag), match what's already there.


### Feature

```
feat: add formatCurrency helper (LEAN-451)

Decisions:
- Used Intl.NumberFormat instead of manual formatting — handles locale automatically
- Defaulted locale to en-US; can expand later if non-US locales needed

Files:
- src/lib/formatCurrency.ts — new helper
- src/lib/formatCurrency.test.ts — three RGR cycles (basic, zero, EUR)

Notes: none
```

### Bug fix

```
fix: handle empty cart in checkout total (#317)

Decisions:
- Return 0 instead of throwing — the UI was crashing on empty state
- Added test that asserts no throw on []

Files:
- src/checkout/computeTotal.ts — guard on empty array
- src/checkout/computeTotal.test.ts — added empty-cart case

Notes: existing snapshot tests in /e2e still pass; not regenerated
```

### Blocked

```
chore: partial migration of legacy auth (LEAN-512)

Decisions:
- Migrated /login and /logout routes
- Stopped at /refresh-token — depends on session store rewrite (LEAN-540)

Files:
- src/routes/login.ts — switched to new middleware
- src/routes/logout.ts — switched to new middleware

Notes:
- BLOCKED on LEAN-540 before /refresh-token can move
- Comment left on LEAN-512 explaining partial state
```

## Priority order (when picking from a list)

When the user gives you a list (e.g. "here's a PRD with 5 sub-tasks, pick one"), choose in this order:

1. **Bug fixes** — broken behavior affecting users
2. **Tracer bullets** — thin end-to-end slices that prove an approach works
3. **Polish** — improving existing functionality (error messages, UX, docs)
4. **Refactors** — internal cleanups with no user-visible change

If the user already specified which task, respect their choice — this order is only for ambiguous cases.

## Plan template (step 3)

Copy-paste this when presenting the plan:

```
## Plan

**Goal**: <one sentence — what will be true after this work>

**Files to touch**:
- `path/to/file.ts` — <why>
- `path/to/file.test.ts` — <why>

**Test strategy**:
- New tests: <list>
- Existing tests that should still pass: <list or "all in <dir>">
- Estimated RGR cycles: <N>

**Risks / unknowns**:
- <thing you'd like the user to confirm>

Ready to proceed?
```
