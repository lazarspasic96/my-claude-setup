#!/bin/bash

# Claude Config Sync Tool
# Syncs files between global ~/.claude/ and local .claude/

GLOBAL_DIR="$HOME/.claude"
LOCAL_DIR="$(pwd)/.claude"
GLOBAL_CLAUDE_MD="$GLOBAL_DIR/CLAUDE.md"
LOCAL_CLAUDE_MD="$(pwd)/CLAUDE.md"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

ACTION="${1:-compare}"  # compare, to-local, to-global
FOLDER="${2:-all}"      # all, agents, commands, CLAUDE.md

sync_file() {
    local src="$1"
    local dst="$2"
    local name="$3"

    if [[ -f "$src" ]]; then
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        echo -e "  ${GREEN}[SYNCED]${NC} $name"
    fi
}

get_newer() {
    local global_file="$1"
    local local_file="$2"

    if [[ ! -f "$global_file" ]]; then
        echo "local"
        return
    fi
    if [[ ! -f "$local_file" ]]; then
        echo "global"
        return
    fi

    global_time=$(stat -f %m "$global_file" 2>/dev/null || stat -c %Y "$global_file" 2>/dev/null)
    local_time=$(stat -f %m "$local_file" 2>/dev/null || stat -c %Y "$local_file" 2>/dev/null)

    if [[ "$global_time" -gt "$local_time" ]]; then
        echo "global"
    else
        echo "local"
    fi
}

compare_file() {
    local global_file="$1"
    local local_file="$2"
    local name="$3"

    if [[ ! -f "$global_file" && ! -f "$local_file" ]]; then
        return
    fi

    if [[ ! -f "$global_file" ]]; then
        echo -e "  ${GREEN}[LOCAL ONLY]${NC} $name → copy to global with: sync-config to-global"
        return 0
    fi

    if [[ ! -f "$local_file" ]]; then
        echo -e "  ${YELLOW}[GLOBAL ONLY]${NC} $name → copy to local with: sync-config to-local"
        return 0
    fi

    if diff -q "$global_file" "$local_file" > /dev/null 2>&1; then
        echo -e "  ${GREEN}[SYNCED]${NC} $name"
        return 0
    fi

    local newer=$(get_newer "$global_file" "$local_file")
    global_time=$(stat -f %m "$global_file" 2>/dev/null || stat -c %Y "$global_file" 2>/dev/null)
    local_time=$(stat -f %m "$local_file" 2>/dev/null || stat -c %Y "$local_file" 2>/dev/null)

    if [[ "$newer" == "global" ]]; then
        echo -e "  ${RED}[GLOBAL NEWER]${NC} $name"
        echo -e "    Global: $(date -r "$global_time" '+%Y-%m-%d %H:%M')"
        echo -e "    Local:  $(date -r "$local_time" '+%Y-%m-%d %H:%M')"
    else
        echo -e "  ${BLUE}[LOCAL NEWER]${NC} $name"
        echo -e "    Local:  $(date -r "$local_time" '+%Y-%m-%d %H:%M')"
        echo -e "    Global: $(date -r "$global_time" '+%Y-%m-%d %H:%M')"
    fi
}

process_folder() {
    local folder="$1"
    local action="$2"
    local global_path="$GLOBAL_DIR/$folder"
    local local_path="$LOCAL_DIR/$folder"

    echo ""
    echo -e "${CYAN}=== $folder ===${NC}"

    if [[ ! -d "$global_path" && ! -d "$local_path" ]]; then
        echo "  (folder does not exist)"
        return
    fi

    local all_files=$(
        (ls "$global_path" 2>/dev/null; ls "$local_path" 2>/dev/null) | \
        grep -v '^\.DS_Store$' | \
        sort -u
    )

    for file in $all_files; do
        # Skip symlinks and directories in global
        [[ -L "$global_path/$file" ]] && continue
        [[ -d "$global_path/$file" ]] && continue
        [[ -d "$local_path/$file" ]] && continue

        case "$action" in
            compare)
                compare_file "$global_path/$file" "$local_path/$file" "$file"
                ;;
            to-local)
                if [[ -f "$global_path/$file" ]]; then
                    sync_file "$global_path/$file" "$local_path/$file" "$file"
                fi
                ;;
            to-global)
                if [[ -f "$local_path/$file" ]]; then
                    sync_file "$local_path/$file" "$global_path/$file" "$file"
                fi
                ;;
        esac
    done
}

show_help() {
    echo ""
    echo -e "${YELLOW}Claude Config Sync Tool${NC}"
    echo ""
    echo "Usage: sync-config [action] [folder]"
    echo ""
    echo "Actions:"
    echo "  compare   - Show differences (default)"
    echo "  to-local  - Sync global → local"
    echo "  to-global - Sync local → global"
    echo ""
    echo "Folders:"
    echo "  all       - All folders (default)"
    echo "  agents    - Only agents folder"
    echo "  commands  - Only commands folder"
    echo "  claude    - Only CLAUDE.md file"
    echo ""
    echo "Examples:"
    echo "  sync-config                    # Compare all"
    echo "  sync-config to-local           # Sync all global → local"
    echo "  sync-config to-global agents   # Sync local agents → global"
    echo ""
}

# Main
case "$ACTION" in
    help|-h|--help)
        show_help
        exit 0
        ;;
    compare|to-local|to-global)
        ;;
    *)
        echo -e "${RED}Unknown action: $ACTION${NC}"
        show_help
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}╔════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║   Claude Config Sync Tool                  ║${NC}"
echo -e "${YELLOW}╚════════════════════════════════════════════╝${NC}"
echo ""
echo "Global: $GLOBAL_DIR"
echo "Local:  $LOCAL_DIR"
echo "Action: $ACTION"
echo ""

# Process CLAUDE.md
if [[ "$FOLDER" == "all" || "$FOLDER" == "claude" ]]; then
    echo -e "${CYAN}=== CLAUDE.md ===${NC}"
    case "$ACTION" in
        compare)
            compare_file "$GLOBAL_CLAUDE_MD" "$LOCAL_CLAUDE_MD" "CLAUDE.md"
            ;;
        to-local)
            sync_file "$GLOBAL_CLAUDE_MD" "$LOCAL_CLAUDE_MD" "CLAUDE.md"
            ;;
        to-global)
            sync_file "$LOCAL_CLAUDE_MD" "$GLOBAL_CLAUDE_MD" "CLAUDE.md"
            ;;
    esac
fi

# Process folders
if [[ "$FOLDER" == "all" || "$FOLDER" == "agents" ]]; then
    process_folder "agents" "$ACTION"
fi

if [[ "$FOLDER" == "all" || "$FOLDER" == "commands" ]]; then
    process_folder "commands" "$ACTION"
fi

echo ""
if [[ "$ACTION" == "compare" ]]; then
    echo -e "${YELLOW}Legend:${NC}"
    echo -e "  ${GREEN}[SYNCED]${NC}       - Files identical"
    echo -e "  ${RED}[GLOBAL NEWER]${NC} - Global newer → use 'to-local'"
    echo -e "  ${BLUE}[LOCAL NEWER]${NC}  - Local newer → use 'to-global'"
    echo -e "  ${GREEN}[LOCAL ONLY]${NC}  - Only in local"
    echo -e "  ${YELLOW}[GLOBAL ONLY]${NC} - Only in global"
fi
echo ""
