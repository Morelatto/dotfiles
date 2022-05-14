#!/usr/bin/zsh
bindkey -e
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Ctrl-Left]="${terminfo[kLFT5]}"
key[Ctrl-Right]="${terminfo[kRIT5]}"

# Autoload zsh modules
autoload -U up-line-or-beginning-search down-line-or-beginning-search edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# setup key accordingly
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"           beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"            end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"         overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"      backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"         delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"             up-line-or-beginning-search
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"           down-line-or-beginning-search
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"           backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"          forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"         beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"       end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"      reverse-menu-complete
# [[ -n "${key[Ctrl-Left]}"     ]] && bindkey -- "${key[Ctrl-Left]}"      backward-word
# [[ -n "${key[Ctrl-Right]}"    ]] && bindkey -- "${key[Ctrl-Right]}"     forward-word


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

export KEY_TAB='^I'
export KEY_CTRL_A='^A'
export KEY_CTRL_L='^L'
export KEY_CTRL_O='^O'
export KEY_CTRL_R='^R'
export KEY_CTRL_T='^T'
export KEY_CTRL_Y='^Y'
export KEY_CTRL_SPACE='^@'
export KEY_CTRL_DEL='^[OE'
export KEY_CTRL_BACKSPACE='^H'
export KEY_CTRL_RIGHT=';5C'
export KEY_CTRL_LEFT=';5D'
export KEY_CTRL_ENTER='^[M'
export KEY_ALT_F='æ'
export KEY_ALT_B='â'
export KEY_ALT_D='ä'

# -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# scrolls the screen up, in effect clearing it
zle -N widget::scroll-and-clear-screen
function widget::scroll-and-clear-screen() {
    printf "\n%.0s" {1..$LINES}
    zle clear-screen
}

# # opens current directory in ranger
# zle -N widget::rangercd
# function widget::rangercd () {
#     tmp="$(mktemp)"
#     ranger --choosedir="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }

#                       |  key sequence                   | command
# --------------------- | ------------------------------- | -------------
bindkey                     $KEY_CTRL_L                      widget::scroll-and-clear-screen
bindkey                     $KEY_CTRL_A                      _expand_alias
# bindkey                     $KEY_CTRL_O                      widget::rangercd
bindkey                     $KEY_CTRL_R                      histdb-fzf-widget
bindkey                     $KEY_CTRL_T                      fzf-completion
bindkey                     $KEY_TAB                         expand-or-complete
bindkey                     $KEY_CTRL_SPACE                  autosuggest-accept
bindkey                     $KEY_CTRL_ENTER                  autosuggest-execute
bindkey                     $KEY_CTRL_BACKSPACE              backward-kill-word
bindkey                     $KEY_CTRL_DEL                    kill-word
bindkey                     $KEY_CTRL_RIGHT                  forward-word
bindkey                     $KEY_CTRL_LEFT                   backward-word
bindkey                     $KEY_CTRL_Y                      yank


# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
# bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
# bindkey ' ' magic-space                               # [Space] - don't do history expansion


# # Edit the current command line in $EDITOR

# bindkey '\C-x\C-e' edit-command-line

# # file rename magick
# bindkey "^[m" copy-prev-shell-word

# # consider emacs keybindings:

# #bindkey -e  ## emacs key bindings
# #
# #bindkey '^[[A' up-line-or-search
# #bindkey '^[[B' down-line-or-search
# #bindkey '^[^[[C' emacs-forward-word
# #bindkey '^[^[[D' emacs-backward-word
# #
# #bindkey -s '^X^Z' '%-^M'
# #bindkey '^[e' expand-cmd-path
# #bindkey '^[^I' reverse-menu-complete
# #bindkey '^X^N' accept-and-infer-next-history
# #bindkey '^W' kill-region
# #bindkey '^I' complete-word
# ## Fix weird sequence that rxvt produces
# #bindkey -s '^[[Z' '\t'
# #
