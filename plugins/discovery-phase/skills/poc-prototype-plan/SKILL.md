---
name: poc-prototype-plan
description: >-
  Phase 11 of the discovery-phase pack (tech-poc track). Produces a
  construction plan plus a runnable PoC skeleton that proves the top 3
  assumptions in a realistic environment. Consumes scope-doc.md and
  tech-spike-report.md. Delegates multi-step construction planning to
  the blueprint skill.
track: tech-poc
phase: 11
produces: poc-plan.md and runnable skeleton under ./poc/
consumes: scope-doc.md, tech-spike-report.md
origin: ECC
---

# Phase 11 — PoC / Prototype Plan

Builds the minimum runnable thing that retires the top 3 assumptions in a realistic environment. Ends with a working demo script.

## When to activate

- Tech-poc track only.
- After phase 10 returns Green or Yellow.
- Skip if phase 10 returned Red.

## Inputs

- `scope-doc.md` — MVP job, in/out, success metrics.
- `tech-spike-report.md` — feasibility call and caveats.
- `risk-assumption-map.md` — the 3 assumptions this PoC must retire.

## Procedure

### Step 1 — State the PoC objective
One sentence. What task does the PoC complete, end to end, on the happy path?

Include what it does NOT do — the exclusion list prevents scope creep mid-build.

### Step 2 — Declare pre-committed success criteria
Before writing code, write what "the PoC succeeded" looks like:
- Happy-path completion time: `<N>` minutes
- `<N>` users complete unassisted
- Signal X crosses threshold Y

Without pre-commit, the team ships "it works" regardless of whether it works.

### Step 3 — Cut scope
The PoC is narrower than the MVP (which is narrower than the product). Use the in/out table with a "compared to scope-doc" delta column — everything cut from MVP scope should be cut MORE aggressively for the PoC.

### Step 4 — Architecture sketch
A 10-minute ASCII or mermaid diagram identifying:
- The PoC/production boundary (what gets thrown away, what could survive)
- External dependencies (auth, data stores, APIs)
- The happy path data flow

### Step 5 — Generate the construction plan
If the PoC is ≥3 build steps, delegate to the `blueprint` skill:
> "Use `blueprint` to generate a step-by-step construction plan for `<poc objective>` with the exclusions listed. Each step = one PR."

If <3 steps, write them inline.

### Step 6 — Scaffold the skeleton
Create `./discovery/poc/` with:
- `README.md` — how to run (3 commands max)
- `package.json` / `pyproject.toml` / equivalent
- Minimum working code for step 1 (get to "hello world in the target environment" fast)
- `.env.example` if secrets needed

A "skeleton" means the boring plumbing works: the dev can `npm run dev` / `uv run` / equivalent and see the frame of the app. No business logic yet.

### Step 7 — Write the demo script
Exactly what you'll click / type / show to validate the 3 assumptions, step by step. This becomes the phase-12 memo's "here's the evidence" exhibit.

### Step 8 — Tear-down plan
When and how this PoC gets deleted or upgraded to MVP. A PoC that can't be torn down becomes tech debt. Typical options:
- Delete after the GO/NO-GO decision, rebuild clean if GO
- Keep as a demo-only fork; product team rebuilds from scratch
- Harden to MVP if the spike and PoC were both Green (rare)

## Output

- `./discovery/poc-plan.md` — all steps above
- `./discovery/poc/` — runnable skeleton (step 1 of the construction plan)
- If blueprint was used: `./discovery/poc-plan-blueprint.md`

## Handoff

Phase 12 (`go-nogo-decision`) consumes the PoC plan and skeleton plus the demo-script outcome.

## Anti-patterns

- **Building the MVP.** A PoC proves assumptions; an MVP delivers value to users. Conflating them triples the build time.
- **No tear-down plan.** PoCs without explicit tear-down become production via inertia.
- **Polishing the UI.** If the assumptions are backend/data/model, UI polish is waste.
- **Demo script written after the build.** Writing it first forces the build to serve the demo, not a feature list.

## Shared template

`orchestrator/templates/poc-plan.md`
