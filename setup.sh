DOTFILES_DIR=$(dirname $(realpath -s $0))

# TODO add submodule init

mkdir -p $HOME/Pictures/Wallpapers/
ln -s ${DOTFILES_DIR}/X11/xinitrc $HOME/.xinitrc
ln -s ${DOTFILES_DIR}/X11/fehbg $HOME/.fehbg
# ln -s ${DOTFILES_DIR}/X11/screenlayout-h.sh $HOME/.screenlayout

ZSH_CONFIG_DIR=$HOME/.config/zsh
mkdir -p ${ZSH_CONFIG_DIR}/aliases
mkdir -p ${ZSH_CONFIG_DIR}/functions

ln -s ${DOTFILES_DIR}/zsh/zshenv $HOME/.zshenv
echo "export ANTIGEN_PATH=\"$DOTFILES_DIR/zsh/antigen\"" >> $HOME/.zshenv

ln -s ${DOTFILES_DIR}/zsh/zshrc ${ZSH_CONFIG_DIR}/.zshrc
ln -s ${DOTFILES_DIR}/zsh/zlogin ${ZSH_CONFIG_DIR}/.zlogin
ln -s ${DOTFILES_DIR}/zsh/antigenrc ${ZSH_CONFIG_DIR}/.antigenrc
ln -s ${DOTFILES_DIR}/zsh/aliases/aliases.zsh ${ZSH_CONFIG_DIR}/aliases/aliases.zsh
ln -s ${DOTFILES_DIR}/zsh/aliases/common.zsh ${ZSH_CONFIG_DIR}/aliases/common.zsh
ln -s ${DOTFILES_DIR}/zsh/functions/functions.zsh ${ZSH_CONFIG_DIR}/functions/functions.zsh
ln -s ${DOTFILES_DIR}/zsh/functions/expand-aliases.zsh.zsh ${ZSH_CONFIG_DIR}/functions/expand-aliases.zsh.zsh
ln -s ${DOTFILES_DIR}/zsh/functions/history-search-end.zsh ${ZSH_CONFIG_DIR}/functions/history-search-end.zsh
ln -s ${DOTFILES_DIR}/zsh/functions/time-functions.zsh.zsh ${ZSH_CONFIG_DIR}/functions/time-functions.zsh.zsh

I3_CONFIG_DIR=$HOME/.config/i3
ln -s ${DOTFILES_DIR}/i3/config ${I3_CONFIG_DIR}/config
# TODO clone i3blocks-contrib and move to /usr/share/i3blocks/
ln -s ${DOTFILES_DIR}/i3/i3blocks.conf ${I3_CONFIG_DIR}/i3blocks.conf
# TODO install scrot and corrupter?
ln -s ${DOTFILES_DIR}/i3/lock.sh ${I3_CONFIG_DIR}/lock

URXVT_CONFIG_DIR=$HOME/.config/urxvt
ln -s ${DOTFILES_DIR}/urxvt/base16-classic-dark-256.Xresources ${URXVT_CONFIG_DIR}/base16-classic-dark-256.Xresources
ln -s ${DOTFILES_DIR}/urxvt/urxvt-font-size/font-size ${URXVT_CONFIG_DIR}/font-size
ln -s ${DOTFILES_DIR}/urxvt/urxvt-perls/keyboard-select ${URXVT_CONFIG_DIR}/keyboard-select
ln -s ${DOTFILES_DIR}/urxvt/urxvt-perls/deprecated/url-select ${URXVT_CONFIG_DIR}/url-select
ln -s ${DOTFILES_DIR}/urxvt/Xresources $HOME/.Xresources

# TODO vim setup

git config --global core.excludesfile ${DOTFILES_DIR}/misc/gitignore_global

pip install speedtest-cli --user

# TODO install ripgrep and bat
