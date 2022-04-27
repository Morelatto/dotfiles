# [Ctrl-Backspace] - delete whole backward-word
bindkey '^H' backward-kill-word

# [Ctrl-Space] - accept the current suggestion
bindkey '^ ' autosuggest-accept

# [Tab] - https://zsh.sourceforge.io/FAQ/zshfaq04.html#l52
#bindkey '^I' expand-or-complete-prefix
#bindkey '\CI' expand-or-complete
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
# [Ctrl-R] - hstr
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
bindkey '^A' _expand_alias
bindkey '^Z' accept-and-hold
bindkey -s '\M-/' \\\\
bindkey -s '\M-=' \|

# ctrl l = clear
# ctrl z
# ctrl c
# ctrl v copy-prev-shell-word
# ctrl r = hstr
# ctrl shift r
# tab = completion
# ctrl space = accept autosuggest
# ctrl backspace = kill word
