---
name: seo-vs-ads
description: Find money leaking between search ads and SEO — queries you pay for while already ranking organically, and paid queries with no organic coverage. Use when asked "am I paying for clicks I'd get free", "brand bidding waste", "SEO vs ads overlap", or "cut wasted ad spend with SEO".
---

# SEO vs Ads

The report subscription tools can't do: it needs your ads account AND your Search Console together. Both are on the Ryze MCP.

## Workflow

1. **Paid search terms.** `google_ads__runRawGaql` on the default account — search terms report, last 90 days: term, impressions, clicks, cost, conversions. (GAQL shape via `native__get_provider_docs`, provider `google_ads`, if needed.)
2. **Organic positions.** `google_search_console__runRawSearchAnalytics`, dimension `["query"]`, same window.
3. **Join on query** and bucket:
   - **Double-paying** — organic position ≤ 3 AND paid spend on the same term. Especially brand terms with no competing advertisers (check top-of-page rate / competition). Sum the spend: that's the number for the headline.
   - **Defensible** — organic ≤ 3 but competitors bid on the term (paid presence may be justified; say so honestly)
   - **Paid-only winners** — terms converting in ads with no organic ranking → the SEO content roadmap, pre-validated by money
   - **Organic-only converters** — strong organic queries with no ad coverage → scale candidates if ads team wants volume
4. **Estimate savings.** For the double-paying bucket: spend × the organic click-capture you'd retain (be conservative, ~50–70% for position 1 brand terms; label it an estimate).

## Output

Headline first: "$X/quarter going to clicks you already rank #1 for." Then the four buckets as tables (term, cost, conversions, organic position), the savings estimate with its assumptions stated, and a short action list: exact negatives to add, exact pages to build.

## Fallback

If only one of the two accounts is connected, run what's possible, and name the missing connection instead of guessing at the other half.
