---
name: keyword-research
description: Keyword research from a seed topic — ideas, real Google volume/CPC, intent, difficulty, clustered into a plan. Use when asked to "find keywords", "keyword research for X", "what should I rank for", or "build a keyword plan".
---

# Keyword Research

Seed → ideas → metrics → clusters. Volumes come from Google Ads planner data (the source everyone else resells), enriched with DataForSEO intent/difficulty.

## Workflow

1. **Expand the seed.** `google_ads__generateKeywordIdeas` with the seed keyword(s) and/or the user's URL. Collect up to ~200 ideas.
2. **Metrics.** `google_ads__generateKeywordHistoricalMetrics` on the candidate list — monthly volume, competition, CPC range, 12-month trend.
3. **Intent + difficulty (optional enrich).** If the workspace exposes DataForSEO tools, call the Labs `keyword_overview` endpoint for the top ~50 (search intent, keyword difficulty, SERP features). Request shape: `native__get_provider_docs` provider `dataforseo`. Skip silently if unavailable — Google metrics alone are enough for a v1 plan.
4. **What they already rank for.** `google_search_console__runRawSearchAnalytics` (dimension `query`, filtered to the topic) — mark keywords the site already has positions for; those are optimize-not-create.
5. **Cluster.** Group by intent and topic into content clusters: pillar + supporting pages. For each cluster: target keyword, supporting keywords, total volume, intent, existing page (if any) or "new page".

## Output

One table per cluster (keyword, volume, CPC, intent, current position if any), then a ranked plan: which clusters to attack first and why (volume × winnability — favor clusters where the site already has striking-distance positions). Plain language, no filler.

## Rules

- Never invent volumes. If a metrics call fails, show the keyword without numbers and say why.
- CPC belongs in the output — it tells the user what the traffic is worth, and this doubles as an ads negative-keyword source.
