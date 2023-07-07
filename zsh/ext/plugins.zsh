#!/usr/bin/zsh
# --------------
# Plugin sources
# --------------

# https://github.com/zpm-zsh/zpm

source $ZFUNCTIONS/zpm.zsh

# https://github.com/m42e/zsh-histdb-skim

export HISTDB_SKIM_PATH=${HOME}/.local/share/zsh-histdb-skim

# https://github.com/popstas/zsh-command-time

export ZSH_COMMAND_TIME_MIN_SECONDS=10

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s"
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s"
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s"
            else
                timer_show="$fg[red]$min min. $sec s"
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}

# https://github.com/zsh-users/zsh-autosuggestions

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=42
ZSH_AUTOSUGGEST_USE_ASYNC='true'

_zsh_autosuggest_strategy_atuin_top() {
    suggestion=$(atuin search --cmd-only --limit 1 --search-mode prefix $1)
}

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="
        SELECT commands.argv
        FROM history
        LEFT JOIN commands ON history.command_id = commands.rowid
        LEFT JOIN places ON history.place_id = places.rowid
        WHERE commands.argv LIKE '$(sql_escape $1)%'
        AND places.dir = '$(sql_escape $PWD)'
        GROUP BY commands.argv
        ORDER BY count(*) DESC
        LIMIT 1
    "
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=atuin_top

# https://github.com/wting/autojump

source /usr/share/autojump/autojump.sh

# https://github.com/romkatv/powerlevel10k

export POWERLEVEL9K_INSTALLATION_DIR=$ZFUNCTIONS/zpm/plugins/romkatv---powerlevel10k
