---
description: Run the Friday weekly review workflow locally
---

Local mirror of routines/weekly-review.md. Uses local .env. Skip env-var
verification and commit-and-push blocks.

STEP 1 — Read full week of TRADE-LOG.md, RESEARCH-LOG.md, WEEKLY-REVIEW.md
template, and TRADING-STRATEGY.md.

STEP 2 — Pull week-end state:
  bash scripts/alpaca.sh account
  bash scripts/alpaca.sh positions

STEP 3 — Compute metrics: starting/ending portfolio, week return, S&P 500
week return (perplexity), W/L/open trades, win rate, best/worst, profit factor.

STEP 4 — Append full review to memory/WEEKLY-REVIEW.md.

STEP 5 — If a rule needs to change (proven 2+ weeks or failed badly), also
update memory/TRADING-STRATEGY.md.

STEP 6 — Send ONE notification:
  bash scripts/clickup.sh "Week ending ..."
