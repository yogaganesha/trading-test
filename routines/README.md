# Cloud Routines

Each `*.md` file in this directory is the prompt body of a Claude Code cloud
routine. Paste it verbatim into the routine's prompt field — do not paraphrase.

## Schedules (America/Chicago)

| File | Cron | Window |
|------|------|--------|
| pre-market.md | `0 6 * * 1-5` | 6:00 AM weekdays |
| market-open.md | `30 8 * * 1-5` | 8:30 AM weekdays (market open) |
| midday.md | `0 12 * * 1-5` | Noon weekdays |
| daily-summary.md | `0 15 * * 1-5` | 3:00 PM weekdays (after close) |
| weekly-review.md | `0 16 * * 5` | 4:00 PM Fridays only |

## Prerequisites (one-time)

1. Install the Claude GitHub App on this repo.
2. Toggle on **Allow unrestricted branch pushes** in the routine environment.
3. Set credentials as routine environment variables — never as a `.env` file:
   - `ALPACA_API_KEY`, `ALPACA_SECRET_KEY`
   - `ALPACA_ENDPOINT` (optional), `ALPACA_DATA_ENDPOINT` (optional)
   - `PERPLEXITY_API_KEY` (optional, used for research)
   - `PERPLEXITY_MODEL` (optional, defaults to `sonar`)

## Notifications

ClickUp is disabled for now. `scripts/clickup.sh` writes every message to
`NOTIFICATIONS.md` at the repo root and the routine commits it alongside
the rest of memory. To re-enable ClickUp posting from the cloud, also set
`USE_CLICKUP=1`, `CLICKUP_API_KEY`, `CLICKUP_WORKSPACE_ID`,
`CLICKUP_CHANNEL_ID` on the routine.
