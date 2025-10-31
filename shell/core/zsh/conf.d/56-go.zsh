#!/usr/bin/env zsh
# Go - Go programming language tools

# =============================================================================
# Task Runner (go-task)
# =============================================================================
if (( $+commands[go-task] )); then
    alias t='go-task'
    alias task='go-task'
    alias tl='task --list'
    alias ta='task --list-all'
fi
