# Sync Claude Config

Compare and sync files between global `~/.claude/` and local `.claude/` folder.

## Instructions

Run the sync-config script to compare or sync files:

1. First, run the comparison to see what's different:
   ```bash
   ./.claude/scripts/sync-config.sh compare
   ```

2. Based on user's choice, run the appropriate sync:
   - `to-local` - Copy newer files from global to local
   - `to-global` - Copy newer files from local to global

3. Show the user the output and ask which direction they want to sync.

## Arguments

- `$ARGUMENTS` - Optional: action (compare/to-local/to-global) and folder (all/agents/commands/claude)

## Execution

If arguments provided, run:
```bash
./.claude/scripts/sync-config.sh $ARGUMENTS
```

Otherwise, run compare first and ask user what to sync.
