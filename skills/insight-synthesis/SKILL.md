---
name: insight-synthesis
description: >-
  Phase 6 of the discovery-phase pack. Consolidates raw interview notes
  and competitive-scan findings into ranked themes, top 3 pain points,
  and explicit surprises. Produces insight-matrix.md and themes.md.
  Consumes interview-notes and competitive-scan.
track: core
phase: 6
produces: insight-matrix.md, themes.md
consumes: interview-notes/*.md, competitive-scan.md
origin: ECC
---

# Phase 6 — Insight Synthesis

Turns a pile of raw notes into structured insights with frequency, intensity, and strategic fit scores. The output feeds the opportunity-solution tree in phase 7.

## When to activate

- After phase 4 (interviews) hits saturation **and** phase 5 (market scan) is complete.
- When the user says "we did the research, now what?" — this is the "now what".
- Re-run when new interviews land or when a competitor ships something relevant.

## Inputs

- All files in `./discovery/interview-notes/`.
- `./discovery/competitive-scan.md`.
- Original `problem-canvas.md` for reference — but do not anchor on it during synthesis.

## Procedure

### Step 1 — Affinity mapping (sticky-notes phase)
Read each interview note. For every distinct observation (pain, workaround, quote), create a one-line entry in a running scratch file `./discovery/_observations.md` with the participant reference:
```
- P03: "I keep a spreadsheet because the tool doesn't let me filter by region"
- P01: 15 min/day lost to manual status updates
- P05: uses three browser tabs to do what should be one workflow
```
Aim for 30–60 observations across 5–8 interviews.

### Step 2 — Cluster into themes
Group observations by underlying job, not by surface vocabulary. "Spreadsheet workaround" + "three browser tabs" + "manual status updates" might all cluster under "fragmented workflow across tools".

Target 5–8 themes. More than 10 means clusters are too narrow; fewer than 4 means too broad.

### Step 3 — Score the themes
Fill the insight matrix. For each theme:

- **Frequency:** count of distinct interviews mentioning it (not total mentions).
- **Intensity (1–5):** highest emotional intensity observed in any interview (use the `[!]` markers from notes).
- **Strategic fit (1–5):** alignment with the company's current priorities. Ask the user — this one requires org context.

Rank themes by `Frequency × Intensity × Strategic fit`.

### Step 4 — Name the top 3 pain points
The top 3 themes become the pain points we'll attack. For each, write:
- Who feels it (specific user segment)
- How often (daily / weekly / monthly)
- What breaks today
- What "good" would look like from their words
- One representative quote, verbatim

### Step 5 — Log surprises explicitly
A `Surprises` section in `insight-matrix.md` captures anything that contradicts the phase-1 hypothesis. Surprises often outrank the "confirmed" pains in strategic importance — flag them to the user even if they score low on the matrix.

### Step 6 — Log what we're dropping
The `Dropped themes` section keeps low-frequency observations from getting lost. If someone later says "did we hear about X?", this is where to look.

## Output

- `./discovery/insight-matrix.md` — the scored table plus top 3 detail.
- `./discovery/themes.md` — plain-language narrative summary, 1 page max. Used to brief stakeholders.

## Handoff

Next phase: `opportunity-solution-tree` (phase 7). The top 3 pain points become tree opportunities.

## Anti-patterns

- **Confirmation bias.** Re-read the phase-1 hypothesis *after* clustering, not during. Synthesize first, compare second.
- **Weighting by intensity alone.** One angry user ≠ a theme. Demand frequency ≥ 3 unless the user is a make-or-break segment.
- **Skipping surprises.** The insight that makes the team uncomfortable is usually the most valuable.
- **Synthesizing alone.** Affinity mapping is better with 2+ people. If solo, take a break between Step 1 and Step 2 to reset.

## Shared template

`orchestrator/templates/insight-matrix.md`
