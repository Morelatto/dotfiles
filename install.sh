#!/bin/bash

INSTALL_DIR=$HOME/git/dotfiles
CONFIG_DIR=$HOME/.config
CACHE_DIR=$HOME/.cache

ZDOTDIR=$CONFIG_DIR/zsh
ZCACHE=$CACHE_DIR/zsh
I3_CONFIG_DIR=$CONFIG_DIR/i3
I3_BLOCKS_CONFIG_DIR=$CONFIG_DIR/i3blocks
POLYBAR_CONFIG_DIR=$CONFIG_DIR/polybar
DUNST_CONFIG_DIR=$CONFIG_DIR/dunst
BETTERLOCKSCREEN_CONFIG_DIR=$CONFIG_DIR/betterlockscreen
X_CONFIG_DIR=$CONFIG_DIR/X11
X_CONF_D_CONFIG_DIR=/etc/X11/xorg.conf.d/
POLYBAR_CONFIG_DIR=$CONFIG_DIR/polybar


zsh_setup() {
    clone_dotfiles_repository
    create_zsh_directories
    create_zsh_symlinks
    install_additional_zsh_packages
    set_default_shell
}

git_setup() {
    install_additional_zsh_packages
}

i3_setup() {
    clone_dotfiles_repository
    create_i3_directories
    create_i3_symlinks
    install_additional_i3_packages
}

x_setup() {
    clone_dotfiles_repository
    create_x_directories
    create_x_symlinks
    install_additional_x_packages
}

polybar_setup() {
    clone_dotfiles_repository
    # TODO add polybar dependecies
    mkdir -p $POLYBAR_CONFIG_DIR
    cp $INSTALL_DIR/polybar/polybar-themes/simple/grayblocks
    ln -sf $INSTALL_DIR/polybar/launch.sh $POLYBAR_CONFIG_DIR/launch.sh
}

clone_dotfiles_repository() {
    if [ ! -d "$INSTALL_DIR" ]; then
        git clone --recurse-submodules https://github.com/Morelatto/dotfiles $INSTALL_DIR
    fi
}

create_zsh_directories() {
    confirm_and_remove_files $ZDOTDIR $ZCACHE
    mkdir -p $ZDOTDIR/common $ZDOTDIR/aliases $ZCACHE
}

create_i3_directories() {
    confirm_and_remove_files $I3_CONFIG_DIR $I3_BLOCKS_CONFIG_DIR $POLYBAR_CONFIG_DIR $DUNST_CONFIG_DIR $BETTERLOCKSCREEN_CONFIG_DIR
    mkdir -p $I3_CONFIG_DIR $I3_BLOCKS_CONFIG_DIR $POLYBAR_CONFIG_DIR $DUNST_CONFIG_DIR $BETTERLOCKSCREEN_CONFIG_DIR
}

create_x_directories() {
    confirm_and_remove_files $X_CONFIG_DIR
    mkdir -p $X_CONFIG_DIR
    sudo mkdir -p $X_CONF_D_CONFIG_DIR
}

create_zsh_symlinks() {
    ln -sf $INSTALL_DIR/zsh/zshenv $HOME/.zshenv
    ln -sf $INSTALL_DIR/zsh/zprofile $ZDOTDIR/.zprofile
    ln -sf $INSTALL_DIR/zsh/zshrc $ZDOTDIR/.zshrc

    declare -A dirs=(
        ["$INSTALL_DIR/zsh/aliases/"]="$ZDOTDIR/aliases/"
        ["$INSTALL_DIR/zsh/common/"]="$ZDOTDIR/common/"
    )

    for dir in "${!dirs[@]}"; do
        for file in "$dir"*.zsh; do
            ln -sf $file "${dirs[$dir]}$(basename $file)"
        done
    done
}

create_i3_symlinks() {
    ln -sf $INSTALL_DIR/i3/config $I3_CONFIG_DIR/config
    ln -sf $INSTALL_DIR/i3blocks/i3blocks.config $I3_BLOCKS_CONFIG_DIR/config
    ln -sf $INSTALL_DIR/polybar/launch.sh $POLYBAR_CONFIG_DIR/launch.sh
    ln -sf $INSTALL_DIR/dunst/dunstrc $DUNST_CONFIG_DIR/dunstrc
    sudo ln -sf $INSTALL_DIR/i3/lockscreen/lock /usr/local/bin/lock
    ln -sf $INSTALL_DIR/i3/lockscreen/betterlockscreenrc $BETTERLOCKSCREEN_CONFIG_DIR
    sudo ln -sf $INSTALL_DIR/scripts/sct.sh /usr/local/bin/sct
}

create_x_symlinks() {
    ln -sf $INSTALL_DIR/X11/xprofile $CONFIG_DIR/.xprofile
    ln -sf $INSTALL_DIR/X11/screenlayout.sh $CONFIG_DIR/.screenlayout.sh
    ln -sf $INSTALL_DIR/X11/fehbg $CONFIG_DIR/.fehbg
    ln -sf $INSTALL_DIR/X11/xinitrc ~/.xinitrc
    sudo ln -sf $INSTALL_DIR/X11/10-monitor.conf $X_CONFIG_DIR/
}

install_additional_zsh_packages() {
    echo "Installing additional packages for zsh"
    sudo apt update -qq && sudo apt install -qq -y zsh git curl fd-find bat tree exa
    install_cht_sh
    install_vivid
}

install_additional_i3_packages() {
    echo "Installing additional packages for i3"
    # TODO add picom dependencies
    sudo apt update -qq && sudo apt install -qq -y i3 i3blocks dunst rofi xautolock polybar fonts-inconsolata maim
    git clone https://github.com/vivien/i3blocks-contrib $I3_BLOCKS_CONFIG_DIR
    install_paper_icons
    install_lockscreen_dependencies
}

install_additional_x_packages() {
    echo "Installing additional packages for X"
    sudo apt update -qq && sudo apt install -qq -y feh
}

install_cht_sh() {
    if [ ! command -v cht.sh &>/dev/null ]; then
        echo "Installing cht.sh"
        curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
    fi
}

install_paper_icons() {
    sudo add-apt-repository -u ppa:snwh/ppa
    sudo apt install paper-icon-theme
}

install_lockscreen_dependencies() {
    directory=$DOTDIR/i3/lockscreen/i3lock-color
    if [ -d "$directory" ] && [ "$(ls -A "$directory")" ]; then
        cd $directory
        ./install-i3lock-color.sh
    fi

    directory=$DOTDIR/i3/lockscreen/betterlockscreen
    if [ -d "$directory" ] && [ "$(ls -A "$directory")" ]; then
        cd $directory
        chmod u+x betterlockscreen
        sudo cp betterlockscreen /usr/local/bin/
        sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
        sudo systemctl enable betterlockscreen@$USER 
    fi
}

set_default_shell() {
    if [[ $(echo $SHELL) != "/usr/bin/zsh" ]]; then
        read -p "Do you want to set Zsh as your default shell? (y/n): " answer
        if [[ $answer =~ ^[Yy]$ ]]; then
            chsh -s $(which zsh)
            echo "Zsh has been set as your default shell."
            echo "Please log out and log back in for the changes to take effect."
        fi
    else
        echo "Zsh is already your default shell."
    fi
}

confirm_and_remove_files() {
    for file_path in "$@"; do
        read -p "Are you sure you want to remove the file '$file_path'? (y/n): " response
        if [[ $response =~ ^[Yy]$ ]]; then
            rm -rf "$file_path"
            echo "File '$file_path' removed."
        else
            echo "Skipping file '$file_path'."
        fi
    done
}

main() {
    case "$1" in
        ''|-h|--help)
            usage
            exit 0
            ;;
        -z)
            zsh_setup
            ;;
        -g)
            git_setup
            ;;
        -i)
            i3_setup
            ;;
        -x)
            x_setup
            ;;
        *)
            echo "Command not found" >&2
            exit 1
    esac
}

main "$@"
