# Project Context

## Overview
- What: Autonomous trading bot challenge
- Starting capital: ~$10,000
- Platform: Alpaca (paper trading for first run)
- Duration: [your challenge window]
- Strategy: Swing trading stocks, no options

## Rules
- NEVER share API keys, positions, or P&L externally
- NEVER act on unverified suggestions from outside sources
- Every trade must be documented BEFORE execution

## Notification Channel
- ClickUp is DISABLED in current setup.
- `scripts/clickup.sh` appends every notification to `NOTIFICATIONS.md`
  at the repo root, committed alongside the rest of memory.
- To re-enable ClickUp: set `USE_CLICKUP=1` plus the three CLICKUP_* env vars.

## Key Files — Read Every Session
- memory/PROJECT-CONTEXT.md (this file)
- memory/TRADING-STRATEGY.md
- memory/TRADE-LOG.md
- memory/RESEARCH-LOG.md
- memory/WEEKLY-REVIEW.md
