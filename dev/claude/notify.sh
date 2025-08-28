#!/usr/bin/env bash
#
# Claude Code Notification System
# Sends notifications via Gotify when Claude Code events occur
#
# Usage: claude-notify.sh <hook_type>
# Hook types: start, stop

set -euo pipefail

readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly HOOK_TYPE="${1:-}"
readonly GOTIFY_URL="http://192.168.1.111/message"
readonly GOTIFY_TOKEN="${GOTIFY_TOKEN:-ARBFidJvnd1EeXU}"
readonly GOTIFY_PRIORITY_START=5
readonly GOTIFY_PRIORITY_STOP=7
readonly PROMETHEUS_ENDPOINT="http://localhost:9090"
readonly PROJECT_NAME="$(basename "$(pwd)")"
readonly SESSION_ID="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"

error_exit() {
    echo "Error on line ${1}: exited with status ${2}" >&2
    exit "${2}"
}

trap 'error_exit ${LINENO} $?' ERR

validate_hook_type() {
    [[ -n "${1}" ]] || {
        echo "Usage: ${SCRIPT_NAME} <hook_type>" >&2
        echo "Valid hook types: start, stop" >&2
        exit 1
    }
}

prom_query() {
    local response
    response="$(curl -sSf --max-time 2 "${PROMETHEUS_ENDPOINT}/api/v1/query" \
        --data-urlencode "query=${1}" 2>/dev/null)" || return 1
    echo "${response}" | jq -r '.data.result[0].value[1] // ""' 2>/dev/null || echo ""
}

get_session_id() {
    local response
    response="$(curl -sSf --max-time 2 "${PROMETHEUS_ENDPOINT}/api/v1/query?query=claude_code_cost_usage_USD_total" 2>/dev/null)" || return 1
    echo "${response}" | jq -r '.data.result | sort_by(.value[0]) | reverse | .[0].metric.session_id // ""' 2>/dev/null
}

get_model() {
    local session_id="${1:-${SESSION_ID}}"
    
    [[ -z "${session_id}" || "${session_id}" == "$(date +%H%M%S)" ]] && {
        session_id="$(get_session_id)" || { echo "claude"; return; }
    }
    
    local response model_name
    response="$(curl -sSf --max-time 2 "${PROMETHEUS_ENDPOINT}/api/v1/query" \
        --data-urlencode "query=claude_code_cost_usage_USD_total{session_id=\"${session_id}\"}" 2>/dev/null)" || { echo "claude"; return; }
    
    model_name="$(echo "${response}" | jq -r '.data.result[0].metric.model // ""' 2>/dev/null)"
    
    case "${model_name}" in
        *haiku*) echo "haiku" ;;
        *sonnet*) echo "sonnet" ;;
        *opus*) echo "opus" ;;
        *) echo "${model_name:-claude}" ;;
    esac
}

format_metric() {
    local value="${1}" type="${2}"
    [[ -z "${value}" || "${value}" == "0" ]] && return
    
    case "${type}" in
        cost) printf "$%.2f" "${value}" ;;
        tokens)
            local num_int="$(printf "%.0f" "${value}")"
            if (( num_int >= 1000000 )); then
                printf "%.1fM tokens" "$(echo "scale=1; ${num_int}/1000000" | bc)"
            elif (( num_int >= 1000 )); then
                printf "%.1fK tokens" "$(echo "scale=1; ${num_int}/1000" | bc)"
            else
                echo "${num_int} tokens"
            fi
            ;;
        duration)
            local seconds="$(printf "%.0f" "${value}")"
            (( seconds >= 60 )) && printf "%.1fm" "$(echo "scale=1; ${seconds}/60" | bc)" || printf "%ds" "${seconds}"
            ;;
    esac
}

get_metrics() {
    local session_id="${1:-${SESSION_ID}}"
    
    [[ -z "${session_id}" || "${session_id}" == "$(date +%H%M%S)" ]] && {
        session_id="$(get_session_id)" || return
    }
    
    [[ "${HOOK_TYPE}" == "stop" ]] && sleep 2
    
    local metrics=() cost tokens duration
    
    cost="$(prom_query "sum(claude_code_cost_usage_USD_total{session_id=\"${session_id}\"})")"
    cost="$(format_metric "${cost}" "cost")"
    [[ -n "${cost}" ]] && metrics+=("${cost}")
    
    tokens="$(prom_query "sum(claude_code_token_usage_tokens_total{session_id=\"${session_id}\"})")"
    tokens="$(format_metric "${tokens}" "tokens")"
    [[ -n "${tokens}" ]] && metrics+=("${tokens}")
    
    duration="$(prom_query "sum(claude_code_active_time_seconds_total{session_id=\"${session_id}\"})")"
    duration="$(format_metric "${duration}" "duration")"
    [[ -n "${duration}" ]] && metrics+=("${duration}")
    
    (( ${#metrics[@]} > 0 )) && IFS=' • ' echo "${metrics[*]}"
}

generate_message() {
    local hook_type="${1}" session_id="${2:-${SESSION_ID}}"
    local model_name="$(get_model "${session_id}")"
    
    case "${hook_type}" in
        start) echo "🚀 Task Started • [${PROJECT_NAME}] • ${model_name}" ;;
        stop)
            local metrics="$(get_metrics "${session_id}")"
            if [[ -n "${metrics}" ]]; then
                echo "✅ Task Complete • [${PROJECT_NAME}] • ${model_name} • ${metrics}"
            else
                echo "✅ Task Complete • [${PROJECT_NAME}] • ${model_name}"
            fi
            ;;
        *) echo "ℹ️ Event: ${hook_type} • [${PROJECT_NAME}] • ${model_name}" ;;
    esac
}

send_notification() {
    local payload
    payload="$(jq -n --arg title "Claude Code" --arg message "${1}" --arg priority "${2}" \
        '{title: $title, message: $message, priority: ($priority | tonumber)}')"
    
    curl -sSf --max-time 5 -X POST "${GOTIFY_URL}" \
        -H "Content-Type: application/json" \
        -H "X-Gotify-Key: ${GOTIFY_TOKEN}" \
        -d "${payload}" >/dev/null 2>&1 || {
        echo "Warning: Failed to send notification" >&2
        return 1
    }
}

main() {
    validate_hook_type "${HOOK_TYPE}"
    
    local priority
    case "${HOOK_TYPE}" in
        start) priority="${GOTIFY_PRIORITY_START}" ;;
        stop) priority="${GOTIFY_PRIORITY_STOP}" ;;
        *) priority=5 ;;
    esac
    
    local message="$(generate_message "${HOOK_TYPE}")"
    
    if send_notification "${message}" "${priority}"; then
        echo "Notification sent: ${HOOK_TYPE}"
    else
        echo "Failed to send notification" >&2
        exit 0
    fi
}

main