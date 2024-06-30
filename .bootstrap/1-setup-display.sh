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

# Install display-related packages
DISPLAY_PACKAGES="i3 dunst polybar picom feh udiskie maim rofi arandr"

for pkg in $DISPLAY_PACKAGES; do
    install_if_not_exists $pkg $pkg
done

if [ "$OS" == "arch" ]; then
    ARCH_DISPLAY_PACKAGES="base-devel meson libpam cairo fontconfig libxcb libev libx11 xcb-util-image xcb-util-xrm libxkbcommon-x11 libjpeg-turbo imagemagick xorg-xserver-utils xautolock xss-lock noto-fonts"
    $PKG_MANAGER $ARCH_DISPLAY_PACKAGES
elif [ "$OS" == "debian" ]; then
    DEBIAN_DISPLAY_PACKAGES="autoconf gcc make pkg-config meson libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev imagemagick x11-xserver-utils xautolock xss-lock fonts-noto"
    $PKG_MANAGER $DEBIAN_DISPLAY_PACKAGES
else
    echo -e "${RED}Unsupported operating system. Cannot install additional packages.${NC}"
fi

# Install additional tools
if ! command -v betterlockscreen &>/dev/null; then
    wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
    sudo systemctl enable betterlockscreen@$USER
fi

if ! command -v getnf &>/dev/null; then
    curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
    getnf -i Noto
fi

echo -e "${GREEN}Display-related packages installed successfully!${NC}"
