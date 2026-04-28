---
name: risk-assumption-mapping
pack: discovery-phase
description: >-
  [discovery-phase pack · synthesis] Surfaces implicit assumptions across
  desirability, viability, feasibility, usability, and ethical/legal
  axes. Ranks by impact-if-wrong × evidence-today. Names top 3 to retire
  before scoping. In outsourcing, also distinguishes client-owned vs
  agency-owned vs shared risks. Produces risk-assumption-map.md.
group: synthesis
produces: risk-assumption-map.md
consumes: discovery-context.md, opportunity-tree.md
origin: ECC
---

# Risk & Assumption Mapping

> Part of the **discovery-phase** skill pack · `synthesis` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Every chosen solution rides on unstated assumptions. This skill makes them visible. In outsourcing, also clarifies **whose** risk each one is — agency / client / shared — because this drives proposal language and SoW structure.

## Step 1 — Read context

Read `discovery-context.md` (sections **3. Engagement**, **6. Constraints** — shape what counts as a risk) and `opportunity-tree.md` (anchors risks to a solution direction).

If `discovery-context.md` is missing, ask the BA inline: "(a) engagement mode (pre-sale / paid discovery / delivery / staff aug); (b) any regulatory or ethical constraints (GDPR / HIPAA / SOC2 / accessibility floor / none)?" — or proceed tagged `[NO-OWNERSHIP]` (risks listed flat, not split client/agency/shared). If `opportunity-tree.md` is missing, ask: "what solution direction are we evaluating, in one line?" — or brainstorm risks against the problem and tag `[NO-SOLUTION-FRAME]`. Never block; recommend `profile-builder` / `opportunity-mapping` for high-stakes work.

## Step 2 — Brainstorm by 5 axes

Aim for 2-3 assumptions per axis. If an axis has zero, push harder.

- **Desirability** — do users actually want this? Will they pay (money / time / political capital)?
- **Viability** — does this help **the client's** business? Margin, CAC, retention, strategic fit
- **Feasibility** — can the agency / client team technically build it? Performance, data, ML accuracy, integration
- **Usability** — can users figure it out unassisted?
- **Ethical / legal** — privacy, consent, bias, regulatory (per context section 6), accessibility floor

## Step 3 — Score each assumption

| Field | Note |
|---|---|
| Assumption (specific, falsifiable) | "Users will accept a 5-step onboarding" not "users will like onboarding" |
| Impact if wrong (1-5) | 5 = solution doesn't work at all if false |
| Evidence today (1-5) | 1 = pure speculation; 5 = prior production validation |
| Leverage = Impact × (6 − Evidence) | Higher = test first |
| Test method | Spike / PoC / fake-door / paper / data analysis |
| Retire-by signal | Specific observation that confirms safety |
| **Kill signal** | Specific observation that means "don't build" |

## Step 4 — Tag risk owner (outsourcing-specific)

Per assumption, mark:

- **`[client]`** — client carries the risk (e.g., "client's user base will grow" — agency can't influence)
- **`[agency]`** — agency carries it (e.g., "we have engineers with ML experience" — client can't fix)
- **`[shared]`** — both (e.g., "client's data quality is good enough" — agency can validate, client must improve)

This tagging shapes the proposal: agency-owned risks → priced into the proposal as agency contingency. Client-owned risks → become assumptions/exclusions in the SoW. Shared risks → flagged in proposal "what we need from you" section.

## Step 5 — Top 3 to retire before building

Highest-leverage 3 assumptions. These become explicit targets for:
- `feasibility-spike` (validation group) for technical assumptions
- `prototype-plan` for product/UX assumptions
- Additional evidence-gathering for desirability assumptions
- Workshops / contracts for shared/client assumptions

## Step 6 — Pre-commit kill criteria

For each top-3 assumption, write the kill criterion **before** running any test:

> "If fewer than 30% of test users complete the core flow unassisted within 3 minutes, we don't build."

Without pre-commit, post-hoc rationalization eats the discovery.

## Step 7 — Risk register summary for proposal/SoW

Add a section the deliverable skills will consume:

| Risk | Owner | Mitigation if not retired during discovery |
|---|---|---|

This becomes the input to `proposal` and `sow-draft` risk sections.

## Output

`./discovery/risk-assumption-map.md` per `./template.md`.

Append to `_log.md`: `[risk-assumption-mapping | YYYY-MM-DD] axes: 5; total: <N>; client_owned: <N>; agency_owned: <N>; shared: <N>; top3: <list>`.

## Anti-patterns

- **Feasibility-only risks.** Engineers default to tech risks. Force desirability + viability + ethical — those kill more outsourced projects than tech does.
- **Risks without kill criteria.** A risk you'd build through anyway is a concern, not a risk.
- **Generic assumptions.** "Users will like it" is untestable. "5+ users will complete the core flow unassisted in <3 min" is.
- **Skipping owner-tagging.** In outsourcing, who-owns-the-risk drives commercial structure. Without tags, proposal language gets fuzzy and the agency eats client risks.
- **Top-3 that's actually 7.** If your top-3 has 7 entries, the solution is 7 bets disguised as 1 — cut scope first via `feature-scoping`.
