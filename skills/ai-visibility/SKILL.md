---
name: ai-visibility
description: Measure real AI-engine visibility — traffic from ChatGPT, Perplexity, Claude, Gemini and which pages they cite — from actual GA4 referral data, not prompt sampling. Use when asked "AI visibility", "GEO/AEO check", "do LLMs cite us", "traffic from ChatGPT", or "how do we show up in AI search".
---

# AI Visibility

Every "AI visibility tracker" samples prompts and guesses. GA4 records the actual clicks AI engines send. Measure the real thing first, then diagnose.

## Workflow

1. **Traffic by engine.** `google_analytics__getAiTrafficByEngine` — sessions per AI source (ChatGPT, Perplexity, Gemini, Claude, Copilot…), current vs previous period.
2. **Trend.** `google_analytics__getAiTrafficDaily` — is AI traffic growing, and did anything spike (a spike = something started citing you; find it).
3. **Cited pages.** `google_analytics__getAiLandingPages` — which URLs AI engines actually send people to. These are your proven-citable pages.
4. **Referral detail.** `google_analytics__getAIReferrals` for source-level detail and conversions — is AI traffic converting better or worse than organic.
5. **Diagnose the winners.** Read the top 2–3 cited pages (fetch them). Note the pattern: direct answers high on the page, stats/definitions, clean headings, schema. That pattern is the citation recipe for this site.
6. **Find the misses.** Cross-reference with `google_search_console__runRawSearchAnalytics`: pages with strong organic queries but zero AI referrals — candidates to restructure toward the citation recipe from step 5.

## Output

Verdict (AI traffic share of organic, trend, top engine), then: engine table, cited-pages table with conversions, the citation recipe observed on winning pages, and a top-5 list of pages to restructure. Keep it concrete — name the pages and the exact change.

## Fallback

If the GA4 AI-traffic tools aren't available in the workspace, build the same report with `google_analytics__runRawReport` filtered on `sessionSource` matching known AI referrers (chatgpt.com, perplexity.ai, gemini.google.com, claude.ai, copilot.microsoft.com).
