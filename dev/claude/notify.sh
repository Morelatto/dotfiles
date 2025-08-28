#!/usr/bin/env bash
#
# Claude Code Notification System
# Sends notifications via Gotify when Claude Code events occur
#
# Usage: claude-notify-enhanced.sh <hook_type>
# Hook types: start, stop

set -euo pipefail

# Script configuration
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly HOOK_TYPE="${1:-}"

# Gotify configuration
readonly GOTIFY_URL="http://192.168.1.111/message"
readonly GOTIFY_TOKEN="${GOTIFY_TOKEN:-ARBFidJvnd1EeXU}"
readonly GOTIFY_PRIORITY_START=5
readonly GOTIFY_PRIORITY_STOP=7

# Prometheus configuration for metrics
readonly PROMETHEUS_ENDPOINT="http://localhost:9090"

# Session and context information
readonly PROJECT_NAME="$(basename "$(pwd)")"
readonly SESSION_ID="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"

# Error handling
error_exit() {
    local line_num="${1}"
    local error_code="${2}"
    echo "Error on line ${line_num}: exited with status ${error_code}" >&2
    exit "${error_code}"
}

trap 'error_exit ${LINENO} $?' ERR

# Validate input
validate_hook_type() {
    local hook="${1}"
    
    if [[ -z "${hook}" ]]; then
        echo "Usage: ${SCRIPT_NAME} <hook_type>" >&2
        echo "Valid hook types: start, stop" >&2
        exit 1
    fi
}

# Prometheus metrics functions
query_prometheus() {
    local query="${1}"
    
    local response
    if response="$(curl -sSf --max-time 2 \
        "${PROMETHEUS_ENDPOINT}/api/v1/query" \
        --data-urlencode "query=${query}" 2>/dev/null)"; then
        echo "${response}" | jq -r '.data.result[0].value[1] // ""' 2>/dev/null || echo ""
    else
        echo ""
    fi
}

get_current_session_id() {
    local response
    if response="$(curl -sSf --max-time 2 \
        "${PROMETHEUS_ENDPOINT}/api/v1/query?query=claude_code_cost_usage_USD_total" 2>/dev/null)"; then
        echo "${response}" | jq -r '.data.result | sort_by(.value[0]) | reverse | .[0].metric.session_id // ""' 2>/dev/null || echo ""
    else
        echo ""
    fi
}

format_metric() {
    local value="${1}"
    local type="${2}"
    
    if [[ -z "${value}" || "${value}" == "0" ]]; then
        echo ""
        return
    fi
    
    case "${type}" in
        cost)
            printf "$%.2f" "${value}"
            ;;
        tokens)
            local num_int
            num_int="$(printf "%.0f" "${value}")"
            if (( num_int >= 1000000 )); then
                printf "%.1fM tokens" "$(echo "scale=1; ${num_int}/1000000" | bc)"
            elif (( num_int >= 1000 )); then
                printf "%.1fK tokens" "$(echo "scale=1; ${num_int}/1000" | bc)"
            else
                echo "${num_int} tokens"
            fi
            ;;
        duration)
            local seconds
            seconds="$(printf "%.0f" "${value}")"
            if (( seconds >= 60 )); then
                printf "%.1fm" "$(echo "scale=1; ${seconds}/60" | bc)"
            else
                printf "%ds" "${seconds}"
            fi
            ;;
    esac
}

get_session_metrics() {
    local session_id="${1:-${SESSION_ID}}"
    
    # Get current session ID if needed
    if [[ -z "${session_id}" || "${session_id}" == "$(date +%H%M%S)" ]]; then
        session_id="$(get_current_session_id)"
        if [[ -z "${session_id}" ]]; then
            echo ""
            return
        fi
    fi
    
    # Wait for metrics to be available on stop event
    if [[ "${HOOK_TYPE}" == "stop" ]]; then
        sleep 2
    fi
    
    local metrics=()
    
    # Get cost
    local cost
    cost="$(query_prometheus "sum(claude_code_cost_usage_USD_total{session_id=\"${session_id}\"})")"
    cost="$(format_metric "${cost}" "cost")"
    [[ -n "${cost}" ]] && metrics+=("${cost}")
    
    # Get tokens
    local tokens
    tokens="$(query_prometheus "sum(claude_code_token_usage_tokens_total{session_id=\"${session_id}\"})")"
    tokens="$(format_metric "${tokens}" "tokens")"
    [[ -n "${tokens}" ]] && metrics+=("${tokens}")
    
    # Get duration
    local duration
    duration="$(query_prometheus "sum(claude_code_active_time_seconds_total{session_id=\"${session_id}\"})")"
    duration="$(format_metric "${duration}" "duration")"
    [[ -n "${duration}" ]] && metrics+=("${duration}")
    
    # Join metrics
    if [[ ${#metrics[@]} -gt 0 ]]; then
        IFS=' • ' echo "${metrics[*]}"
    else
        echo ""
    fi
}

generate_message() {
    local hook_type="${1}"
    
    case "${hook_type}" in
        start)
            echo "🚀 Task Started • [${PROJECT_NAME}]"
            ;;
        stop)
            local metrics
            metrics="$(get_session_metrics)"
            
            if [[ -n "${metrics}" ]]; then
                echo "✅ Task Complete • [${PROJECT_NAME}] • ${metrics}"
            else
                echo "✅ Task Complete • [${PROJECT_NAME}]"
            fi
            ;;
        *)
            echo "ℹ️ Event: ${hook_type} • [${PROJECT_NAME}]"
            ;;
    esac
}

send_notification() {
    local message="${1}"
    local priority="${2}"
    
    # Create JSON payload
    local payload
    payload="$(jq -n \
        --arg title "Claude Code" \
        --arg message "${message}" \
        --arg priority "${priority}" \
        '{title: $title, message: $message, priority: ($priority | tonumber)}')"
    
    # Send notification
    curl -sSf --max-time 5 -X POST "${GOTIFY_URL}" \
        -H "Content-Type: application/json" \
        -H "X-Gotify-Key: ${GOTIFY_TOKEN}" \
        -d "${payload}" >/dev/null 2>&1 || {
        echo "Warning: Failed to send notification" >&2
        return 1
    }
}

# Main execution
main() {
    validate_hook_type "${HOOK_TYPE}"
    
    local message priority
    
    case "${HOOK_TYPE}" in
        start)
            priority="${GOTIFY_PRIORITY_START}"
            ;;
        stop)
            priority="${GOTIFY_PRIORITY_STOP}"
            ;;
        *)
            priority=5
            ;;
    esac
    
    message="$(generate_message "${HOOK_TYPE}")"
    
    if send_notification "${message}" "${priority}"; then
        echo "Notification sent: ${HOOK_TYPE}"
    else
        echo "Failed to send notification" >&2
        exit 0  # Don't fail the hook
    fi
}

# Run main function
main