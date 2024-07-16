#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Define directories
DOTFILES_DIR="$HOME/git/dotfiles"
TARGET_DIR="$HOME"

# Define custom rules for specific paths
declare -A custom_rules=(
    [".local/bin"]="$HOME/.local/bin"
    ["etc"]="/etc"
    [".gitconfig"]="$HOME/.gitconfig"
    [".config/X11/xinitrc"]="$HOME/.xinitrc"
    [".config/X11/xprofile"]="$HOME/.xprofile"
    [".config/zsh/zshenv"]="$HOME/.zshenv"
    [".config/zsh/zprofile"]="$HOME/.config/zsh/.zprofile"
    [".config/zsh/zshrc"]="$HOME/.config/zsh/.zshrc"
    [".config"]="$HOME/.config"
    [".local/bin/screenshot"]="$HOME/.local/bin/sct"
    [".bootstrap/4-dot-config.sh"]="$HOME/.local/bin/dotcon"
)

# Define exclusions
exclusions=(
    ".bootstrap/"
    "README.md"
    ".config/firefox"
    ".config/i3blocks"
    ".config/i3status"
    ".config/ranger"
    ".config/sublime-text-3"
    ".config/urxvt"
    ".config/zsh/config"
    ".config/zsh/aliases/debian.zsh"
    "etc/lightdm"
)

# Function to check if a file should be excluded
is_excluded() {
    local file="$1"
    [[ "$(basename "$file")" == .* ]] && return 0
    for exclusion in "${exclusions[@]}"; do
        [[ "$file" == "$exclusion"* ]] && return 0
    done
    return 1
}

# Apply custom rules to determine the correct target path
apply_custom_rule() {
    local path="$1"
    local rule
    for rule in "${!custom_rules[@]}"; do
        [[ "$path" == "$rule"* ]] && echo "${path/$rule/${custom_rules[$rule]}}" && return
    done
    echo "$TARGET_DIR/$path"
}

# Create parent directories if they do not exist
create_parent_directory() {
    local parent_dir
    parent_dir=$(dirname "$1")
    [[ ! -d "$parent_dir" ]] && {
        mkdir -p "$parent_dir"
        echo -e "📂 ${YELLOW}Created parent directory: $parent_dir${NC}"
    }
}

# Remove old symlinks
remove_old_symlinks() {
    echo "🗑️ Removing old symlinks..."

    find "$HOME" /etc -type l -lname "$DOTFILES_DIR/*" 2>/dev/null | while read -r symlink; do
        target=$(readlink -f "$symlink")

        if [ ! -e "$target" ]; then
            if [[ "$symlink" == /etc/* ]]; then
                sudo rm "$symlink"
                echo -e "❌ ${GREEN}Removed old symlink (with sudo): $symlink${NC}"
            else
                rm "$symlink"
                echo -e "❌ ${GREEN}Removed old symlink: $symlink${NC}"
            fi
        fi
    done
}

# Manage symlinks based on the specified action (create or remove)
manage_symlinks() {
    local action=$1
    local dry_run=$2
    local show_excluded=$3
    local action_display="Executing ${action} symlinks operation..."
    echo "${action_display}${dry_run:+ (dry run)}"

    git -C "$DOTFILES_DIR" ls-files | while read -r file; do
        if is_excluded "$file"; then
            [[ "$show_excluded" == true ]] && echo -e "⏭️ ${YELLOW}Skipping excluded file: $file${NC}"
            continue
        fi

        local full_path="$DOTFILES_DIR/$file"
        if [ -f "$full_path" ]; then
            local target=$(apply_custom_rule "$file")

            if [ "$action" = "create" ]; then
                if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$full_path" ]; then
                    echo -e "✅ ${GREEN}Skipping (already linked): $target${NC}"
                elif [ -e "$target" ]; then
                    echo -e "⚠️ ${YELLOW}Warning: $target already exists. Skipping...${NC}"
                else
                    create_parent_directory "$target"
                    if [[ "$dry_run" == true ]]; then
                        echo -e "🔗 ${GREEN}Would create symlink: $target -> $full_path${NC}"
                    else
                        if [[ "$target" == /etc/* ]]; then
                            sudo ln -s "$full_path" "$target"
                            echo -e "🔗 ${GREEN}Created symlink (with sudo): $target -> $full_path${NC}"
                        else
                            ln -s "$full_path" "$target"
                            echo -e "🔗 ${GREEN}Created symlink: $target -> $full_path${NC}"
                        fi
                    fi
                fi
            elif [ "$action" = "remove" ]; then
                if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$full_path" ]; then
                    if [[ "$dry_run" == true ]]; then
                        echo -e "❌ ${GREEN}Would remove symlink: $target${NC}"
                    else
                        if [[ "$target" == /etc/* ]]; then
                            sudo rm "$target"
                            echo -e "❌ ${GREEN}Removed symlink (with sudo): $target${NC}"
                        else
                            rm "$target"
                            echo -e "❌ ${GREEN}Removed symlink: $target${NC}"
                        fi
                    fi
                else
                    echo -e "⏭️ ${YELLOW}Skipping: $target (not a symlink or points elsewhere)${NC}"
                fi
            fi
        fi
    done

    if [ "$action" = "remove" ] && [ "$dry_run" != true ]; then
        remove_old_symlinks
    fi
}

# Show the usage help message
show_help() {
    echo "Usage: $(basename "$0") [options]"
    echo
    echo "Options:"
    echo "  --create          Create symlinks"
    echo "  --remove          Remove symlinks"
    echo "  --dry-run         Show what would be done without making any changes"
    echo "  --show-excluded   Display logs for excluded files"
    echo "  -h, --help        Show this help message"
}

# Main function to process arguments and invoke appropriate actions
main() {
    local action=""
    local dry_run=false
    local show_excluded=false
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --create) action="create" ;;
            --remove) action="remove" ;;
            --dry-run) dry_run=true ;;
            --show-excluded) show_excluded=true ;;
            -h|--help) show_help; exit 0 ;;
            *) echo "Unknown parameter: $1"; show_help; exit 1 ;;
        esac
        shift
    done
    if [[ -z "$action" ]]; then
        echo "Please specify an action: --create or --remove"
        show_help
        exit 1
    fi
    manage_symlinks "$action" "$dry_run" "$show_excluded"
    echo -e "🏁 ${GREEN}Dotfiles ${action} complete!${NC}"
}

main "$@"
