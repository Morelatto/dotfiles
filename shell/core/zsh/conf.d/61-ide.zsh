#\!/usr/bin/env zsh
# IDE Tools - PyCharm, Repomix, Project Cleanup

# PyCharm
if (( $+commands[pycharm] )); then
    alias pyc='pycharm'
    alias pycc='rm -rf ~/.cache/JetBrains/PyCharmCE*/caches'
    alias pycsize='du -sh ~/.cache/JetBrains/PyCharmCE*/'

    # Check PyCharm memory usage
    pymem() {
        local pycharm_processes=$(ps aux | awk '/[Pp]y[Cc]harm/ && !/awk/ {print}')

        if [[ -z "$pycharm_processes" ]]; then
            echo "PyCharm not running"
            return 1
        fi

        echo "$pycharm_processes" | awk '{
            mem_gb = $6/1024/1024
            cpu_pct = $4
            printf "PyCharm PID %s: %.1f GB RAM (%.1f%% CPU)\n", $2, mem_gb, cpu_pct
        }'
    }
fi

# =============================================================================
# IDE Project Cleanup
# =============================================================================
noidea() {
    find . -type d -name '.idea' -exec rm -rf {} +
}

noeclipse() {
    find . -name '*.settings' -o -name '*.classpath' -o -name '*.factorypath' -o -name '*.project' | xargs rm -rf
}
