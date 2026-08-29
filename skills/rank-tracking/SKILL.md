---
name: rank-tracking
description: Rank tracking without a tracker subscription — position movers between any two periods from real Search Console data. Use when asked "how are my rankings", "what moved this week/month", "track my keywords", or "did the update hit me".
---

# Rank Tracking

Rank trackers estimate your position by scraping SERPs daily. Search Console records the position Google actually served you at. Use the real number.

## Workflow

1. **Property.** `google_search_console__listSites` → pick the user's domain.
2. **Two windows.** Default: last 28 days vs previous 28. If the user names an event ("since the March update"), split around that date. GSC data lags ~2 days — never include today.
3. **Pull both periods.** `google_search_console__runRawSearchAnalytics`, dimensions `["query"]`, rowLimit high enough to cover the site (start 5000). Repeat with `["page"]` for page-level movement.
4. **Join and diff.** Match queries across periods, compute position delta, clicks delta, impressions delta.
5. **Classify:**
   - **Winners** — position improved ≥ 2 spots on queries with real impressions
   - **Losers** — dropped ≥ 2 spots (sort by clicks lost, not by delta — a 4→7 drop on a money query beats a 40→80 crash on a nothing query)
   - **New** — queries appearing only in the recent period
   - **Lost** — queries that vanished
6. **Spot-verify (optional).** For the 3–5 most important losers, if DataForSEO SERP tools are exposed in the workspace, pull the live SERP to see who took the spot. Skip if unavailable.

## Output

Verdict first (net up/down and the single biggest move), then four tables: Winners, Losers, New, Lost — query, positions before→after, clicks delta. If the user asked about a specific algorithm update, answer that question explicitly with the before/after evidence.

## Recurring

If the user wants this weekly, suggest scheduling it (Claude Code scheduled tasks / a routine) rather than re-running by hand.
