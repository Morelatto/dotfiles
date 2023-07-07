#!/usr/bin/zsh

# junegunn/fzf,async                          \
# Aloxaf/fzf-tab,async                        \
# m42e/zsh-histdb-skim,async                  \
# larkery/zsh-histdb,async                    \
# m42e/zsh-histdb-fzf,async                   \
# popstas/zsh-command-time,async              \
# MichaelAquilina/zsh-you-should-use,async    \
# mdumitru/fancy-ctrl-z,async                 \

# https://github.com/ellie/atuin
eval "$(atuin init zsh)"

if [[ ! -f $ZFUNCTIONS/zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/wting/autojump $ZFUNCTIONS
fi
source $ZFUNCTIONS/autojump/autojump.zsh

# https://github.com/zsh-users/zsh-history-substring-search
if [[ ! -f $ZFUNCTIONS/zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zsh-users/zsh-history-substring-search $ZFUNCTIONS
fi
source $ZFUNCTIONS/zsh-history-substring-search/zsh-history-substring-search.zsh

# https://github.com/zsh-users/zsh-completions
#if [[ ! -f $ZFUNCTIONS/zpm/zpm.zsh ]]; then
#  git clone --recursive https://github.com/zsh-users/zsh-completions $ZFUNCTIONS
#fi
#source $ZFUNCTIONS/zsh-history-substring-search/zsh-history-substring-search.zsh

#zpm load                                        \
#    zsh-users/zsh-completions,async             \
#    zpm-zsh/zsh-autosuggestions,async           \
#    zpm-zsh/fast-syntax-highlighting,async      \
#    zpm-zsh/history-search-multi-word,async     \
#    romkatv/powerlevel10k,async

