typeset -ga asources
asources+="$ZALIASES/common.zsh"
asources+="$ZALIASES/arch.zsh"

foreach file (`echo $asources`)
    if [[ -a $file ]]; then
        source $file
    fi
end
