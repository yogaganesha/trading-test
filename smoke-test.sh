#!/usr/bin/env bash
# One-shot smoke test for the trading bot wrappers.
# Run from the project root: bash smoke-test.sh
# Reads .env automatically. Hits paper-api.alpaca.markets and api.perplexity.ai.
# Read-only — places no orders.

set -uo pipefail
cd "$(dirname "$0")"

pass=0
fail=0
ok()   { echo "  ✓ $*"; pass=$((pass+1)); }
bad()  { echo "  ✗ $*"; fail=$((fail+1)); }

section() { echo; echo "─── $* ───"; }

section "1. Alpaca: account"
out=$(bash scripts/alpaca.sh account 2>&1) || true
if echo "$out" | grep -q '"equity"'; then
  eq=$(echo "$out" | python3 -c 'import sys,json; d=json.loads(sys.stdin.read()); print(d.get("equity"))')
  cash=$(echo "$out" | python3 -c 'import sys,json; d=json.loads(sys.stdin.read()); print(d.get("cash"))')
  bp=$(echo "$out" | python3 -c 'import sys,json; d=json.loads(sys.stdin.read()); print(d.get("buying_power"))')
  dt=$(echo "$out" | python3 -c 'import sys,json; d=json.loads(sys.stdin.read()); print(d.get("daytrade_count"))')
  ok  "account: equity=\$${eq}  cash=\$${cash}  buying_power=\$${bp}  daytrades=${dt}"
else
  bad "account call failed:"
  echo "$out" | head -5 | sed 's/^/      /'
fi

section "2. Alpaca: positions"
out=$(bash scripts/alpaca.sh positions 2>&1) || true
if echo "$out" | python3 -c 'import sys,json; json.loads(sys.stdin.read())' 2>/dev/null; then
  n=$(echo "$out" | python3 -c 'import sys,json; print(len(json.loads(sys.stdin.read())))')
  ok "positions: ${n} open"
else
  bad "positions call failed:"
  echo "$out" | head -5 | sed 's/^/      /'
fi

section "3. Alpaca: orders"
out=$(bash scripts/alpaca.sh orders 2>&1) || true
if echo "$out" | python3 -c 'import sys,json; json.loads(sys.stdin.read())' 2>/dev/null; then
  n=$(echo "$out" | python3 -c 'import sys,json; print(len(json.loads(sys.stdin.read())))')
  ok "orders (open): ${n}"
else
  bad "orders call failed:"
  echo "$out" | head -5 | sed 's/^/      /'
fi

section "4. Alpaca: quote SPY"
out=$(bash scripts/alpaca.sh quote SPY 2>&1) || true
if echo "$out" | grep -q '"quote"'; then
  ap=$(echo "$out" | python3 -c 'import sys,json; print(json.loads(sys.stdin.read())["quote"]["ap"])' 2>/dev/null)
  bp=$(echo "$out" | python3 -c 'import sys,json; print(json.loads(sys.stdin.read())["quote"]["bp"])' 2>/dev/null)
  ok "SPY quote: bid=${bp} ask=${ap}"
else
  bad "quote call failed:"
  echo "$out" | head -5 | sed 's/^/      /'
fi

section "5. Perplexity research"
out=$(bash scripts/perplexity.sh "What is the current VIX level today, in one sentence?" 2>&1) || true
if echo "$out" | grep -q '"choices"'; then
  ans=$(echo "$out" | python3 -c 'import sys,json; print(json.loads(sys.stdin.read())["choices"][0]["message"]["content"][:200])' 2>/dev/null)
  ok "perplexity replied: ${ans}"
elif echo "$out" | grep -q "exit 3"; then
  echo "  ⚠ perplexity key missing (script exited 3 — falls back to WebSearch)"
else
  bad "perplexity call failed:"
  echo "$out" | head -5 | sed 's/^/      /'
fi

section "6. ClickUp wrapper (writes to NOTIFICATIONS.md, does not post)"
out=$(bash scripts/clickup.sh "smoke-test ping $(date +%H:%M:%S)" 2>&1) || true
if echo "$out" | grep -q "appended to NOTIFICATIONS.md"; then
  ok "notification written to NOTIFICATIONS.md"
else
  bad "clickup wrapper failed:"
  echo "$out" | sed 's/^/      /'
fi

echo
echo "═══════════════════════════════════════════════"
echo "  passed: $pass   failed: $fail"
echo "═══════════════════════════════════════════════"
