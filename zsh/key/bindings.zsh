
# [Tab] - https://zsh.sourceforge.io/FAQ/zshfaq04.html#l52
#bindkey '^I' expand-or-complete-prefix
#bindkey '\CI' expand-or-complete
 # complete on tab, leave expansion to _expand

# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
bindkey '^Z' accept-and-hold
bindkey -s '\M-/' \\\\
bindkey -s '\M-=' \|

# Shortcuts
bindkey '^ ' autosuggest-accept
bindkey '^A' _expand_alias
bindkey -s "^L" clear-screen
bindkey -s '^O' rangercd
#bindkey -s '^R' hstr
bindkey -s "\C-r" "\C-a hstr -- \C-j"
bindkey -s "^T" fzf-file-widget


bindkey '^H' backward-kill-word
bindkey '^I' complete-word
#bindkey '^Y' yank

# ctrl l = clear
# ctrl z
# ctrl c
# ctrl v copy-prev-shell-word
# ctrl r = hstr
# ctrl shift r
# tab = completion
# ctrl space = accept autosuggest
# ctrl backspace = kill word
# ctrl o = rangercd

# Completions binds
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history