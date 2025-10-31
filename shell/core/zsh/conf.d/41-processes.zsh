#!/usr/bin/env zsh
# Process Management - Viewing and controlling running processes

# =============================================================================
# Process Viewers
# =============================================================================
if (( $+commands[btop] )); then
    alias top='btop'
    alias htop='btop'
elif (( $+commands[htop] )); then
    alias top='htop'
fi

# =============================================================================
# Process Listing
# =============================================================================
alias ps='ps aux'
alias pstree='pstree -a'
alias psgrep='ps aux | grep -v grep | grep -i'
alias pscpu='ps aux --sort=-%cpu | head -20'
alias psmem='ps aux --sort=-%mem | head -20'

# =============================================================================
# Process Control
# =============================================================================
alias killall='killall -v'
if (( $+commands[fuser] )); then
    alias whoport='sudo fuser -v'
fi

# =============================================================================
# Interactive Process Killing with fzf
# =============================================================================
if (( $+commands[fzf] )); then
    # Custom kill completion using fzf
    _fzf_kill_completion() {
        setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
        local selected

        # Use a more comprehensive process listing that includes searchable command args
        selected=$(ps -eo pid,ppid,user,%cpu,%mem,comm,args --sort=-%cpu |
            awk 'NR==1 {next} {
                # Format: PID PPID USER %CPU %MEM COMM ARGS...
                # Create searchable line with key info
                cmd = $7; for(i=8; i<=NF; i++) cmd = cmd " " $i
                # Dynamic program name extraction
                prog = $6  # Start with comm field

                # Extract meaningful name from command path
                if (cmd ~ /\/[^\/\s]+/) {
                    # Extract basename from full path in command
                    split(cmd, cmd_parts, " ")
                    for (i in cmd_parts) {
                        if (cmd_parts[i] ~ /^\/.*\/[^\/]+$/) {
                            split(cmd_parts[i], path_parts, "/")
                            basename = path_parts[length(path_parts)]
                            # Clean up common suffixes
                            gsub(/\.(py|js|sh|rb|pl|jar|exe)$/, "", basename)
                            gsub(/-bin$/, "", basename)
                            if (basename != "" && basename != prog) {
                                prog = basename
                                break
                            }
                        }
                    }
                }

                # Special handling for JVM applications
                if (prog == "java" && cmd ~ /-jar/) {
                    match(cmd, /-jar\s+([^\/\s]*\/)?([^\/\s]+)\.jar/, jar_match)
                    if (jar_match[2] != "") {
                        prog = jar_match[2]
                    }
                }

                # Special handling for Python scripts
                if ((prog == "python" || prog == "python3") && cmd ~ /\.py/) {
                    match(cmd, /([^\/\s]+)\.py/, py_match)
                    if (py_match[1] != "") {
                        prog = py_match[1]
                    }
                }

                # Special handling for Node.js
                if (prog == "node") {
                    if (cmd ~ /\/node_modules\/\.bin\//) {
                        match(cmd, /\/node_modules\/\.bin\/([^\/\s]+)/, node_match)
                        if (node_match[1] != "") {
                            prog = node_match[1]
                        }
                    } else if (cmd ~ /\.js/) {
                        match(cmd, /([^\/\s]+)\.js/, js_match)
                        if (js_match[1] != "") {
                            prog = js_match[1]
                        }
                    }
                }

                printf "%s %s %s %s %s %s %s\n", $1, $2, $3, $4, $5, prog, substr(cmd, 1, 80)
            }' |
            fzf --multi \
                --header="Select processes to kill (TAB for multi-select, type to search)" \
                --preview 'ps -fp {1} 2>/dev/null' \
                --preview-window=down:4:wrap \
                --bind 'ctrl-r:reload(ps -eo pid,ppid,user,%cpu,%mem,comm,args --sort=-%cpu | awk "NR==1 {next} {cmd = \$7; for(i=8; i<=NF; i++) cmd = cmd \" \" \$i; prog = \$6; if (cmd ~ /\/[^\/\\s]+/) { split(cmd, cmd_parts, \" \"); for (i in cmd_parts) { if (cmd_parts[i] ~ /^\/.*\/[^\/]+\$/) { split(cmd_parts[i], path_parts, \"/\"); basename = path_parts[length(path_parts)]; gsub(/\\.(py|js|sh|rb|pl|jar|exe)\$/, \"\", basename); gsub(/-bin\$/, \"\", basename); if (basename != \"\" && basename != prog) { prog = basename; break } } } } if (prog == \"java\" && cmd ~ /-jar/) { match(cmd, /-jar\\s+([^\\/\\s]*\\/)?([^\\/\\s]+)\\.jar/, jar_match); if (jar_match[2] != \"\") { prog = jar_match[2] } } printf \"%s %s %s %s %s %s %s\\n\", \$1, \$2, \$3, \$4, \$5, prog, substr(cmd, 1, 80)}")' |
            awk '{print $1}')

        if [[ -n "$selected" ]]; then
            local pids=(${(f)selected})
            compadd -a pids
        fi
    }

    # Register the completion function
    compdef _fzf_kill_completion kill

    # Also enable for killall and pkill
    compdef _fzf_kill_completion killall
    compdef _fzf_kill_completion pkill
fi
