# Cloud Routines

Each `*.md` file in this directory is the prompt body of a Claude Code cloud
routine. Paste it verbatim into the routine's prompt field — do not paraphrase.

## Schedules

The cloud routine UI defaults to UTC and does not let you set a timezone,
so the cron expressions below are in **UTC**. Calibrated for **PDT**
(March 8 – November 1, 2026; UTC-7).

| File | Cron (UTC) | Local (PDT) | Notes |
|------|-----------|-------------|-------|
| pre-market.md | `0 11 * * 1-5` | 4:00 AM | 2.5h before market open |
| market-open.md | `30 13 * * 1-5` | 6:30 AM | Market open (9:30 AM ET) |
| midday.md | `0 17 * * 1-5` | 10:00 AM | Midday scan |
| daily-summary.md | `0 20 * * 1-5` | 1:00 PM | Market close (4:00 PM ET) |
| weekly-review.md | `0 21 * * 5` | 2:00 PM Fri | 1h after Friday close |

### DST handoff

Because the cron is in UTC and Pacific Time shifts twice a year, every
schedule must be bumped **+1 hour later** in UTC when PST starts, and
**-1 hour earlier** when PDT resumes. The next two transitions:

- **Nov 1, 2026** — PDT ends, PST starts. Add 1h to each `<hour>` field above.
- **March 14, 2027** — PST ends, PDT resumes. Subtract 1h.

US equity market hours in PT: 6:30 AM – 1:00 PM (PDT) / 6:30 AM – 1:00 PM (PST).
The hours don't move in PT; only the UTC offset does.

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
