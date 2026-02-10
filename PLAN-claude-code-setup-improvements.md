# Claude Code Setup Improvements - Boris's Tips

Based on Boris (Claude Code creator) tips. Sorted by impact/effort ratio.

---

## PHASE 1: Self-Improving CLAUDE.md (HIGHEST IMPACT)

### 1A. Restructure `~/.claude/CLAUDE.md`
**Problem**: 123-line generic template. No mistake-tracking. No subagent guidance. Duplicated identically in project root.

**New structure** - cut to ~40 lines of dense, actionable rules:
- **Hard Rules**: condense security + code style into bullet list (no headers bloat)
- **Add "Learned Mistakes" section**: empty initially, grows after every correction
- **Add "Subagent Guidance"**: when to use subagents, what to delegate
- **Add "Plan Mode Discipline"**: re-plan when sideways, verify via plan mode
- **Remove**: framework-specific skill refs (belong in project CLAUDE.md, not global)

### 1B. Differentiate project CLAUDE.md
**Problem**: Project CLAUDE.md = byte-for-byte copy of global. Wasteful.

Replace `/Users/lazarspasic/Desktop/claude-learning-ai/CLAUDE.md` with project-specific content:
- What repo is (config storage for Claude setup)
- Common tasks (add skill, add command, sync)
- Own "Learned Mistakes" section

### 1C. Create `/update-claude-md` command
New file: `~/.claude/commands/update-claude-md.md`
- After any correction, run `/update-claude-md <lesson>`
- Appends `- [YYYY-MM-DD] <lesson>` to Learned Mistakes section
- Creates the self-improvement loop Boris describes

---

## PHASE 2: Hooks (HIGH IMPACT, zero hooks currently)

### 2A. Add hooks to `~/.claude/settings.json`
**PreToolUse auto-approve** (stop "approve?" prompts for safe ops):
- `git diff`, `git log`, `git status`, `git branch` (read-only git)
- `npm test`, `npx tsc`, `npx eslint`, `pnpm test/lint/build` (safe CI ops)

**PostToolUse guard**:
- Block any Write to `.env*` files as safety net

### 2B. Expand project permissions in `settings.local.json`
Add: `git worktree:*`, `git diff:*`, `git log:*`, `git status`, `git branch:*`

---

## PHASE 3: Git Worktrees + Shell Aliases (Boris: "single biggest productivity unlock")

### 3A. Add to `~/.zshrc`
```bash
# Claude worktree aliases
cwt() { # Create worktree: cwt <repo> <branch>
  local wt="${1}-worktrees/${2}"
  mkdir -p "$(dirname "$wt")"
  git -C "$1" worktree add "$wt" -b "$2" 2>/dev/null || git -C "$1" worktree add "$wt" "$2"
  cd "$wt"
}
cwl() { git -C "${1:-.}" worktree list; }  # List
cwr() { git -C "$1" worktree remove "${1}-worktrees/${2}"; }  # Remove
cc() { cd "${1:-.}" && claude; }  # Quick launch
```

### 3B. Create `/worktree` command
New file: `~/.claude/commands/worktree.md`
- `new <branch>`, `list`, `remove <branch>`
- Standardizes worktree path: `../<repo>-worktrees/<branch>`

---

## PHASE 4: New High-Value Commands

### 4A. `/techdebt` command
New file: `~/.claude/commands/techdebt.md`
- Scans: TODO/FIXME/HACK, `any` types, console.log, files >350 lines, deep nesting, duplicated code
- Output: Critical / Important / Low Priority report
- Boris tip: "run at end of every session"

### 4B. `/context-dump` command
New file: `~/.claude/commands/context-dump.md`
- Generates full project context (package.json, git log, CLAUDE.md, notes/, architecture)
- For pasting into new Claude sessions to restore context quickly

### 4C. `/explain` command
New file: `~/.claude/commands/explain.md`
- Boris tip #10: learning mode
- ASCII diagrams, before/after examples, explains WHY not WHAT
- Use for understanding unfamiliar codebases

### 4D. `/docker-debug` command
New file: `~/.claude/commands/docker-debug.md`
- Boris tip #5: "point Claude at docker logs to troubleshoot distributed systems"
- Runs `docker ps`, `docker logs`, `docker inspect` on target containers
- Analyzes logs for errors, suggests fixes
- Can restart containers after fix

---

## PHASE 5: Clean Up Duplication

### 5A. Remove duplicate commands from project `.claude/commands/`
Currently 6 global commands duplicated in project. Keep only project-specific: `sync-skills.md`, `sync-config.md`.

Remove from `/Users/lazarspasic/Desktop/claude-learning-ai/.claude/commands/`:
- commit.md, commit-and-push.md, handoff.md, interview.md, code-review.md, ui-skills.md

### 5B. Remove framework skills from global CLAUDE.md
React/Expo/RN skill references -> project-level CLAUDE.md only

---

## Critical Files to Modify

| File | Action |
|------|--------|
| `~/.claude/CLAUDE.md` | Restructure: condense, add Learned Mistakes + Subagent + Plan Mode |
| `~/.claude/settings.json` | Add hooks (auto-approve safe ops, guard .env writes) |
| `~/.zshrc` | Add worktree aliases (cwt, cwl, cwr, cc) |
| `~/.claude/commands/update-claude-md.md` | NEW: self-improvement loop command |
| `~/.claude/commands/techdebt.md` | NEW: tech debt scanner |
| `~/.claude/commands/context-dump.md` | NEW: context restoration for new sessions |
| `~/.claude/commands/explain.md` | NEW: learning mode explanations |
| `~/.claude/commands/worktree.md` | NEW: worktree management |
| `~/.claude/commands/docker-debug.md` | NEW: Docker log analysis & debugging |
| `~/Desktop/claude-learning-ai/CLAUDE.md` | Replace with project-specific content |
| `~/Desktop/claude-learning-ai/.claude/settings.local.json` | Expand permissions |
| `~/Desktop/claude-learning-ai/.claude/commands/` | Remove 6 duplicated global commands |

---

## Execution Order (top 5 = ~70% of value)

1. **Restructure CLAUDE.md** - condense + add Learned Mistakes/Subagent/Plan sections
2. **Create /update-claude-md** - self-improvement feedback loop
3. **Add hooks** - auto-approve safe ops, stop approve fatigue
4. **Shell aliases for worktrees** - parallel session workflow
5. **Plan mode discipline** - re-plan when sideways, verify via plan mode

Then: /techdebt, /context-dump, /explain, /docker-debug, /worktree, cleanup duplication

---

## Verification
- After CLAUDE.md restructure: start new Claude session, verify rules are applied
- After hooks: run `git status`, `pnpm test` - should auto-approve without prompt
- After worktree aliases: `cwt ~/git/<repo> test-branch` should create worktree and cd into it
- After new commands: `/techdebt`, `/update-claude-md test lesson`, `/context-dump` should all work
- After cleanup: verify `/commit`, `/handoff` etc. still work from global

---

## Environment Notes
- **Terminal**: iTerm2 (good tmux integration, profile color-coding for worktrees)
- **Docker**: Used regularly - `/docker-debug` command included in Phase 4
- **Slack/Linear**: Not active - skipping MCP integrations for these

## Unresolved Questions
1. **Which projects get project-specific CLAUDE.md first?** Recommend starting with most-used repos (leanpay-web, jolli-web)
2. **iTerm2 profiles**: Want me to set up color-coded iTerm2 profiles for different worktrees? (e.g., main=blue, feature=green, bugfix=red)
