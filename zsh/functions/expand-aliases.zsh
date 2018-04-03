globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}

zle -N globalias

bindkey -M emacs "^ " globalias
bindkey -M viins "^ " globalias
