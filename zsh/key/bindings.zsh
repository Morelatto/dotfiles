# [Ctrl-Backspace] - delete whole backward-word
bindkey '^H' backward-kill-word

# [Ctrl-Space] - accept the current suggestion
bindkey '^ ' autosuggest-accept

# [Tab] - https://zsh.sourceforge.io/FAQ/zshfaq04.html#l52
bindkey '^I' expand-or-complete-prefix
#bindkey '\CI' expand-or-complete

# [Ctrl-R] - hstr
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# ctrl l = clear
# ctrl z
# ctrl c
# ctrl v copy-prev-shell-word
# ctrl r = hstr
# ctrl shift r
# tab = completion
# ctrl space = accept autosuggest
# ctrl backspace = kill word
