---
name: personas
pack: discovery-phase
description: >-
  [discovery-phase pack · synthesis] Builds 2-4 evidence-backed user personas
  from interview notes, SME workshops, support data, and secondary research.
  Forces every trait to cite a source — no invented demographics. Produces
  personas.md. Reads discovery-context.md, themes.md, interview-notes/,
  sme-notes/, support-data-analysis.md.
group: synthesis
produces: personas.md
consumes: discovery-context.md, themes.md, interview-notes/, sme-notes/, support-data-analysis.md
origin: ECC
---

# Personas

> Part of the **discovery-phase** skill pack · `synthesis` group · reads `discovery-context.md` (run `profile-builder` first if missing) and the evidence artifacts produced by the `evidence` group.

Turns evidence into 2-4 distinguishable user archetypes that downstream skills (`journey-mapping`, `opportunity-mapping`, `feature-scoping`) can target. Refuses to invent traits — every claim must cite a source. If evidence is thin, says so explicitly and tags fields `[ASSUMED]` rather than fabricating.

## Step 1 — Read context + evidence

Read `discovery-context.md` (sections **2. Product / Initiative**, **3. Users / Stakeholders**, **4. Discovery Access Level**). Then enumerate available evidence in `./discovery/`:

- `themes.md` (from `insight-synthesis`) — primary input
- `interview-notes/` — quote source
- `sme-notes/` — proxy when end users unreachable
- `support-data-analysis.md` — behavioral evidence
- `secondary-research.md` — segment-level signals

If `themes.md` is missing, recommend running `insight-synthesis` first. Don't block — but warn the BA that personas built directly from raw interview notes (without synthesis) often duplicate themes incorrectly.

If `discovery-context.md` is missing, ask inline: "(a) what's the buyer vs end-user split? (b) B2B / B2C / B2B2C? (c) any segments the client already named?" — tag unverified personas as `[ASSUMED]`.

## Step 2 — Decide how many

Default: **2-4 personas**. Hard cap at 4. Rationale:

- 1 persona → not a synthesis, you don't need this skill
- 2-3 → typical for focused B2B and B2C
- 4 → multi-sided marketplace or B2B2C with distinct buyer/user/admin
- 5+ → diminishing returns; collapse near-duplicates

If the BA insists on 5+, push back: "Which two could collapse without losing strategic distinction?"

## Step 3 — Pick the right archetype model

Match the engagement context:

| Context | Persona model |
|---|---|
| B2C product | Behavioral (jobs-to-be-done + context) |
| B2B SMB | Role-based, single buyer = end user |
| B2B Enterprise | Buyer + Champion + End-user + Admin (often 3-4) |
| Marketplace | Supply + Demand + Operator |
| Internal tool | Role + Permission tier |

Avoid demographic-led personas ("Marketing Mary, 35, latte drinker") — they're the cargo-cult version. Lead with **what they're trying to accomplish** and **what stops them**.

## Step 4 — Draft each persona

For each persona, fill these fields. Every non-empty field must cite at least one evidence source (e.g., `[I3, I7]` for interview 3 and 7, `[support-2024Q3]`, `[SME-ops-lead]`).

1. **Label** — role-based name (`Operations Lead at 50-200 person ecom`), not first-name fiction
2. **Context** — where they work, what decisions they own, what tools they live in
3. **Top jobs** — 2-3 jobs-to-be-done in their words, prioritized
4. **Pain points** — what's broken today, with frequency/severity if known
5. **Current workaround** — how they cope (Excel, manual, competitor, doing nothing)
6. **Decision criteria** — what tips them from "interesting" to "I'll buy/use"
7. **Watch-outs** — what would make them disengage (price, complexity, security review, change-management)
8. **Evidence count** — `N interviews + M support tickets + K SME mentions`. Be honest: if N=0, this persona is `[ASSUMED]`.

## Step 5 — Pressure test (4 checks)

| Test | Question | Fix |
|---|---|---|
| **Distinguishability** | Could you tell two personas apart from a quote alone? | Sharpen jobs/context — they're too overlapping |
| **Evidence backing** | Does every persona have ≥3 evidence citations? | Drop or merge under-evidenced personas |
| **Action-relevance** | Does each persona drive a different design or scoping decision? | If two personas → same scope, merge them |
| **Buyer/user honesty** | In B2B, is the buyer separated from the end user where they differ? | Split into two personas if decisions and pain diverge |

If 2+ tests fail, loop back. Don't ship watered-down personas — they mislead `journey-mapping` and `feature-scoping` downstream.

## Step 6 — Write artifact

Output: `./discovery/personas.md` — see `./template.md`.

Append to `_log.md`: `[personas | YYYY-MM-DD] count: <N>; evidence_strength: <strong|mixed|thin>; assumed_count: <K>`.

## Anti-patterns

- **Demographic-only personas.** Age, hobbies, coffee preference are noise unless they drive a decision.
- **Inventing names and photos.** Persona is a synthesis tool, not a creative-writing exercise.
- **One persona per feature.** Personas describe users, not modules.
- **"The average user".** If you can't pick a primary persona, you didn't synthesize — you averaged.
- **Persisting personas without evidence refresh.** When new interviews come in, update or retire.
- **Skipping the buyer.** In B2B, ignoring the economic buyer is the most common reason proposals lose.
