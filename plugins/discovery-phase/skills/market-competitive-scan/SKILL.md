---
name: market-competitive-scan
description: >-
  Phase 5 of the discovery-phase pack. Scans existing products,
  open-source tools, and adjacent workflows to understand what users are
  already exposed to and where the gap actually is. Produces
  competitive-scan.md. Consumes problem-canvas.md. Delegates web
  research to the deep-research or market-research skills if available.
track: core
phase: 5
produces: competitive-scan.md
consumes: problem-canvas.md
origin: ECC
---

# Phase 5 — Market / Competitive Scan

Runs in parallel with phase 4 (interviews). Answers: "What's already out there, and why haven't users adopted it for this problem?"

## When to activate

- After phase 2. Can run in parallel with phase 3 and 4.
- When the user proposes a solution and hasn't looked at what exists — a common failure mode.

## Inputs

- `problem-canvas.md` (target user, problem, current workaround).

## Procedure

### Step 1 — List the competitive set (3 layers)
1. **Direct competitors** — tools explicitly solving the same problem.
2. **Indirect competitors** — tools users mentioned as workarounds (phase 4 feeds this back).
3. **Adjacent workflows** — non-software ways people solve this (spreadsheets, email chains, contractors).

### Step 2 — Delegate web research (preferred)
If the `deep-research` or `market-research` skill is installed, invoke it:
> "Use `deep-research` to produce a cited scan of tools that do `<problem from canvas>` for `<user segment>`. Include pricing, last update date, and notable user complaints."

If those skills aren't available, fall back to:
- G2 / Capterra / Product Hunt for the category
- GitHub `topic:<keyword>` for open-source tools
- Reddit + Hacker News threads for user complaints
- Company blogs for positioning claims (vs reality)

### Step 3 — Score each entrant
Per tool, capture in the scan doc:

| Field | Notes |
|---|---|
| Name / URL | |
| Positioning (their words) | |
| Real-world use (from reviews) | Often differs from positioning |
| Pricing model | |
| Last meaningful release | Stale tools are often opportunities |
| Key limitation for our segment | |
| What they're great at | Don't flatter them, but be honest |

### Step 4 — Extract the gap
One paragraph: based on this scan, what job is NOT well-served for our target user? Cite specific gaps with links.

This gap is the opportunity — it feeds phase 7 (OST).

### Step 5 — Flag substitutes we can't outcompete
Sometimes the answer from the scan is "a free incumbent does 90% of this". Flag it. This is valuable signal for phase 12 — it may point to KILL.

## Output

`./discovery/competitive-scan.md`:
- Competitive-set table
- Gap paragraph
- Substitutes to respect

## Handoff

Phase 6 (`insight-synthesis`) consumes this alongside interview notes.

## Anti-patterns

- **Scanning by feature checklists.** Users buy outcomes, not features. Evaluate by "does this tool solve the job our canvas names?" — not by whether it has filter X.
- **Ignoring the "built it ourselves" workaround.** If your users built their own solution, that IS the competitor — study it.
- **Burying "we lose to the free thing" findings.** This is the most important signal the scan can produce. Call it out top of doc if true.
