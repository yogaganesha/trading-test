# Trade Log

> **Capital basis:** $10,000 synthetic cap. Paper account reports ~$100K but
> the surplus is ignored — every snapshot below tracks against the $10K
> baseline, not Alpaca's reported equity.

## Day 0 — EOD Snapshot (pre-launch baseline)
**Portfolio:** $10,000.00 | **Cash:** $10,000.00 (100%) | **Day P&L:** $0 | **Phase P&L:** $0

No positions yet. Bot launches tomorrow.

## 2026-05-21 — Market-Open Trade
- **BUY NVDA** 8 sh @ $223.62 avg fill = $1,788.96 (17.9% of $10K cap)
  - Order type: market / day
  - Catalyst: Q1 FY27 record revenue $81.6B (+73% YoY) reported AMC 5/20 —
    post-earnings beat-and-raise; event risk removed.
  - Stop: 10% trailing GTC @ $201.54 (hwm $223.94)
- Skipped: AVGO/LMT/CAT/HON/COST (wide bid-ask spreads at open); NEE (no
  specific catalyst).

### Open positions after trade
- GE: 6 sh @ $303.84 — trail GTC @ $279
- XOM: 13 sh @ $152.98 — trail GTC @ $147.31
- NVDA: 8 sh @ $223.62 — trail GTC @ $201.54

### Cap utilization
- Deployed vs $10K: ~$5,625 (56.3%) — still below 75-85% target
- Trades this week: 1/3 | Positions: 3/6 | Daytrades: 0/3

### May 21 — EOD Snapshot (Day 1, Thursday)
**Portfolio:** $9,989.02 | **Cash:** $4,399.31 (44.0%) | **Day P&L:** -$10.98 (-0.11%) | **Phase P&L:** -$10.98 (-0.11%)

| Ticker | Shares | Entry    | Close    | Day Chg | Unrealized P&L | Stop     |
|--------|--------|----------|----------|---------|----------------|----------|
| GE     | 6      | $303.84  | $302.60  | +0.81%  | -$7.44         | $279.00  |
| NVDA   | 8      | $223.62  | $219.47  | -1.79%  | -$33.20        | $202.28  |
| XOM    | 13     | $152.98  | $155.26  | -0.65%  | +$29.66        | $147.31  |

**Notes:** Day 1 of tracked phase. Opened NVDA at market open (8sh @ $223.62)
post-earnings; sagged -1.79% on the day. GE drifted slightly above entry
(+0.81%) but still red on cost. XOM ticked down -0.65% intraday yet remains
the only green name. Portfolio flat overall (-0.11%). Trades: 1/3 this week,
3/6 positions, 56% deployed — still under the 75-85% target. All three
trailing stops live and GTC. No action needed pre-open tomorrow; watch NVDA
for follow-through buying and XOM stop creep (only ~5% from price).

## 2026-05-27 — Stop Triggered
- **XOM trailing stop hit** 13 sh sold @ $146.44 (entry $152.98) = -$84.97
  - Trail: 10% GTC, hwm $163.68 → stop $147.31, filled at $146.44
  - Exit reason: trail breached after pullback from $163.68 high.

### May 28 — EOD Snapshot (Day 5, Thursday)
**Portfolio:** $9,940.75 | **Cash:** $6,303.03 (63.0%) | **Day P&L:** +$33.66 (+0.34%) | **Phase P&L:** -$59.25 (-0.59%)

| Ticker | Shares | Entry    | Close    | Day Chg | Unrealized P&L | Stop     |
|--------|--------|----------|----------|---------|----------------|----------|
| GE     | 6      | $303.84  | $320.82  | +1.14%  | +$101.88       | $290.09  |
| NVDA   | 8      | $223.62  | $214.10  | +0.71%  | -$76.16        | $202.28  |

**Notes:** Day 5 of phase. XOM stopped out yesterday (5/27) at $146.44 for
-$84.97 realized — first phase exit. GE quietly running: +5.6% on cost, hwm
$322.32, trail at $290.09 (~10% below price). NVDA still red (-4.3%) but
ticked +0.71% today; trail at $202.28 (5.5% from price), hwm $224.75. Cap
utilization low: 36% deployed vs 75-85% target after XOM exit. Trades this
week: 0 new buys (1 stop fill). Positions 2/6. No replacement opened —
pre-market scan tomorrow should size up the cash pile and consider a new
name to refill the sector slot. No action required AH; both stops live GTC.

### May 29 — EOD Snapshot (Day 6, Friday)
**Portfolio:** $9,943.03 | **Cash:** $6,303.03 (63.4%) | **Day P&L:** +$2.28 (+0.02%) | **Phase P&L:** -$56.97 (-0.57%)

| Ticker | Shares | Entry    | Close    | Day Chg | Unrealized P&L | Stop     |
|--------|--------|----------|----------|---------|----------------|----------|
| GE     | 6      | $303.84  | $323.76  | +0.92%  | +$119.52       | $293.33  |
| NVDA   | 8      | $223.62  | $212.18  | -0.97%  | -$91.52        | $202.28  |

**Notes:** Day 6, Friday — week wraps flat. GE hit a new hwm $325.92 (+7.2%
on cost), trail bumped to $293.33; still ~9.4% below price (no tightening
triggered — needs +15% for 7% trail). NVDA drifted -0.97% to $212.18 (-5.1%
on cost), hwm unchanged at $224.75, trail $202.28 (~4.7% from price —
getting tight). Portfolio +$2.28 on the day, essentially noise. Phase
cumulative -$56.97 (-0.57%) vs $10K basis. Cap utilization still
underweight: 36.4% deployed vs 75-85% target. Trades this week: 0 new (1
stop fill); 0/3 weekly slots used. Positions 2/6. No new entries today —
sector-momentum scan needed Monday pre-open to redeploy idle cash. Both
trail stops live GTC. Have a good weekend.

## 2026-06-03 — Mid-Week Trade
- **BUY HPE** 35 sh @ $54.58 = $1,910.30 (19.1% of $10K cap)
  - Tech/IT hardware add.

## 2026-06-04 — Mid-Week Trade
- **BUY AVGO** 4 sh @ $406.86 = $1,627.44 (16.3% of $10K cap)
  - Semis exposure beyond NVDA.

## 2026-06-05 — Two Stops Triggered
- **HPE trailing stop hit** 35 sh sold @ $50.36 (entry $54.58) = -$147.76
  - Held 2 sessions; gap-down through trail.
- **NVDA trailing stop hit** 8 sh sold @ $209.04 (entry $223.62) = -$116.64
  - hwm $224.75, stop $202.28 ladder breached intraday.

### June 5 — EOD Snapshot (Day 11, Friday)
**Portfolio:** $9,708.72 | **Cash:** $6,200.15 (63.9%) | **Day P&L:** -$326.54 (-3.25%) | **Phase P&L:** -$291.28 (-2.91%)

| Ticker | Shares | Entry    | Close    | Day Chg | Unrealized P&L | Stop     |
|--------|--------|----------|----------|---------|----------------|----------|
| GE     | 6      | $303.84  | $328.00  | +0.11%  | +$144.96       | $299.24  |
| AVGO   | 4      | $406.86  | $385.14  | -8.06%  | -$86.87        | $383.83  |

**Notes:** Day 11, Friday — ugly close to week 2. Two stop fills today:
HPE 35sh @ $50.36 for -$147.76 (held just 2 sessions; bought 6/03 @ $54.58),
NVDA 8sh @ $209.04 for -$116.64 (entry 5/21 @ $223.62, trail breached after
hwm $224.75). AVGO bought 6/04 @ $406.86 already deep red — gapped -8.06%
today; trail $383.83 sits ~0.34% from price = stop-out risk Monday open. GE
lone winner: +7.95% on cost, hwm $332.49, trail $299.24 (8.8% below price,
untightened — needs +15% for 7% trail). Cap utilization 35.1% ($3,508.57 /
$10K) — well below 75-85% target after today's two exits. Trades this week:
2/3 new buys (HPE, AVGO), 2 stop fills. Positions 2/6. Phase P&L -$291.28
(-2.91%) vs $10K, worst session of phase. Sector watch: semis now NVDA -$117
+ AVGO bleeding — if AVGO stops, that's 2 failed semi trades and the rule
triggers a semi sector exit. Both remaining stops live GTC. Weekly review
template due (Friday); pre-market scan Monday should reassess AVGO position
and rotate idle cash if semi-exit triggers.
