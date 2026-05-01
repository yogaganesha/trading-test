---
description: Run the daily-summary workflow locally
---

Local mirror of routines/daily-summary.md. Uses local .env. Skip env-var
verification and commit-and-push blocks.

STEP 1 — Read memory: tail of TRADE-LOG.md (yesterday's equity for Day P&L,
trades today, weekly count).

STEP 2 — Pull final state:
  bash scripts/alpaca.sh account
  bash scripts/alpaca.sh positions
  bash scripts/alpaca.sh orders

STEP 3 — Compute metrics: Day P&L, phase cumulative P&L, trades today,
trades this week.

STEP 4 — Append EOD snapshot to memory/TRADE-LOG.md.

STEP 5 — Send ONE notification (always, even no-trade days):
  bash scripts/clickup.sh "EOD ..."
