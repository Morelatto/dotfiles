#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

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
)

# Define exclusions
exclusions=(
    "README.md"
    ".config/firefox"
    ".config/i3blocks"
    ".config/i3status"
    ".config/ranger"
    ".config/sublime-text-3"
)

# Function to check if a file should be excluded
is_excluded() {
    local file="$1"
    for exclusion in "${exclusions[@]}"; do
        if [[ "$file" == "$exclusion"* ]]; then
            return 0  # True, should be excluded
        fi
    done
    return 1  # False, should not be excluded
}

# Function to apply custom rules
apply_custom_rule() {
    local path="$1"
    local matched=false

    for rule in $(echo "${!custom_rules[@]}" | tr ' ' '\n' | awk '{ print length, $0 }' | sort -rn | cut -d' ' -f2-); do
        if [[ "$path" == "$rule"* ]]; then
            echo "${path/$rule/${custom_rules[$rule]}}"
            matched=true
            break
        fi
    done

    if [ "$matched" = false ]; then
        echo "$TARGET_DIR/$path"
    fi
}

# Function to create parent directory if it doesn't exist
create_parent_directory() {
    local target="$1"
    local parent_dir=$(dirname "$target")
    if [ ! -d "$parent_dir" ]; then
        sudo mkdir -p "$parent_dir"
        echo -e "${YELLOW}Created parent directory: $parent_dir${NC}"
    fi
}

# Function to remove old symlinks
remove_old_symlinks() {
    echo "Removing old symlinks..."

    # Find all symlinks in $HOME and /etc that point to the dotfiles directory
    find "$HOME" /etc -type l -lname "$DOTFILES_DIR/*" 2>/dev/null | while read -r symlink; do
        # Get the target of the symlink
        target=$(readlink -f "$symlink")

        # Check if the target file still exists in the dotfiles directory
        if [ ! -e "$target" ]; then
            if [[ "$symlink" == /etc/* ]]; then
                sudo rm "$symlink"
                echo -e "${GREEN}Removed old symlink (with sudo): $symlink${NC}"
            else
                rm "$symlink"
                echo -e "${GREEN}Removed old symlink: $symlink${NC}"
            fi
        fi
    done
}

# Function to manage symlinks
manage_symlinks() {
    local action=$1
    echo "${action^}ing symlinks..."

    # Use git ls-files to list tracked files, respecting .gitignore
    git -C "$DOTFILES_DIR" ls-files | while read -r file; do
        if is_excluded "$file"; then
            echo -e "${YELLOW}Skipping excluded file: $file${NC}"
            continue
        fi

        local full_path="$DOTFILES_DIR/$file"
        if [ -f "$full_path" ]; then
            local target=$(apply_custom_rule "$file")

            if [ "$action" = "create" ]; then
                if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$full_path" ]; then
                    echo -e "${GREEN}Skipping (already linked): $target${NC}"
                elif [ -e "$target" ]; then
                    echo -e "${YELLOW}Warning: $target already exists. Skipping...${NC}"
                else
                    create_parent_directory "$target"
                    if [[ "$target" == /etc/* ]]; then
                        sudo ln -s "$full_path" "$target"
                        echo -e "${GREEN}Created symlink (with sudo): $target -> $full_path${NC}"
                    else
                        ln -s "$full_path" "$target"
                        echo -e "${GREEN}Created symlink: $target -> $full_path${NC}"
                    fi
                fi
            elif [ "$action" = "remove" ]; then
                if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$full_path" ]; then
                    if [[ "$target" == /etc/* ]]; then
                        sudo rm "$target"
                        echo -e "${GREEN}Removed symlink (with sudo): $target${NC}"
                    else
                        rm "$target"
                        echo -e "${GREEN}Removed symlink: $target${NC}"
                    fi
                else
                    echo -e "${YELLOW}Skipping: $target (not a symlink or points elsewhere)${NC}"
                fi
            fi
        fi
    done

    if [ "$action" = "remove" ]; then
        remove_old_symlinks
    fi
}

# Main function
main() {
    local action=""

    # Parse command line arguments
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --create) action="create" ;;
            --remove) action="remove" ;;
            *) echo "Unknown parameter: $1"; exit 1 ;;
        esac
        shift
    done

    if [ -z "$action" ]; then
        echo "Please specify an action: --create or --remove"
        exit 1
    fi

    manage_symlinks "$action"

    echo -e "${GREEN}Dotfiles ${action} complete!${NC}"
}

# Run the main function with all arguments
main "$@"
