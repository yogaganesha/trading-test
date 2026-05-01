---
description: Run the midday scan workflow locally
---

Local mirror of routines/midday.md. Uses local .env. Skip env-var
verification and commit-and-push blocks.

STEP 1 — Read memory: TRADING-STRATEGY.md, tail of TRADE-LOG.md,
today's RESEARCH-LOG.md.

STEP 2 — Pull current state:
  bash scripts/alpaca.sh positions
  bash scripts/alpaca.sh orders

STEP 3 — Cut losers. For every position where unrealized_plpc <= -0.07:
  bash scripts/alpaca.sh close SYM
  bash scripts/alpaca.sh cancel ORDER_ID

STEP 4 — Tighten trailing stops on winners:
- Up >= +20% -> trail_percent: "5"
- Up >= +15% -> trail_percent: "7"
Never tighten within 3% of current price. Never move a stop down.

STEP 5 — Thesis check. Cut if a thesis broke intraday.

STEP 6 — Optional intraday research via Perplexity if needed.

STEP 7 — Notification only if action was taken.
  bash scripts/clickup.sh "<action summary>"
