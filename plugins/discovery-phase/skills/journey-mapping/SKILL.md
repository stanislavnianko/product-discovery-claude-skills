---
name: journey-mapping
pack: discovery-phase
description: >-
  [discovery-phase pack · synthesis] Maps the end-to-end journey for a named
  persona — stages, actions, touchpoints, pain points, emotion line, and
  opportunity moments. Distinguishes current-state from future-state.
  Every pain point cites evidence; opportunities link back to
  opportunity-tree. Produces journey-map.md. Reads personas.md, themes.md,
  interview-notes/.
group: synthesis
produces: journey-map.md
consumes: discovery-context.md, personas.md, themes.md, interview-notes/, support-data-analysis.md
origin: ECC
---

# Journey Mapping

> Part of the **discovery-phase** skill pack · `synthesis` group · reads `personas.md` (run `personas` first if missing) and `themes.md` (from `insight-synthesis`).

Turns a persona's lived experience into a stage-by-stage map that surfaces where pain concentrates and where opportunity moments hide. Each pain point is evidence-anchored; each opportunity moment links back to the `opportunity-tree.md` so journey work doesn't drift from prioritized outcomes.

## Step 1 — Read context + upstream artifacts

Read `discovery-context.md`, `personas.md`, `themes.md`. If `personas.md` is missing, recommend running `personas` first — journeys without a named persona collapse to "the average user" and become useless. Don't block: the BA may proceed with `[ASSUMED-persona]` for a quick draft, but flag low confidence.

If `interview-notes/` exists, scan for chronological narrative — interviews where users walk through "and then I did…" are gold for journey reconstruction. If only `support-data-analysis.md` is available, the journey will be partial (post-purchase / support phase only).

## Step 2 — Set scope

Decide three things up-front; cram all three into one journey and the map becomes unreadable:

1. **Which persona** — pick exactly one. If you need journeys for two personas, run this skill twice.
2. **Which journey** — onboarding, repeat-purchase, support-resolution, evaluation, churn-recovery, etc. Name it precisely.
3. **Current-state or future-state** — current-state maps pain; future-state maps the proposed redesign. Default to current-state unless a feature-scoping decision depends on the future view.

State all three at the top of the artifact. They're constraints — if mid-skill you find yourself blending personas, stop and re-scope.

## Step 3 — Stages (3-7)

High-level phases the persona moves through. Examples by journey type:

| Journey | Typical stages |
|---|---|
| Onboarding | Discover → Sign up → First use → Habit formation |
| Repeat-purchase (B2C) | Trigger → Browse → Decide → Purchase → Receive → Use → Repurchase |
| Support resolution | Hit problem → Self-serve attempt → Contact support → Wait → Resolve |
| Enterprise evaluation | Awareness → Shortlist → Pilot → Internal sell → Procurement → Rollout |

3 stages = too coarse, 7+ = decompose further or split into two journeys.

## Step 4 — For each stage, fill the row

| Column | What goes here | Evidence required? |
|---|---|---|
| **Stage** | Phase name | — |
| **Actions** | What the persona literally does (verbs) | Light |
| **Touchpoints** | Channels / tools / people involved | Light |
| **Thinking / Goal** | What they're trying to accomplish in this stage | Strong |
| **Pain points** | What's broken — friction, confusion, fail | **Required** — cite [I-N], [support-id], [SME-name] |
| **Emotion (1-5)** | 1=frustrated, 3=neutral, 5=delighted | Strong |
| **Opportunity moments** | Where the product could intervene | Link to `opportunity-tree.md` |

If a row has no pain points but the persona is unhappy, the synthesis is wrong — either the emotion is overstated or you missed a pain. Loop back to evidence.

## Step 5 — Draw the emotion line

A simple sparkline across stages: `2 → 1 → 1 → 3 → 4`. The dips identify where the product's intervention has the highest leverage. If the line is flat, either the journey is uniformly OK (rare — and your scope is probably wrong) or you didn't probe deep enough.

## Step 6 — Identify intervention moments (top 3)

From the rows, pick the **top 3 opportunity moments** — places where a redesign would shift the emotion line most. Each must:

- Be tied to a specific stage and pain point
- Reference an opportunity in `opportunity-tree.md` (or flag as a new opportunity to add)
- Note what evidence makes this stage high-leverage (e.g., "8 of 12 interviews mentioned drop-off here")

These three moments become inputs to `feature-scoping` and `mvp-definition`.

## Step 7 — Pressure test (4 checks)

| Test | Question | Fix |
|---|---|---|
| **Persona-fit** | Does each stage make sense for the named persona? Or did you slide into "average user"? | Re-anchor on the persona's role/context |
| **Evidence per pain** | Every pain point has a citation? | Drop unsupported pains or escalate to "open question" |
| **Emotion grounded** | Is the emotion score derived from a quote, not a guess? | Replace guesses with quotes or `[ASSUMED]` |
| **Opportunity link** | Top-3 moments link to `opportunity-tree.md`? | Add to opportunity tree or revise — journeys that don't feed downstream are decoration |

## Step 8 — Write artifact

Output: `./discovery/journey-map.md` — see `./template.md`.

Append to `_log.md`: `[journey-mapping | YYYY-MM-DD] persona: <label>; journey_type: <onboarding|...>; state: <current|future>; stages: <N>; top_pain_count: <K>`.

## Anti-patterns

- **Feature-led journey.** "User clicks button → user sees screen" is a UX flow, not a journey. Lead from the persona's intent, not the product's UI.
- **Generic personas, generic journey.** Without a sharp persona, every stage becomes vague.
- **Missing emotion line.** Pure-cognitive journeys hide where redesign actually matters.
- **Future-state cosplay.** Future-state maps without an evidence-backed current-state are wishful thinking.
- **One mega-journey covering 12 stages.** Split. Always split.
- **Journey that doesn't feed `opportunity-tree.md`.** Journey work that doesn't change downstream decisions is decoration.
