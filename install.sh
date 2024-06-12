#!/bin/bash

set -e

INSTALL_DIR=$HOME/git/dotfiles
CONFIG_DIR=${XDG_CONFIG_HOME:=$HOME/.config}
CACHE_DIR=${XDG_CACHE_HOME:=$HOME/.cache}

X_CONFIG_DIR=$CONFIG_DIR/X11
I3_CONFIG_DIR=$CONFIG_DIR/i3
BETTERLOCKSCREEN_CONFIG_DIR=$CONFIG_DIR/betterlockscreen
POLYBAR_CONFIG_DIR=$CONFIG_DIR/polybar
DUNST_CONFIG_DIR=$CONFIG_DIR/dunst
PICOM_CONFIG_DIR=$CONFIG_DIR/picom
ZSH_CONFIG_DIR=$CONFIG_DIR/zsh
GIT_CONFIG_DIR=$INSTALL_DIR/git

clone_dotfiles_repository() {
    if [ ! -d "$INSTALL_DIR" ]; then
        git clone --recurse-submodules https://github.com/Morelatto/dotfiles $INSTALL_DIR
    fi
}

configure_zsh() {
    echo "Configuring Zsh with Oh My Zsh and plugins"

    sudo apt install -qq -y zsh git curl

    mkdir -p $ZSH_CONFIG_DIR $ZSH_CONFIG_DIR/common $ZSH_CONFIG_DIR/aliases $CACHE_DIR/zsh

    export ZSH="$ZSH_CONFIG_DIR/oh-my-zsh"

    if [ ! -d "$ZSH" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    ZSH_CUSTOM="$ZSH/custom"

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

    local -a src_dst_pairs=(
        "$INSTALL_DIR/zsh/zshenv:$HOME/.zshenv"
        "$INSTALL_DIR/zsh/zprofile:$ZSH_CONFIG_DIR/.zprofile"
        "$INSTALL_DIR/zsh/zshrc:$ZSH_CONFIG_DIR/.zshrc"
    )

    for pair in "${src_dst_pairs[@]}"; do
        IFS=":" read -r src dst <<< "$pair"
        ln -sf "$src" "$dst"
    done

    declare -A dirs=(
        ["$INSTALL_DIR/zsh/aliases/"]="$ZSH_CONFIG_DIR/aliases/"
        ["$INSTALL_DIR/zsh/common/"]="$ZSH_CONFIG_DIR/common/"
    )

    for dir in "${!dirs[@]}"; do
        for file in "$dir"*.zsh; do
            ln -sf "$file" "${dirs[$dir]}$(basename "$file")"
        done
    done

    if [[ $(echo $SHELL) != "/usr/bin/zsh" ]]; then
        chsh -s "$(which zsh)"
        echo "Zsh has been set as your default shell. Please log out and log back in for the changes to take effect."
    else
        echo "Zsh is already your default shell."
    fi
}

configure_wm() {
    echo "Configuring Window Manager and related apps"

    # i3 setup
    if ! command -v i3 &>/dev/null; then
        echo "Installing i3-gaps"
        sudo apt install -qq -y autoconf gcc make pkg-config meson
        mkdir -p /tmp/build
        cd /tmp/build
        git clone https://www.github.com/Airblader/i3 i3-gaps
        cd i3-gaps
        git checkout gaps && git pull

        meson -Ddocs=true -Dmans=true ../build
        meson compile -C ../build
        sudo meson install -C ../build

        cd "$HOME"
    fi

    if ! command -v i3lock &>/dev/null; then
        echo "Installing i3lock-color"
        sudo apt install -qq -y \
            autoconf gcc make pkg-config libpam0g-dev libcairo2-dev \
            libfontconfig1-dev libxcb-composite0-dev libev-dev \
            libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev \
            libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev \
            libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev \
            libjpeg-dev
        cd $INSTALL_DIR/i3/lockscreen/i3lock-color
        ./install-i3lock-color.sh
        cd "$HOME"
    fi

    # X11 setup
    mkdir -p $X_CONFIG_DIR
    ln -sf $INSTALL_DIR/X11/xprofile $HOME/.xprofile
    ln -sf $INSTALL_DIR/X11/screenlayout.sh $X_CONFIG_DIR/.screenlayout.sh
    ln -sf $INSTALL_DIR/X11/fehbg $X_CONFIG_DIR/.fehbg
    ln -sf $INSTALL_DIR/X11/xinitrc $HOME/.xinitrc
    sudo ln -sf $INSTALL_DIR/X11/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf

    # i3 setup
    mkdir -p $I3_CONFIG_DIR
    ln -sf $INSTALL_DIR/i3/config $I3_CONFIG_DIR

    # Dunst setup
    sudo apt install -qq -y dunst
    mkdir -p $DUNST_CONFIG_DIR
    ln -sf $INSTALL_DIR/dunst/dunstrc $DUNST_CONFIG_DIR

    # Polybar setup
    sudo apt install -qq -y polybar
    mkdir -p $POLYBAR_CONFIG_DIR
    ln -sf $INSTALL_DIR/polybar/launch.sh $POLYBAR_CONFIG_DIR
    ln -sf $INSTALL_DIR/polybar/config.ini $POLYBAR_CONFIG_DIR
    ln -sf $INSTALL_DIR/polybar/my_modules.ini $POLYBAR_CONFIG_DIR

    # Betterlockscreen setup
    if ! command -v betterlockscreen &>/dev/null; then
        echo "Installing betterlockscreen"
        sudo apt install -qq -y imagemagick x11-xserver-utils xautolock xss-lock
        wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
        mkdir -p $BETTERLOCKSCREEN_CONFIG_DIR
        mkdir -p $HOME/Pictures/Wallpapers/Lockscreen
        ln -sf $INSTALL_DIR/i3/lockscreen/betterlockscreenrc $BETTERLOCKSCREEN_CONFIG_DIR
        sudo ln -sf $INSTALL_DIR/i3/lockscreen/lock /usr/local/bin/lock
        sudo systemctl enable betterlockscreen@$USER
    fi

    # Picom setup
    sudo apt install -qq -y picom
    mkdir -p $PICOM_CONFIG_DIR
    ln -sf $INSTALL_DIR/picom/picom.conf $PICOM_CONFIG_DIR

    # Related apps
    sudo apt install -qq -y fonts-noto feh udiskie
}

configure_git() {
    echo "Configuring Git with dotfiles"

    sudo apt install -qq -y git

    if [ -d "$GIT_CONFIG_DIR" ]; then
        if [ -f "$GIT_CONFIG_DIR/gitconfig" ]; then
            ln -sf $GIT_CONFIG_DIR/gitconfig $HOME/.gitconfig
        fi

        if [ -f "$GIT_CONFIG_DIR/gitignore" ]; then
            git config --global core.excludesfile $GIT_CONFIG_DIR/gitignore
        fi
    fi
}

install_additional_packages() {
    echo "Installing additional custom packages and configurations"

    sudo apt install -qq -y fd-find bat tree exa ripgrep httpie xclip xdotool unzip wget maim

    sudo ln -sf $INSTALL_DIR/scripts/sct.sh /usr/local/bin/sct

    if ! command -v betterlockscreen &>/dev/null; then
        echo "Installing betterlockscreen"
        wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
        sudo systemctl enable betterlockscreen@$USER
    fi

    if ! command -v cht.sh &>/dev/null; then
        echo "Installing cht.sh"
        curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
    fi

    if ! command -v getnf &>/dev/null; then
      echo "Installing getnf"
      curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
      getnf -i Noto
    fi

    if ! command -v delta &>/dev/null; then
        echo "Downloading and installing git-delta .deb package"
        wget "https://github.com/dandavison/delta/releases/download/0.15.0/git-delta_0.15.0_amd64.deb" -O /tmp/git-delta.deb
        sudo dpkg -i /tmp/git-delta.deb
        rm /tmp/git-delta.deb
    fi

    if ! command -v btm &>/dev/null; then
        echo "Installing bottom"
        wget "https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb" -O /tmp/bottom.deb
        sudo dpkg -i /tmp/bottom.deb
        rm /tmp/bottom.deb
    fi
}

main() {
    clone_dotfiles_repository
    sudo apt update -qq
    configure_zsh
    configure_wm
    configure_git
    install_additional_packages
}

main
