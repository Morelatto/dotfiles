#!/bin/bash

INSTALL_DIR=$HOME/git/dotfiles
ZDOTDIR=$HOME/.config/zsh
ZCACHE=$HOME/.cache/zsh

zsh_setup() {
    clone_dotfiles_repository
    create_directories
    create_symlinks
    install_additional_packages
    set_default_shell
}

git_setup() {
    install_additional_packages
}

clone_dotfiles_repository() {
    if [ ! -d "$INSTALL_DIR" ]; then
        git clone https://github.com/Morelatto/dotfiles $INSTALL_DIR
    fi
}


create_directories() {
    confirm_and_remove_files $ZDOTDIR $ZCACHE
    mkdir -p $ZDOTDIR/common $ZDOTDIR/aliases $ZCACHE
}

create_symlinks() {
    ln -sf $INSTALL_DIR/zsh/zshenv $HOME/.zshenv
    ln -sf $INSTALL_DIR/zsh/zprofile $ZDOTDIR/.zprofile
    ln -sf $INSTALL_DIR/zsh/zshrc $ZDOTDIR/.zshrc

    declare -A dirs=(
        ["$INSTALL_DIR/zsh/aliases/"]="$ZDOTDIR/aliases/"
        ["$INSTALL_DIR/zsh/common/"]="$ZDOTDIR/common/"
    #    ["$INSTALL_DIR/zsh/ext/"]="$ZDOTDIR/ext/"
    )

    for dir in "${!dirs[@]}"; do
        for file in "$dir"*.zsh; do
            ln -sf $file "${dirs[$dir]}$(basename $file)"
        done
    done
}


install_additional_packages() {
    echo "Installing additional packages"
    sudo apt update -qq && sudo apt install -qq -y zsh git curl fd-find bat tree exa
    install_cht_sh
    install_vivid
}

install_cht_sh() {
    if [ ! command -v cht.sh &>/dev/null ]; then
        echo "Installing cht.sh"
        curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
    fi
}

install_vivid() {
    local version=0.9.0
    local ark=arm64

    if ! command -v vivid &>/dev/null; then
        echo "Installing vivid"
        wget "https://github.com/sharkdp/vivid/releases/download/v${version}/vivid_${version}_${ark}.deb"
        sudo dpkg -i "vivid_${version}_${ark}.deb"
    fi
}
set_default_shell() {
    read -p "Do you want to set Zsh as your default shell? (y/n): " answer
    if [[ $answer =~ ^[Yy]$ ]]; then
        chsh -s $(which zsh)
        echo "Zsh has been set as your default shell."
        echo "Please log out and log back in for the changes to take effect."
    fi
}

confirm_and_remove_files() {
    for file_path in "$@"; do
        read -p "Are you sure you want to remove the file '$file_path'? (y/n): " response
        if [[ $response =~ ^[Yy]$ ]]; then
            rm "$file_path"
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
        *)
            echo "Command not found" >&2
            exit 1
    esac
}

main "$@"

