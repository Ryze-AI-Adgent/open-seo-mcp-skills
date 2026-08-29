---
name: competitor-gap
description: Find keywords a competitor ranks for that the user's site doesn't — the content gap, prioritized by volume and winnability. Use when asked "what does competitor.com rank for", "keyword gap vs X", "steal competitor keywords", or "why do they outrank us".
---

# Competitor Gap

Their rankings are estimates (DataForSEO), yours are real (GSC). Diff them.

## Workflow

1. **Competitor's keywords.** Via the workspace's DataForSEO tools — Labs `ranked_keywords` for the competitor domain (request shape: `native__get_provider_docs`, provider `dataforseo`). Pull top ~500 by volume. If DataForSEO isn't exposed in this workspace, check for connected `ahrefs`/`semrush` providers and use their organic-keywords endpoint instead; if none, stop and say which connection is missing.
2. **Competitor overview.** Labs `domain_rank_overview` — their estimated organic traffic and keyword count, for context.
3. **Your keywords.** `google_search_console__runRawSearchAnalytics`, dimension `["query"]`, last 90 days, high rowLimit — the full set of queries the user's site gets impressions for.
4. **Diff into three buckets:**
   - **Gap** — competitor ranks top 20, you have zero impressions → new content needed
   - **Behind** — you both rank but they're ≥ 5 spots ahead → improve existing page
   - **Ahead** — you outrank them (report briefly; it's the moat)
5. **Prioritize** the Gap and Behind buckets by volume × relevance to the user's product. Drop branded competitor terms unless the user wants comparison pages — then list them separately as "vs / alternative" page candidates.

## Output

Verdict (how big the gap is, in keywords and estimated traffic), then: Gap table (keyword, their position, volume, suggested page), Behind table (keyword, their pos, your pos, your page, fix), and a top-10 action list. Note explicitly which numbers are estimates (theirs) vs real (yours).
