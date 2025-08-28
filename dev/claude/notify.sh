#!/bin/bash

# Essential Claude Code notification system
# Usage: claude-notify-enhanced.sh <hook_type>

HOOK_TYPE="$1"

# Configuration
CONFIG_FILE="$HOME/.config/claude/notification-config.json"
LOG_DIR="$HOME/.claude/logs"

# Ensure directories exist
mkdir -p "$LOG_DIR" "$(dirname "$CONFIG_FILE")"

# Read configuration
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "ERROR: Configuration file not found at $CONFIG_FILE"
    exit 1
fi

CONFIG=$(cat "$CONFIG_FILE")

# Extract session and context information
PROJECT_NAME=$(basename "$(pwd)")
SESSION_ID="${CLAUDE_SESSION_ID:-$(date +%H%M%S)}"
TIMESTAMP=$(date '+%Y-%m-%dT%H:%M:%S.%3NZ')
USER=$(whoami)
HOSTNAME=$(hostname)

# Prometheus query function
query_prometheus() {
    local query="$1"
    local prom_enabled=$(echo "$CONFIG" | jq -r '.prometheus.enabled // false')
    local prom_endpoint=$(echo "$CONFIG" | jq -r '.prometheus.endpoint // "http://localhost:9090"')
    
    if [[ "$prom_enabled" != "true" ]]; then
        echo ""
        return
    fi
    
    curl -s "$prom_endpoint/api/v1/query" \
        --data-urlencode "query=$query" \
        2>/dev/null | jq -r '.data.result[0].value[1] // ""' 2>/dev/null || echo ""
}

# Get current session ID from Prometheus
get_current_session_id() {
    local prom_enabled=$(echo "$CONFIG" | jq -r '.prometheus.enabled // false')
    if [[ "$prom_enabled" != "true" ]]; then
        echo ""
        return
    fi
    
    curl -s "http://localhost:9090/api/v1/query?query=claude_code_cost_usage_USD_total" \
        2>/dev/null | jq -r '.data.result | sort_by(.value[0]) | reverse | .[0].metric.session_id // ""' 2>/dev/null || echo ""
}

# Get session metrics
get_session_metrics() {
    local session_id="$1"
    local metrics_enabled=$(echo "$CONFIG" | jq -r '.prometheus.include_metrics')
    
    if [[ -z "$session_id" ]] || [[ "$session_id" == "$(date +%H%M%S)" ]]; then
        session_id=$(get_current_session_id)
        if [[ -z "$session_id" ]]; then
            echo '{"cost": "", "tokens": "", "duration": ""}'
            return
        fi
    fi
    
    if [[ "$HOOK_TYPE" == "stop" ]]; then
        sleep 2  # Wait for metrics
    fi
    
    local cost="" tokens="" duration=""
    
    # Get cost
    if [[ $(echo "$metrics_enabled" | jq -r '.cost // false') == "true" ]]; then
        cost=$(query_prometheus "sum(claude_code_cost_usage_USD_total{session_id=\"$session_id\"})")
        if [[ -n "$cost" ]] && [[ "$cost" != "0" ]] && [[ "$cost" != "null" ]]; then
            cost=$(printf "%.4f" "$cost")
        else
            cost=""
        fi
    fi
    
    # Get tokens
    if [[ $(echo "$metrics_enabled" | jq -r '.tokens // false') == "true" ]]; then
        local total_tokens=$(query_prometheus "sum(claude_code_token_usage_tokens_total{session_id=\"$session_id\"})")
        
        if [[ -n "$total_tokens" ]] && [[ "$total_tokens" != "0" ]] && [[ "$total_tokens" != "null" ]]; then
            local token_num=$(printf "%.0f" "$total_tokens")
            if (( token_num >= 1000000 )); then
                tokens=$(printf "%.1fM tokens" $(echo "$token_num / 1000000" | bc -l 2>/dev/null || echo 0))
            elif (( token_num >= 1000 )); then
                tokens=$(printf "%.1fK tokens" $(echo "$token_num / 1000" | bc -l 2>/dev/null || echo 0))
            else
                tokens="$token_num tokens"
            fi
        fi
    fi
    
    # Get duration
    if [[ $(echo "$metrics_enabled" | jq -r '.duration // false') == "true" ]]; then
        local active_time=$(query_prometheus "sum(claude_code_active_time_seconds_total{session_id=\"$session_id\"})")
        if [[ -n "$active_time" ]] && [[ "$active_time" != "0" ]] && [[ "$active_time" != "null" ]]; then
            if (( $(echo "$active_time >= 60" | bc -l 2>/dev/null || echo 0) )); then
                duration=$(printf "%.1fm" $(echo "$active_time / 60" | bc -l 2>/dev/null || echo 0))
            else
                duration=$(printf "%.0fs" "$active_time")
            fi
        fi
    fi
    
    echo "{\"cost\": \"$cost\", \"tokens\": \"$tokens\", \"duration\": \"$duration\"}"
}

# Generate notification content
generate_notification() {
    local hook_type="$1"
    local title="" message="" priority="" urgency=""
    
    case "$hook_type" in
        "start")
            title="🚀 Task Started"
            message="Task Started • [$PROJECT_NAME]"
            priority=$(echo "$CONFIG" | jq -r '.gotify.priorities.start // 5')
            urgency="low"
            ;;
        "stop")
            title="✅ Task Complete"
            
            local metrics=$(get_session_metrics "$SESSION_ID")
            local cost=$(echo "$metrics" | jq -r '.cost // ""')
            local tokens=$(echo "$metrics" | jq -r '.tokens // ""')
            local duration=$(echo "$metrics" | jq -r '.duration // ""')
            
            local summary_parts=()
            [[ -n "$tokens" ]] && summary_parts+=("$tokens")
            [[ -n "$cost" ]] && summary_parts+=("\$$cost")
            [[ -n "$duration" ]] && summary_parts+=("$duration")
            
            local metrics_summary=""
            if [[ ${#summary_parts[@]} -gt 0 ]]; then
                metrics_summary=" • $(IFS=' • '; echo "${summary_parts[*]}")"
            fi
            
            message="Task Complete • [$PROJECT_NAME]$metrics_summary"
            priority=$(echo "$CONFIG" | jq -r '.gotify.priorities.stop // 7')
            urgency="normal"
            ;;
        *)
            title="ℹ️ Claude Event"
            message="Event: $hook_type in [$PROJECT_NAME]"
            priority=5
            urgency="normal"
            ;;
    esac
    
    echo "$title|$message|$priority|$urgency"
}

# Send Gotify notification
send_gotify() {
    local title="$1" message="$2" priority="$3"
    
    local gotify_enabled=$(echo "$CONFIG" | jq -r '.gotify.enabled // true')
    local token="${GOTIFY_TOKEN:-ARBFidJvnd1EeXU}"
    
    if [[ "$gotify_enabled" != "true" ]]; then
        return
    fi
    
    local gotify_url=$(echo "$CONFIG" | jq -r '.gotify.url // "http://192.168.1.111/message"')
    
    curl -s -X POST "$gotify_url" \
        -H "Content-Type: application/json" \
        -H "X-Gotify-Key: $token" \
        -d "{
            \"title\": \"$title\",
            \"message\": \"$message\",
            \"priority\": $priority
        }" >/dev/null 2>&1
}

# Send desktop notification
send_desktop() {
    local title="$1" message="$2" urgency="$3"
    
    local desktop_enabled=$(echo "$CONFIG" | jq -r '.desktop.enabled // true')
    if [[ "$desktop_enabled" != "true" ]]; then
        return
    fi
    
    local expire_time=$(echo "$CONFIG" | jq -r ".desktop.expire_times.$HOOK_TYPE // 5000")
    
    notify-send "$title" "$message" \
        --icon=dialog-information \
        --urgency="$urgency" \
        --expire-time="$expire_time" \
        --app-name="Claude Code"
}

# Log notification
log_notification() {
    local log_enabled=$(echo "$CONFIG" | jq -r '.logging.enabled // true')
    if [[ "$log_enabled" != "true" ]]; then
        return
    fi
    
    local log_file="$LOG_DIR/notifications.json"
    local log_entry="{
        \"timestamp\": \"$TIMESTAMP\",
        \"session_id\": \"$SESSION_ID\",
        \"hook_type\": \"$HOOK_TYPE\",
        \"project\": \"$PROJECT_NAME\",
        \"title\": \"$1\",
        \"message\": \"$2\"
    }"
    
    if [[ -f "$log_file" ]]; then
        echo ",$log_entry" >> "$log_file"
    else
        echo "[$log_entry" > "$log_file"
    fi
}

# Main execution
main() {
    if [[ -z "$HOOK_TYPE" ]]; then
        echo "Usage: $0 <hook_type>"
        exit 1
    fi
    
    # Generate content
    local content=$(generate_notification "$HOOK_TYPE")
    IFS='|' read -r title message priority urgency <<< "$content"
    
    # Log the notification
    log_notification "$title" "$message"
    
    # Send notifications
    send_gotify "$title" "$message" "$priority"
    send_desktop "$title" "$message" "$urgency"
    
    echo "Enhanced notification sent: $HOOK_TYPE"
}

main "$@"