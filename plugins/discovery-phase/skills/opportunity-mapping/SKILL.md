---
name: opportunity-mapping
description: >-
  Synthesis group skill. Builds a Teresa Torres-style
  opportunity-solution tree from the top-3 pain points. If the client
  pre-specified a solution, this skill validates that solution against
  alternatives rather than generating cold. Produces opportunity-tree.md.
  Reads discovery-context.md and insight-matrix.md.
group: synthesis
produces: opportunity-tree.md
consumes: discovery-context.md, insight-matrix.md
origin: ECC
---

# Opportunity Mapping

Turns the top pain points into opportunities and forces multiple candidate solutions before the team locks in. Two modes depending on whether the client already proposed a solution.

## Step 1 — Read discovery context + insights

Read `discovery-context.md`. Halt if missing.

Pull **2. Product / Initiative → Solution already proposed by client**. This drives mode selection.

Read `insight-matrix.md`. Halt if missing — without ranked insights, the tree has no anchor.

## Step 2 — Pick mode

| Section 2 says | Mode |
|---|---|
| No solution proposed | **Generate mode** — open brainstorm of solutions |
| Solution proposed by client | **Validate mode** — frame the proposed solution as ONE candidate, generate 2-3 alternatives, force comparison |

Tell the BA which mode is active and why. In Validate mode, this skill's job is partly political: the team needs to walk into the proposal/SoW with evidence either supporting the client's solution OR proposing a better one — silence equals "yes" to the client's existing idea.

## Step 3 — State the desired outcome

One sentence: metric + direction + timeframe. Pull from `problem-canvas.md` success signal, sharpened with insight-matrix evidence.

> "Reduce time-to-first-value from 3 days to under 1 hour, this quarter."

## Step 4 — Hang the opportunities

Each top-3 pain from insight-matrix becomes an opportunity branch. **In user language, not solution language.**

- ❌ "Add bulk import"
- ✅ "I spend 2 hours/day re-typing data from CSVs"

## Step 5 — Pick one opportunity to attack first

Don't attack all three in one cycle. Pick based on:

- Strongest evidence (frequency × intensity from insight-matrix)
- Highest strategic fit (per `discovery-context.md` section 1 Stage)
- Cheapest to test

Defer the others to a "next cycle" section.

## Step 6 — Generate candidate solutions

Generate 2-4 candidate solutions for the chosen opportunity. **Force diversity** along these dimensions:

- **Incremental** — extend client's existing product
- **Radical** — would require new infrastructure, ML, integrations
- **Buy / integrate** — wrap an existing tool, pay vendor, OSS
- **Do-nothing baseline** — better docs, scripts, contractors, no software

In **Validate mode**, the client's pre-proposed solution becomes one of these. Don't rig the others to lose — generate honestly.

## Step 7 — Score solutions

| Solution | Bet size (S/M/L) | Time to build | Problem-fit confidence (H/M/L) | Build feasibility (H/M/L) | Aligned with client priorities (per profile) |
|---|---|---|---|---|---|

The last column is critical for outsourcing. A radical solution might fit the problem perfectly but blow up the engagement timeline.

## Step 8 — Pick direction

One sentence justifying the chosen solution vs runner-ups, with citations to insight-matrix and competitive-scan (substitute risk).

In Validate mode, if the chosen direction is **NOT** the client's pre-proposed solution: name the gap explicitly and prepare the BA for the conversation. Pre-draft 2 sentences the BA can say to the client.

## Step 9 — Design 1-3 validation experiments

Each experiment must have:
- A clear test (concierge, landing page, clickable, paper prototype)
- A leading metric
- A **kill criterion** — what result means "don't build"

Experiments are days, not weeks. If an experiment needs >1 week, it's a `feasibility-spike` (validation group).

## Output

`./discovery/opportunity-tree.md` per `./template.md`.

Append to `_log.md`: `[opportunity-mapping | <date>] mode: <generate/validate>; opp attacked: <one-line>; chosen solution: <one-line>; experiments: <count>`.

## Anti-patterns

- **One solution per opportunity.** If you generated one, you didn't brainstorm. Force 3+.
- **All solutions same bet size.** All-incremental = anchored on status quo; all-radical = ignoring delivery realities.
- **Rigging Validate-mode against the client.** Generate the alternatives honestly. If the client's solution is best, document why; don't manufacture loss.
- **Experiments that can only confirm.** A good experiment can produce "no". If every outcome leads to "build it", you haven't designed an experiment.
- **Attacking 3 pains at once.** Sequence them.
