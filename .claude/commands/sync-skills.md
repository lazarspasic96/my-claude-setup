# Sync Global Skills

Sync all skills and commands from global ~/.claude to this project's .claude directory.

## Instructions

Run the sync script to copy all global skills and commands to the local project:

```bash
bash .claude/scripts/sync-global-skills.sh
```

This will:
1. Copy all command files from ~/.claude/commands/
2. Copy all skills from ~/.claude/skills/, resolving any symlinks to get actual content
3. Overwrite existing files if they exist

After running, report what was synced.
