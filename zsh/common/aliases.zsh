source "$ZALIASES/linux.zsh"
source "$ZALIASES/arch.zsh"
source "$ZALIASES/common.zsh"
source "$ZALIASES/global.zsh"

alias aee="$EDITOR $ZALIASES; source $ZCOMMON/aliases.zsh"
alias i3e="$EDITOR $XDG_CONFIG_HOME/i3/config; i3-msg reload"
alias xre="$EDITOR ~/.Xresources; xrdb -load ~/.Xresources"
alias zshe="$EDITOR $ZDOTDIR"
