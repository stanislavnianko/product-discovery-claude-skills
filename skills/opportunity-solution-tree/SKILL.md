---
name: opportunity-solution-tree
description: >-
  Phase 7 of the discovery-phase pack. Builds a Teresa Torres-style
  opportunity-solution tree — desired outcome at the top, user
  opportunities below, candidate solutions below that, experiments at the
  bottom. Produces opportunity-tree.md. Consumes insight-matrix.md.
track: core
phase: 7
produces: opportunity-tree.md
consumes: insight-matrix.md
origin: ECC
---

# Phase 7 — Opportunity Solution Tree

Turns the 3 top pain points from synthesis into a tree: desired outcome → opportunities → candidate solutions → validation experiments. Forces the team to generate multiple solutions before picking one.

## When to activate

- After phase 6 produces a ranked insight matrix.
- Before anyone commits to building anything.
- Re-run if new insights arrive (phase 10 spike often triggers a re-branch).

## Inputs

- `insight-matrix.md` — top 3 pain points.
- `problem-canvas.md` — success signal (drives the outcome at the tree root).

## Procedure

### Step 1 — State the desired outcome
One metric, one direction, one timeframe. From the phase-1 success signal, made sharper.

> Example: "Reduce time-to-first-value from 3 days to under 1 hour, this quarter."

### Step 2 — Hang the opportunities
Each top-3 pain point becomes a branch. Opportunities MUST be stated in user language, not solution language.

- ❌ "Add bulk import feature"
- ✅ "I spend 2 hours a day re-typing data from CSVs"

### Step 3 — Pick the first opportunity to attack
Don't attack all three in one cycle. Pick one based on:
- Strongest evidence (frequency × intensity from insight matrix)
- Highest strategic fit
- Cheapest to test

Defer the others; they go into a "next cycle" section.

### Step 4 — Generate 2–4 candidate solutions
For the chosen opportunity, brainstorm solutions without filtering. Aim for diversity:
- One incremental (extend existing product)
- One radical (would require new infrastructure)
- One "do nothing" / "automate with scripts" baseline
- One "buy not build" (integrate an existing tool)

### Step 5 — Score solutions
Quick scorecard, 1 line per solution:

| Solution | Bet size | Time to build | Problem-fit confidence | Build-feasibility confidence |
|---|---|---|---|---|
| | S/M/L | days/weeks/months | H/M/L | H/M/L |

### Step 6 — Pick the direction
One sentence justifying the chosen solution vs the runners-up. Cite insight-matrix evidence.

### Step 7 — Design 1–3 validation experiments
Each experiment must have:
- A clear test (concierge, landing page, clickable, paper)
- A leading metric
- A kill criterion — what result means "don't build"

Experiments are lightweight — days, not weeks. If an experiment needs more than a week, it's a spike (phase 10).

## Output

`./discovery/opportunity-tree.md` following the shared template.

## Handoff

Next phase: `risk-assumption-mapping` (phase 8). The chosen solution's implicit assumptions become inputs.

## Anti-patterns

- **One solution per opportunity.** If you generated one, you haven't brainstormed. Force 3.
- **All solutions at the same bet size.** If all three are "small tweaks", you're anchored on the status quo.
- **Experiments that confirm instead of falsify.** A good experiment can produce a "no". If every outcome leads to "build it", you haven't designed an experiment.
- **Attacking all 3 pains at once.** Split focus produces 3 half-baked experiments. Sequence them.

## Shared template

`orchestrator/templates/opportunity-tree.md`
