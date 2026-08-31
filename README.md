# Open SEO MCP Skills

[![Free SEO and GEO data for Claude](https://raw.githubusercontent.com/Ryze-AI-Adgent/open-seo-mcp-skills/main/ghs-toplight.png)](https://help.get-ryze.ai/claude/connect)

Open-source SEO + GEO skills for Claude — keyword research, rank tracking, site audits, backlinks, competitor gaps, AI visibility — running on **your own Search Console, Analytics and ads data** through the [Ryze MCP](https://get-ryze.ai), with DataForSEO built in for the data Google won't give you.

No subscription for the tool. No markup on API calls. The skills are MIT — take them, change them, ship them.

## Why this exists

"Open source SEO tools" are having a moment. Look closer and most are a UI over the DataForSEO API: you either bring your own key and pay per request, or pay a hosted subscription **plus a ~28% markup** on every data call. The code is free; the data never was.

This takes the opposite approach:

- Your **rankings** come from your actual Google Search Console — real positions, real clicks, not estimates
- Your **traffic** comes from your actual GA4 — including AI referral traffic (ChatGPT, Perplexity, Claude, Gemini)
- Your **keyword volumes** come from Google Ads keyword planner data
- **Competitor keywords, backlinks and SERPs** come from DataForSEO, already wired into the Ryze connector — no key to manage, no markup layer to build
- Ahrefs and Semrush are also connectable if you already pay for them

## Install (2 steps)

**1. Connect the Ryze MCP** — in Claude: Settings → Connectors → Customize → add custom connector:

```
Name: Ryze AI
URL:  https://connector.get-ryze.ai/mcp
```

Sign in, pick your workspace, connect your Google Search Console / GA4 / ads accounts once. Full guide: https://help.get-ryze.ai/claude/connect

**2. Install the skills** — as a Claude Code plugin:

```
claude plugin marketplace add Ryze-AI-Adgent/open-seo-mcp-skills
/plugin install open-seo-mcp-skills@ryze
```

or just copy them:

```bash
git clone https://github.com/Ryze-AI-Adgent/open-seo-mcp-skills && cp -r open-seo-mcp-skills/skills/* ~/.claude/skills/
```

## The skills

| Skill | What it does | Data source |
|---|---|---|
| `seo-audit` | Full site audit: indexation, CTR anomalies, decaying pages, quick wins | GSC + GA4 |
| `keyword-research` | Seed → ideas → volume/CPC/intent → clustered keyword plan | Google Ads + DataForSEO |
| `rank-tracking` | Position movers between any two periods, no tracker subscription | GSC |
| `competitor-gap` | Keywords a competitor ranks for that you don't | DataForSEO + GSC |
| `backlink-check` | Backlink profile + referring domains vs a competitor | DataForSEO |
| `ai-visibility` | Which AI engines send you traffic and which pages they cite | GA4 AI-referral reports |
| `content-brief` | SERP-driven brief: headings, entities, questions, internal links | DataForSEO + GSC |
| `seo-vs-ads` | Queries you pay for that you already rank for organically | GSC × Google Ads |

Then just ask: *"run an SEO audit on my site"*, *"what keywords does competitor.com rank for that I don't?"*, *"how much am I paying for clicks I'd get free?"*

## How it compares

| | OpenSEO-style wrappers | Semrush/Ahrefs | This |
|---|---|---|---|
| Tool cost | free code or ~$10/mo hosted | $120+/mo | free (MIT) |
| Data cost | your DataForSEO bill (+~28% markup if hosted) | included | through your Ryze workspace |
| Rankings | estimated from SERP scrapes | estimated | your real GSC positions |
| Traffic | estimated | estimated | your real GA4 |
| AI visibility | prompt-sampling estimates | limited | your actual AI referral traffic |
| Works inside Claude | via MCP | no | native skills + MCP |

## Notes for skill authors

Ryze MCP tools are namespaced `<provider>__<tool>` (e.g. `google_search_console__runRawSearchAnalytics`, `google_ads__generateKeywordIdeas`). When a request shape is unclear, call `native__get_provider_docs` with the provider (`dataforseo`, `google_search_console`, …) — it returns the official API docs. Tool availability can vary by workspace; every skill here states its fallback.

## License

MIT. The skills and this repo are free forever. Data access runs through your own Ryze workspace and your own connected accounts.
