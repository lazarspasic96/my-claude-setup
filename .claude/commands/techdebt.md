Scan this codebase for tech debt. Use Grep and Glob tools to search systematically.

## Critical (fix now)
- `TODO`, `FIXME`, `HACK`, `XXX` comments — Grep for these patterns across all source files
- `any` type usage in .ts/.tsx files — Grep for `: any`, `as any`, `<any>`
- `console.log` in non-test files — Grep .ts/.tsx excluding *.test.* and *.spec.*

## Important (fix soon)
- Files over 350 lines — use Glob to find all .ts/.tsx files, check line counts
- Functions over 50 lines — look for long function bodies
- Deep nesting (4+ levels of indentation) — scan for excessive complexity
- Empty catch blocks — `catch` with no error handling

## Low Priority (track)
- Unused imports — imports not referenced in file body
- Missing return types on exported functions
- Duplicated code patterns — similar logic in multiple files
- Magic numbers — hardcoded values without named constants

## Output Format
Group findings by severity. For each finding show:
```
[SEVERITY] file/path.ts:LINE
  > code snippet
  Suggested fix: brief recommendation
```

At the end, show summary counts:
- Critical: X findings
- Important: X findings
- Low: X findings
