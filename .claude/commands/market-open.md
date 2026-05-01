---
description: Run the market-open execution workflow locally
---

Local mirror of routines/market-open.md. Uses local .env. Skip env-var
verification and commit-and-push blocks.

STEP 1 — Read memory: TRADING-STRATEGY.md, today's RESEARCH-LOG.md
(if missing, run pre-market STEPS 1-3 inline), tail of TRADE-LOG.md.

STEP 2 — Re-validate with live data:
  bash scripts/alpaca.sh account
  bash scripts/alpaca.sh positions
  bash scripts/alpaca.sh quote <each planned ticker>

STEP 3 — Hard-check rules BEFORE every order. Skip any trade that fails
and log the reason:
- Total positions after trade <= 6
- Trades this week <= 3
- Position cost <= 20% of equity
- Catalyst documented in today's RESEARCH-LOG
- daytrade_count leaves room (PDT: 3/5 rolling business days)

STEP 4 — Execute the buys (market orders, day TIF):
  bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"buy","type":"market","time_in_force":"day"}'

STEP 5 — Immediately place 10% trailing stop GTC for each new position.
PDT-fallback ladder: trailing_stop -> fixed stop -> queue for tomorrow.

STEP 6 — Append each trade to memory/TRADE-LOG.md.

STEP 7 — Notification only if a trade was placed.
  bash scripts/clickup.sh "<details>"
