---
name: do-work
description: Plan-driven, TDD-first workflow for completing one focused unit of work (a GitHub/Linear/Jira issue, a PRD section, or a plain task description). Steps - explore, plan with user approval gate, Red-Green-Repeat-Refactor, verify, self-review, structured commit. Use when the user says "do work", "do this", "implement this issue/PRD/ticket", "work on this task", "use TDD on this", asks for rigorous test coverage with self-review, or pastes an issue/PRD link and asks Claude to deliver it.
---

# do-work

Single unit of work, plan-driven, test-first discipline for **interactive** Claude Code sessions (not autonomous loops).

## Quick start

User describes one unit of work — issue link, PRD section, ticket reference, or plain description. Follow these 7 steps in order. **Never skip ahead.**

## Workflow

### 1. Acquire context

- If user gave an issue/ticket reference (e.g. `#42`, `LEAN-123`, URL): fetch it. Use `gh issue view`, Jira/Linear MCP, or ask user to paste the body.
- Pull the parent PRD/Epic if referenced inside.
- Run `git log --oneline -10` and `git status`. Identify current and base branch.
- If a related design doc, ADR, or CLAUDE.md exists in the repo — read it.

### 2. Explore

- Read source files relevant to the change **before writing any code**.
- Pay extra attention to **test files** that touch the area. They define the existing contract.
- Note conventions: file layout, naming, lint/format setup, type strictness, test runner.

### 3. Plan — present to user, then STOP

Output a plan with these sections:

- **Goal** — one sentence
- **Files to touch** — list with one-line reason per file
- **Test strategy** — which tests, how many RGR cycles expected, any new test files
- **Risks / unknowns** — anything the user should confirm before you spend tokens

**Stop. Wait for user approval (or correction) before writing any code.** This is the plan-driven gate.

### 4. Implement with RGR

Strict cycle, repeat until plan is complete:

1. **RED** — write ONE failing test that captures the next slice of behavior. Run it; confirm it fails for the right reason.
2. **GREEN** — write the minimum code to make it pass. Run it; confirm it passes.
3. **REPEAT** — back to RED for the next slice. One slice = one test = one commit-worthy thing.
4. **REFACTOR** — only while GREEN. Never refactor on RED.

For non-code work (docs, config, CI), skip RGR and make the change directly.

### 5. Verify

Run, in order — both must exit 0:

- Project typecheck (e.g. `npm run typecheck`, `tsc --noEmit`, `mypy`, `cargo check`)
- Project tests (e.g. `npm test`, `pnpm test`, `pytest`, `cargo test`)

If either fails: fix and re-run. **Never commit broken code.**

### 6. Self-review

Read your own `git diff <base>..HEAD`. Look for clarity wins **without changing behavior**:

- Unnecessary nesting → use early returns
- Redundant code / abstractions
- Unclear names → rename
- Nested ternaries → if/else chain
- Obvious comments → delete
- Dead code / `TODO:` markers / commented-out blocks → delete
- `any` (TS) or `interface{}` (Go) → tighten to real type

**Never change what the code does** — only how it reads. After any change, re-run step 5 (verify). See [REFERENCE.md](REFERENCE.md) for the full review checklist and examples.

### 7. Commit & report

Make ONE commit. Message format:

```
{type}: {summary} ({task-ref})

Decisions:
- {key decision 1}
- {key decision 2}

Files:
- {file-1} — {one-line why}
- {file-2} — {one-line why}

Notes:
- {blocker, follow-up, or "none"}
```

`{type}` is a [Conventional Commit](https://www.conventionalcommits.org/) type — `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `perf`, or `style`. Pick the one that best describes the change. If `git log --oneline -10` shows the repo already uses a different prefix convention (e.g. a Jira key like `LEAN-123:`), match what's there.

Then report to user in chat:
- One-line summary of what landed
- Anything you couldn't complete or that needs the user's verification
- Suggested next task if there's a logical follow-up

## Rules

- **One task at a time.** No "while I'm here, I'll also fix..." — stop, report, ask.
- **No premature close.** Do not close the issue/ticket automatically. Let the user verify and close.
- **No `TODO:` or commented-out code** in committed code.
- **No magic numbers.** Extract to named constants.
- **No `any` in TypeScript** — use `unknown` or proper type.
- **If blocked** (missing context, flaky test outside your scope, external dep): stop, summarize findings in the commit message or a comment on the issue, and ask the user.

## When NOT to use this skill

- Multi-issue autonomous loops or whole-backlog processing → use an autonomous orchestrator instead
- One-line trivial fix that doesn't warrant TDD → just make the change
- Pure exploration / spike with no commit intent
