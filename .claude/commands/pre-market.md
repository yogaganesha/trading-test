---
description: Run the pre-market research workflow locally (uses .env credentials)
---

Local mirror of routines/pre-market.md. Uses local .env instead of routine env vars.
SKIP the env-var verification block and SKIP the commit-and-push step.
Otherwise execute the same six steps:

STEP 1 — Read memory:
- memory/TRADING-STRATEGY.md
- tail of memory/TRADE-LOG.md
- tail of memory/RESEARCH-LOG.md

STEP 2 — Pull live account state:
  bash scripts/alpaca.sh account
  bash scripts/alpaca.sh positions
  bash scripts/alpaca.sh orders

STEP 3 — Research market context via Perplexity. Run
  bash scripts/perplexity.sh "<query>" for each:
- "WTI and Brent oil price right now"
- "S&P 500 futures premarket today"
- "VIX level today"
- "Top stock market catalysts today $(date +%Y-%m-%d)"
- "Earnings reports today before market open"
- "Economic calendar today CPI PPI FOMC jobs data"
- "S&P 500 sector momentum YTD"
- News on any currently-held ticker

If Perplexity exits 3, fall back to native WebSearch and note the
fallback in the log entry.

STEP 4 — Write a dated entry to memory/RESEARCH-LOG.md:
- Account snapshot
- Market context
- 2-3 actionable trade ideas with catalyst + entry/stop/target
- Risk factors
- Decision: trade or HOLD (default HOLD)

STEP 5 — Notification (only if urgent):
  bash scripts/clickup.sh "<one line>"

(local: do not commit/push automatically — leave that to the user)
