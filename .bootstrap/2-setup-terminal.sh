#!/bin/bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Detect the operating system and set package manager
if [ -f /etc/arch-release ]; then
    OS="arch"
    PKG_MANAGER="sudo pacman -S --noconfirm"
    UPDATE_COMMAND="sudo pacman -Syu --noconfirm"
elif [ -f /etc/debian_version ]; then
    OS="debian"
    PKG_MANAGER="sudo apt install -qq -y"
    UPDATE_COMMAND="sudo apt update -qq && sudo apt upgrade -y"
else
    echo -e "${RED}Unsupported operating system. Exiting.${NC}"
    exit 1
fi

echo -e "${YELLOW}Detected $([ "$OS" == "arch" ] && echo "Arch Linux" || echo "Debian-based system")${NC}"

# Function to install a package if it's not already installed
install_if_not_exists() {
    if ! command -v $1 &>/dev/null; then
        echo "Installing $1..."
        $PKG_MANAGER $2
    else
        echo "$1 is already installed."
    fi
}

# Update system
$UPDATE_COMMAND

# Install terminal-related packages
TERMINAL_PACKAGES="git curl wget zsh bat tree exa ripgrep httpie xclip xdotool unzip jq htop"

for pkg in $TERMINAL_PACKAGES; do
    install_if_not_exists $pkg $pkg
done

if [ "$OS" == "arch" ]; then
    ARCH_TERMINAL_PACKAGES="fd"
    $PKG_MANAGER $ARCH_TERMINAL_PACKAGES
elif [ "$OS" == "debian" ]; then
    DEBIAN_TERMINAL_PACKAGES="fd-find"
    $PKG_MANAGER $DEBIAN_TERMINAL_PACKAGES
else
    echo -e "${RED}Unsupported operating system. Cannot install additional packages.${NC}"
fi

# Install Oh My Zsh and plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install Zsh plugins
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$ZSH_CUSTOM/plugins/alias-tips" ]; then
    git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
fi

if [ ! -d "$ZSH_CUSTOM/plugins/z" ]; then
    git clone https://github.com/rupa/z.git $ZSH_CUSTOM/plugins/z
fi

# Set Zsh as default shell if it's not already
if [[ $(echo $SHELL) != "/usr/bin/zsh" ]]; then
    chsh -s "$(which zsh)"
    echo "Zsh has been set as your default shell. Please log out and log back in for the changes to take effect."
else
    echo "Zsh is already your default shell."
fi

# Install additional tools
if ! command -v cht.sh &>/dev/null; then
    curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
fi

# Install git-delta and bottom
if [ "$OS" == "arch" ]; then
    $PKG_MANAGER git-delta bottom
elif [ "$OS" == "debian" ]; then
    if ! command -v delta &>/dev/null; then
        wget "https://github.com/dandavison/delta/releases/download/0.15.0/git-delta_0.15.0_amd64.deb" -O /tmp/git-delta.deb
        sudo dpkg -i /tmp/git-delta.deb
        rm /tmp/git-delta.deb
    fi
    if ! command -v btm &>/dev/null; then
        wget "https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb" -O /tmp/bottom.deb
        sudo dpkg -i /tmp/bottom.deb
        rm /tmp/bottom.deb
    fi
else
    echo -e "${RED}Unsupported operating system. Cannot install git-delta and bottom.${NC}"
fi

echo -e "${GREEN}Terminal-related packages installed successfully!${NC}"
