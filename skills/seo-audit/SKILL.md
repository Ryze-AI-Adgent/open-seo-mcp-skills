---
name: seo-audit
description: Full SEO audit of a site from its real Search Console + GA4 data — indexation health, CTR anomalies, decaying pages, striking-distance keywords, quick wins. Use when asked to "audit my site", "SEO audit", "why is my organic traffic down", or "SEO health check".
---

# SEO Audit

Audit the user's site using their own data via the Ryze MCP. No estimates — everything below comes from their actual GSC/GA4.

## Workflow

1. **Pick the property.** `google_search_console__listSites`. If several, use the one matching the user's domain; confirm only when ambiguous.
2. **Indexation.** `google_search_console__getIndexationSummary` — indexed vs not-indexed counts and reasons. Flag anything unusual (large "Crawled — currently not indexed", spikes in excluded pages).
3. **Performance baseline.** `google_search_console__runRawSearchAnalytics`: last 90 days vs previous 90, dimensions `query` and `page` (two calls each period). Compute clicks/impressions/CTR/position deltas.
4. **Find the problems:**
   - **Decaying pages** — pages whose clicks dropped >30% period-over-period
   - **CTR anomalies** — queries with position ≤ 5 but CTR < 2% (title/meta problem)
   - **Striking distance** — queries at position 8–20 with high impressions (one push from page 1)
   - **Cannibalization** — same query, multiple ranking pages splitting clicks
5. **Spot-check pages.** For the 3–5 worst pages, `google_search_console__inspectUrl` — canonical, indexing state, last crawl.
6. **Cross-check traffic.** `google_analytics__runRawReport` — organic sessions + conversions by landing page, same periods. A page can hold rankings but lose revenue; call that out.
7. **AI traffic.** `google_analytics__getAIReferrals` for the same window — note whether AI engines are becoming a meaningful channel for this site.

## Output

A report with: verdict up top (one paragraph, is the site healthy or not and the #1 issue), then sections — Indexation, Losers, Quick wins (striking distance + CTR fixes, ranked by impressions), Cannibalization — each with a table and the specific fix. End with a prioritized 5-item action list.

## Fallbacks

If GSC isn't connected, say so and point to Ryze connector setup (https://help.get-ryze.ai/claude/connect) — do not substitute third-party estimates for the site's own data.
