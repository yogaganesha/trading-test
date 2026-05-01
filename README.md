# Trading Bot

Autonomous swing-trading agent built on top of Claude Code, per the Opus 4.7
Trading Bot Setup Guide.

## Quick start (local mode)

1. `cp env.template .env` and fill in credentials. Paper trading is recommended
   for the first run. The .env file is gitignored.
2. `chmod +x scripts/*.sh` (already done at first commit, but harmless to repeat).
3. Open this repo in Claude Code and run `/portfolio` for a read-only smoke test.
4. From there, the local slash commands (`/pre-market`, `/market-open`,
   `/midday`, `/daily-summary`, `/weekly-review`, `/trade`) mirror the cloud
   routines minus the env-check and commit-and-push blocks.

## Layout

```
trading-bot/
├── CLAUDE.md              # Agent rulebook (auto-loaded every session)
├── README.md              # This file
├── env.template           # Template for local .env file
├── .gitignore             # Excludes .env
├── NOTIFICATIONS.md       # Local notification log (replaces ClickUp for now)
├── .claude/commands/      # Ad-hoc slash commands (local)
├── routines/              # Cloud routine prompts (production path)
├── scripts/               # API wrappers (alpaca, perplexity, clickup)
└── memory/                # Agent's persistent state
    ├── TRADING-STRATEGY.md
    ├── TRADE-LOG.md
    ├── RESEARCH-LOG.md
    ├── WEEKLY-REVIEW.md
    └── PROJECT-CONTEXT.md
```

## Notifications

Per the current setup, ClickUp is disabled. The `scripts/clickup.sh` wrapper
appends every notification to `NOTIFICATIONS.md` at the repo root, which is
committed alongside the rest of memory. To re-enable real ClickUp posting,
set `USE_CLICKUP=1` plus the three `CLICKUP_*` env vars.

## Cloud mode

See Part 7 of the setup guide. In short:

1. Install the Claude GitHub App on this repo.
2. Create five routines (`pre-market`, `market-open`, `midday`,
   `daily-summary`, `weekly-review`) each with the prompt in `routines/*.md`
   pasted verbatim.
3. Set credentials as routine environment variables — **never** as a `.env`
   file in the cloud workspace.
4. Toggle on "Allow unrestricted branch pushes" or `git push origin main`
   will silently fail.
