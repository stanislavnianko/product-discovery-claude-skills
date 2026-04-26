---
name: secondary-research
description: >-
  Evidence group skill. Synthesizes published industry reports,
  benchmarks, regulatory filings, academic research, and analogous-domain
  case studies to substitute or augment direct evidence. Especially for
  engagements where user_access is none. Produces secondary-research.md.
  Reads discovery-context.md.
group: evidence
produces: secondary-research.md
consumes: discovery-context.md, problem-canvas.md (optional)
origin: ECC
---

# Secondary Research

Pull from published sources when primary research is constrained or unavailable. Standard tool for pre-sale discovery (no time/budget for primary), regulated domains (interview restrictions), and analogous-domain framing.

## Step 1 — Read discovery context

Read `discovery-context.md`. Halt if missing.

Pull **1. Client → Domain**, **6. Constraints**, **2. Product / Initiative**.
Read `problem-canvas.md` if it exists.

## Step 2 — Decide research scope

| Scope | Signal |
|---|---|
| **Industry baseline** | "We need to know what 'normal' looks like" |
| **Best practice / state-of-the-art** | "What have leading orgs done about this?" |
| **Regulatory / compliance** | "What's required vs forbidden?" |
| **Analogous domain** | "No data in our domain — can we borrow from `<adjacent>`?" |
| **Sizing / TAM** | "Is the opportunity even commercially worth it?" |

A good secondary-research run usually picks 2-3 of these.

## Step 3 — Delegate to web-research skills if available

If `deep-research` / `exa-search` / `market-research` are installed:
> "Use `deep-research` for `<scope>` in `<client domain>`. Surface: `<3-5 sub-questions>`. Output cited."

Without those, fall back to: industry analyst reports (Gartner, Forrester, McKinsey, BCG public excerpts), regulatory body publications (FDA, GDPR-EU, FCA, etc.), academic search (Google Scholar, arXiv), vendor whitepapers (treat with skepticism), conference proceedings, public earnings call transcripts (surprisingly rich for sizing).

## Step 4 — Capture findings with provenance

Per finding, capture:
- **Claim** — the specific assertion
- **Source** — URL, title, author, date
- **Source quality** — primary research / analyst report / vendor blog / forum / academic
- **Recency** — within 12 months / 1-3 years / older
- **Implication for our hypothesis** — supports / contradicts / orthogonal

## Step 5 — Confidence and gap statement

End the doc with two short sections:

- **What primary research would still be needed** — even after secondary, what's a desk research can't tell us
- **Confidence on each problem-canvas claim** — high / medium / low, with reasoning

## Step 6 — Analogous domain caveat

If using analogous domain (e.g., "no data on healthcare CRM, borrowing from financial-services CRM"): explicitly state where the analogy holds and where it breaks. Analogies smuggle wrong assumptions if not bounded.

## Output

`./discovery/secondary-research.md` per `./template.md`.

Append to `_log.md`: `[secondary-research | <date>] scopes: <list>; sources: <count>; supports/contradicts/orthogonal: <X/Y/Z>`.

## Anti-patterns

- **Vendor blog as primary source.** Treat as marketing, not data. Use only as "what they want you to think".
- **Old reports.** A 2020 SaaS benchmark is mostly irrelevant in 2026. Tag recency, prefer <18 months.
- **Stacking weak sources to fake strength.** Five vendor blogs ≠ one analyst report ≠ one peer-reviewed study. Don't conflate.
- **No "what's missing" section.** Without naming the gap, downstream synthesis assumes secondary is enough — usually wrong.
