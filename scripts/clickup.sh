#!/usr/bin/env bash
# Notification wrapper.
#
# NOTE: Per current setup, notifications are NOT posted to ClickUp.
# Every message is appended to NOTIFICATIONS.md at the repo root so the
# bot's chatter shows up in git history alongside the rest of memory.
#
# To re-enable ClickUp later: set CLICKUP_API_KEY, CLICKUP_WORKSPACE_ID,
# CLICKUP_CHANNEL_ID in the environment AND set USE_CLICKUP=1.
#
# Usage: bash scripts/clickup.sh "<message>"

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
NOTIF_FILE="$ROOT/NOTIFICATIONS.md"

if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

if [[ $# -gt 0 ]]; then
  msg="$*"
else
  msg="$(cat)"
fi

if [[ -z "${msg// /}" ]]; then
  echo "usage: bash scripts/clickup.sh \"<message>\"" >&2
  exit 1
fi

stamp="$(date '+%Y-%m-%d %H:%M %Z')"

# Initialize the notifications file with a header on first use.
if [[ ! -f "$NOTIF_FILE" ]]; then
  cat > "$NOTIF_FILE" <<'HEADER'
# Notifications

This file replaces ClickUp messaging for now. Every notification the bot
would have posted to ClickUp is appended here in chronological order and
committed to the repo.

HEADER
fi

# Default path: append to NOTIFICATIONS.md and exit 0.
if [[ "${USE_CLICKUP:-0}" != "1" ]]; then
  printf '\n---\n## %s\n%s\n' "$stamp" "$msg" >> "$NOTIF_FILE"
  echo "[notification] appended to NOTIFICATIONS.md"
  echo "$msg"
  exit 0
fi

# Optional escape hatch: real ClickUp post when USE_CLICKUP=1 and creds present.
if [[ -z "${CLICKUP_API_KEY:-}" || -z "${CLICKUP_WORKSPACE_ID:-}" || -z "${CLICKUP_CHANNEL_ID:-}" ]]; then
  printf '\n---\n## %s (USE_CLICKUP=1 but creds missing — fallback)\n%s\n' "$stamp" "$msg" >> "$NOTIF_FILE"
  echo "[clickup fallback] appended to NOTIFICATIONS.md"
  echo "$msg"
  exit 0
fi

payload="$(python3 -c "
import json, sys
print(json.dumps({'type': 'message', 'content': sys.argv[1], 'content_format': 'text/md'}))
" "$msg")"

curl -fsS -X POST \
  "https://api.clickup.com/api/v3/workspaces/$CLICKUP_WORKSPACE_ID/chat/channels/$CLICKUP_CHANNEL_ID/messages" \
  -H "Authorization: $CLICKUP_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$payload"
echo
