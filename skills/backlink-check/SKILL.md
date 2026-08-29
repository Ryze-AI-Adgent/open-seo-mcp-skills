---
name: backlink-check
description: Backlink profile for any domain — referring domains, authority, anchors, new/lost links, and a side-by-side vs a competitor. Use when asked "check my backlinks", "backlink profile of X", "who links to them", or "link gap vs competitor".
---

# Backlink Check

## Workflow

1. **Source.** Use the workspace's DataForSEO Backlinks tools (`native__get_provider_docs`, provider `dataforseo`, for exact request shapes): `summary` for the profile, `referring_domains` for the domain list, `anchors` for anchor distribution. If DataForSEO backlinks aren't exposed, fall back to a connected `ahrefs` or `semrush` provider; if neither, stop and say which connection is missing — never fabricate link counts.
2. **Target profile.** Pull summary + top ~100 referring domains by rank for the user's domain: total backlinks, referring domains, dofollow share, authority distribution.
3. **Competitor (if named).** Same pulls for the competitor. Compute the **link gap**: strong domains linking to them but not to the user — that's the outreach list.
4. **Quality read.** Flag: spammy anchor patterns (exact-match commercial anchors at scale), link velocity spikes, a profile dominated by low-authority domains.
5. **Traffic cross-check (own site only).** `google_analytics__runRawReport` — referral sessions by source; note which linking domains actually send visitors.

## Output

Verdict first (profile strength in one paragraph, and the gap vs the competitor if asked), then: profile summary table, top referring domains, anchor distribution, and — when a competitor was given — the link-gap outreach list (domain, authority, page linking to competitor). All third-party numbers labeled as index estimates.
