#!/usr/bin/zsh

bindkey -e

# Create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

# Define keys using terminfo capabilities
key=(
    Home="${terminfo[khome]}"
    End="${terminfo[kend]}"
    Insert="${terminfo[kich1]}"
    Backspace="${terminfo[kbs]}"
    Delete="${terminfo[kdch1]}"
    Up="${terminfo[kcuu1]}"
    Down="${terminfo[kcud1]}"
    Left="${terminfo[kcub1]}"
    Right="${terminfo[kcuf1]}"
    PageUp="${terminfo[kpp]}"
    PageDown="${terminfo[knp]}"
    Shift-Tab="${terminfo[kcbt]}"
    Ctrl-Left="${terminfo[kLFT5]}"
    Ctrl-Right="${terminfo[kRIT5]}"
)

declare -A bindings=(
    ["${key[Home]}"]="beginning-of-line"
    ["${key[End]}"]="end-of-line"
    ["${key[Insert]}"]="overwrite-mode"
    ["${key[Backspace]}"]="backward-delete-char"
    ["${key[Delete]}"]="delete-char"
    ["${key[Up]}"]="up-line-or-beginning-search"
    ["${key[Down]}"]="down-line-or-beginning-search"
    ["${key[Left]}"]="backward-char"
    ["${key[Right]}"]="forward-char"
    ["${key[PageUp]}"]="beginning-of-buffer-or-history"
    ["${key[PageDown]}"]="end-of-buffer-or-history"
    ["${key[Shift-Tab]}"]="reverse-menu-complete"
    ["${key[Ctrl-Left]}"]="backward-word"
    ["${key[Ctrl-Right]}"]="forward-word"
)

# Iterate over the keys and values in the associative array
for k in ${(k)bindings}; do
    # Check if the key is non-empty
    [[ -n $k ]] && bindkey -- "$k" "${bindings[$k]}"
done

# Set up all the autoloads
autoload -U up-line-or-beginning-search down-line-or-beginning-search edit-command-line

# Define the widgets and their behavior
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line
zle -N widget::scroll-and-clear-screen
zle -N widget::rangercd
# zle -N histdb-fzf-widget
# zle -N history-search-multi-word

# Scrolls the screen up, in effect clearing it
zle -N widget::scroll-and-clear-screen
function widget::scroll-and-clear-screen() {
    printf "\n%.0s" {1..$LINES}
    zle clear-screen
}

# Opens current directory in ranger
zle -N widget::rangercd
function widget::rangercd () {
 tmp="$(mktemp)"
 ranger --choosedir="$tmp" "$@"
 if [ -f "$tmp" ]; then
     dir="$(cat "$tmp")"
     rm -f "$tmp"
     [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
 fi
}

#bindkey '^R'         _atuin_search_widget
#bindkey '^[r'        _atuin_fzf  # Using fzf interactively
#bindkey '^[^R'       histdb-fzf-widget
#bindkey '^@'          _expand_alias
bindkey ';5D'         backward-word
bindkey ';5C'         forward-word
bindkey '^H'         backward-kill-word
# bindkey                     ${KEY[CTRL_L]}           widget::scroll-and-clear-screen
# bindkey                     ${KEY[CTRL_A]}           _expand_alias
# bindkey                     ${KEY[CTRL_O]}           widget::rangercd
# bindkey                     ${KEY[CTRL_T]}           fzf-completion
# bindkey                     ${KEY[TAB]}              expand-or-complete
# bindkey                     ${KEY[CTRL_SPACE]}       autosuggest-accept
# bindkey                     ${KEY[CTRL_Y]}           yank

# Load zsh complist module to enable advanced menu completion features.
zmodload -i zsh/complist

# Use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
# bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
# bindkey ' ' magic-space                               # [Space] - don't do history expansion
# # Edit the current command line in $EDITOR
# bindkey '\C-x\C-e' edit-command-line
# # file rename magick
# bindkey "^[m" copy-prev-shell-word
# #bindkey '^[[A' up-line-or-search
# #bindkey '^[[B' down-line-or-search
# #bindkey '^[^[[C' emacs-forward-word
# #bindkey '^[^[[D' emacs-backward-word
# #bindkey -s '^X^Z' '%-^M'
# #bindkey '^[e' expand-cmd-path
# #bindkey '^[^I' reverse-menu-complete
# #bindkey '^X^N' accept-and-infer-next-history
# #bindkey '^W' kill-region
# #bindkey '^I' complete-word
# ## Fix weird sequence that rxvt produces
# #bindkey -s '^[[Z' '\t'