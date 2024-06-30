#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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

# Function to create symlinks
create_symlinks() {
    echo "Creating symlinks..."

    find "$DOTFILES_DIR" -type f -not -path '*/\.git/*' -print0 | while IFS= read -r -d '' file; do
        relative_path="${file#$DOTFILES_DIR/}"
        target=$(apply_custom_rule "$relative_path")

        mkdir -p "$(dirname "$target")"

        if [ -e "$target" ]; then
            echo -e "${YELLOW}Warning: $target already exists. Skipping...${NC}"
        else
            ln -s "$file" "$target"
            echo -e "${GREEN}Created symlink: $target -> $file${NC}"
        fi
    done
}

# Main function
main() {
    local install_requirements=false
    local create_links=true

    # Parse command line arguments
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --no-links) create_links=false ;;
            --install-requirements) install_requirements=true ;;
            *) echo "Unknown parameter: $1"; exit 1 ;;
        esac
        shift
    done

    # Run requirements installation if requested
    if [ "$install_requirements" = true ]; then
        if [ -f "$DOTFILES_DIR/requirements.sh" ]; then
            echo "Installing requirements..."
            bash "$DOTFILES_DIR/requirements.sh"
        else
            echo -e "${RED}Error: requirements.sh not found${NC}"
            exit 1
        fi
    fi

    # Create symlinks
    if [ "$create_links" = true ]; then
        create_symlinks
    fi

    echo -e "${GREEN}Dotfiles setup complete!${NC}"
}

# Run the main function with all arguments
main "$@"
