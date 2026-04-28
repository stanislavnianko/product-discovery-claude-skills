---
name: insight-synthesis
pack: discovery-phase
description: >-
  [discovery-phase pack · synthesis] Consolidates whatever evidence was
  actually gathered (interview notes, SME workshops, support data,
  secondary research, competitive scan) into ranked themes and top-3 pain
  points with confidence-weighted scoring. Produces insight-matrix.md and
  themes.md. Reads discovery-context.md.
group: synthesis
produces: insight-matrix.md, themes.md
consumes: discovery-context.md, any of (interview-notes/, sme-notes/, support-data-analysis.md, secondary-research.md, competitive-scan.md)
origin: ECC
---

# Insight Synthesis

> Part of the **discovery-phase** skill pack · `synthesis` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Turns whatever evidence the BA managed to gather into structured insights — weighted by source quality so the team doesn't treat one SME's hunch as equal to five user interviews.

## Step 1 — Read discovery context

Read `discovery-context.md` (section **4. Access & Data**) to know what evidence to expect. If missing, ask the BA inline: "which evidence types should I expect — interviews / SMEs / tickets / secondary / competitive / mix?" — or weight all sources equally and tag the output `[NO-WEIGHTING-CONTEXT]`. Never block; recommend `profile-builder` for high-stakes work.

Then scan `./discovery/` for actually-present artifacts:
- `interview-notes/*.md` (direct evidence — highest weight)
- `sme-notes/*.md` (proxy evidence — medium weight)
- `support-data-analysis.md` (unsolicited signal — high weight)
- `secondary-research.md` (published data — variable weight by source)
- `competitive-scan.md` (market signal — context, not direct evidence)

If fewer than 2 sources are present, tell the BA: "Synthesis with single-source evidence is fragile. Consider running another evidence skill before this. Proceed anyway?"

## Step 2 — Affinity mapping (sticky-notes phase)

For every distinct observation across all sources, create a one-line entry in `./discovery/_observations.md`:

```
- [P03 | direct] "I keep a spreadsheet because the tool doesn't filter by region"
- [P01 | direct] 15 min/day lost to manual status updates
- [SME-Maria | inferred] "Users get stuck at the third step" (no specific user cited)
- [tickets | n=23] complaints about CSV export breaking
- [secondary | Gartner 2025] 60% of similar tools lack X
```

Tag each with `[source | confidence]`. Aim for 30-80 observations across all sources.

## Step 3 — Cluster into themes

Group by underlying job, not surface vocabulary. Target 5-8 themes. More than 10 = clusters too narrow; fewer than 4 = too broad.

## Step 4 — Score themes (confidence-weighted)

For each theme, compute:

- **Frequency** = count of distinct DIRECT sources mentioning it (weight: 3) + count of distinct PROXY sources (weight: 1). Aggregate = `direct × 3 + proxy × 1`.
- **Intensity (1-5)** = highest emotional intensity observed. Use `[!]` markers from interview notes; for tickets/NPS, language strength.
- **Strategic fit (1-5)** = alignment with **client's** quarterly priorities (per `discovery-context.md` section 1 Stage + section 2 Initiative). NOT agency's strategic fit.

Score = Frequency × Intensity × Strategic fit.

## Step 5 — Top 3 pain points

The 3 highest-scoring themes. For each, write:
- **Who feels it** (specific segment from observations)
- **How often** (daily / weekly / monthly)
- **What breaks today** (process step or moment)
- **What "good" would look like** in their words
- **Representative quote** (verbatim, with `[source]` tag)
- **Confidence** (high / med / low based on source mix)

## Step 6 — Surprises

Anything that **contradicts** problem-canvas hypothesis or `discovery-context.md` section 2 (client's stated initiative). Surprises often outrank confirmed pains in strategic importance — flag them prominently even if low-frequency.

If the client already proposed a solution and the data contradicts it, this is the most important section in the document. Spend extra care here — the proposal/sow-draft skills will need this evidence.

## Step 7 — Dropped themes

Low-frequency observations preserved here so they don't get re-discovered later in the engagement.

## Step 8 — Confidence summary

End with one paragraph: "Confidence in these insights is `<high/med/low>` because `<we have N direct interviews vs M SME workshops vs K analyzed tickets>`. The weakest claim in the matrix is `<X>` and would benefit from `<targeted follow-up>`."

This is critical for outsourcing — the BA must be able to say to the client "we believe X with high confidence; we believe Y with medium confidence and recommend Z to upgrade".

## Output

- `./discovery/insight-matrix.md` per `./template.md` (scored table + top-3 detail + surprises + dropped)
- `./discovery/themes.md` (1-page narrative summary, for stakeholder readout — written for client, not internal team)

Append to `_log.md`: `[insight-synthesis | YYYY-MM-DD] sources: <list>; themes: <N>; top3: <one-liners>; confidence: <high/med/low>; surprises: <count>`.

## Anti-patterns

- **Treating proxy evidence as primary.** SME hunch ≠ user quote. Confidence weighting must show through in the final ranking.
- **Confirmation bias.** Re-read problem-canvas hypothesis AFTER clustering, not during.
- **Ignoring contradictions.** Especially when the client proposed the solution. Hardest section to write; most important.
- **Single-source synthesis.** If only one source ran (e.g., only secondary research), confidence is structurally limited; say so.
- **Deferring "what would good look like"** to scoping. Capturing it in user-language now prevents feature-list scope creep later.
