DOTFILES_DIR=$(dirname $(realpath -s $0))

# sudo ln -sf ${DOTFILES_DIR}/misc/pacman.conf /etc/pacman.conf
# sudo pacman -S yay

# X11
# sudo pacman -S xorg feh
mkdir -p $HOME/Pictures/Wallpapers/
ln -s ${DOTFILES_DIR}/X11/xinitrc $HOME/.xinitrc
sudo ln -s ${DOTFILES_DIR}/X11/10-monitor.conf /etc/X11/xorg.conf.d/
ln -s ${DOTFILES_DIR}/X11/fehbg $HOME/.fehbg
# ln -s ${DOTFILES_DIR}/X11/screenlayout-h.sh $HOME/.screenlayout

# Zsh
# sudo pacman -S zsh autojump
# sudo yay -S antigen-git
# sudo pip install --local thefuck
ZSH_CONFIG_DIR=$HOME/.config/zsh
mkdir -p ${ZSH_CONFIG_DIR}/aliases
mkdir -p ${ZSH_CONFIG_DIR}/functions

ln -s ${DOTFILES_DIR}/zsh/zshenv $HOME/.zshenv
ln -s ${DOTFILES_DIR}/zsh/zshrc ${ZSH_CONFIG_DIR}/.zshrc
ln -s ${DOTFILES_DIR}/zsh/zlogin ${ZSH_CONFIG_DIR}/.zlogin
ln -s ${DOTFILES_DIR}/zsh/antigenrc ${ZSH_CONFIG_DIR}/.antigenrc
ln -s ${DOTFILES_DIR}/zsh/*.zsh ${ZSH_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/zsh/aliases/*.zsh ${ZSH_CONFIG_DIR}/aliases/
ln -s ${DOTFILES_DIR}/zsh/functions/*.zsh ${ZSH_CONFIG_DIR}/functions/

# i3
# sudo pacman i3-gaps rofi bc lm-sensors scrot sysstat alsa-utils playerctl openvpn
# sudo yay -S i3blocks-gaps-git corrupter-git
I3_CONFIG_DIR=$HOME/.config/i3
I3_BLOCKS_DIR=/usr/lib/i3blocks
ln -s ${DOTFILES_DIR}/i3/config ${I3_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/i3/i3blocks.conf ${I3_CONFIG_DIR}/
ln -s ${DOTFILES_DIR}/i3/lock.sh ${I3_CONFIG_DIR}/
# TODO for each folder in i3blocks-contrib ln -sf
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/bandwith/bandwith ${I3_BLOCKS_DIR}/bandwith
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/cpu_usage/cpu_usage ${I3_BLOCKS_DIR}/cpu_usage
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/disk/disk ${I3_BLOCKS_DIR}/disk
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/disk-io/disk-io ${I3_BLOCKS_DIR}/disk-io
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/iface/iface ${I3_BLOCKS_DIR}/iface
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/load_average/load_average ${I3_BLOCKS_DIR}/load_average
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/mediaplayer/mediaplayer ${I3_BLOCKS_DIR}/mediaplayer
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/memory/memory ${I3_BLOCKS_DIR}/memory
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/openvpn/openvpn ${I3_BLOCKS_DIR}/openvpn
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/temperature/temperature ${I3_BLOCKS_DIR}/temperature
ln -sf ${DOTFILES_DIR}/i3/i3blocks-contrib/volume/volume ${I3_BLOCKS_DIR}/volume

# Urxvt
# sudo yay -S rxvt-unicode-pixbuf
# PKGBUILD: add --enable-wide-glyphs to ./configure options
# sudo pacman -S urxvt-perls 
URXVT_CONFIG_DIR=$HOME/.config/urxvt
ln -s ${DOTFILES_DIR}/urxvt/Xresources $HOME/.Xresources
ln -s ${DOTFILES_DIR}/urxvt/base16-classic-dark-256.Xresources ${URXVT_CONFIG_DIR}/

# Vim
# sudo yay -S vundle-git vim-command-t vim-python-mode-git 
ln -s ${DOTFILES_DIR}/vim/vimrc $HOME/.vimrc

# Ranger
# sudo pacman -S ranger
RANGER_CONFIG_DIR=$HOME/.config/ranger
mkdir -p $RANGER_CONFIG_DIR 
mkdir -p $HOME/.cache/ranger
ln -s ${DOTFILES_DIR}/ranger/rc.conf $RANGER_CONFIG_DIR/
ln -s ${DOTFILES_DIR}/ranger/scope.sh $RANGER_CONFIG_DIR/

# Misc
# sudo pacman -S ripgrep bat
# sudo yay -S speedtest-cli-git
git config --global core.excludesfile ${DOTFILES_DIR}/misc/gitignore_global

