---
name: risk-assumption-mapping
description: >-
  Phase 8 of the discovery-phase pack. Makes implicit assumptions
  explicit across desirability, viability, feasibility, usability, and
  ethical/legal axes. Ranks them by impact-if-wrong × evidence-today and
  names the top 3 to retire before building. Produces
  risk-assumption-map.md. Consumes opportunity-tree.md.
track: core
phase: 8
produces: risk-assumption-map.md
consumes: opportunity-tree.md
origin: ECC
---

# Phase 8 — Risk & Assumption Mapping

Every chosen solution hides a stack of unstated assumptions. This phase surfaces them so the phase-9 scope and phase-10/11 PoC can target the riskiest ones deliberately.

## When to activate

- After phase 7 picks a solution direction.
- Before phase 9 (scope) — scope should concentrate effort on retiring the top assumptions.
- Re-run if phase 10 (spike) reveals new feasibility unknowns.

## Inputs

- `opportunity-tree.md` — chosen solution direction.
- `insight-matrix.md` — for evidence scoring.
- Team knowledge — this step benefits from both PM and engineering voices.

## Procedure

### Step 1 — Brainstorm assumptions across 5 axes
Ask, for the chosen solution:

- **Desirability** — do users actually want this? Would they pay (time / money / attention)?
- **Viability** — does this help the business? Margin, acquisition cost, retention, strategic fit?
- **Feasibility** — can we technically build it? Performance, data availability, model accuracy, scale?
- **Usability** — can users figure it out without hand-holding?
- **Ethical / legal** — privacy, consent, bias, compliance, accessibility floor.

Aim for 2–3 assumptions per axis. If an axis has zero, you're probably missing something — push harder.

### Step 2 — Score each assumption
Two dimensions:

- **Impact if wrong (1–5):** if this assumption is false, does the solution still work? 5 = fatal.
- **Evidence today (1–5):** how much data do we already have? 1 = pure speculation; 5 = prior-production-validated.

Leverage = Impact × (6 − Evidence). High leverage = high impact + low evidence = test first.

### Step 3 — Name the top 3 to retire
These 3 assumptions become explicit targets for phase 10 (spike) and/or phase 11 (PoC). If you can't retire the top 3 cheaply, that's a signal to KILL at phase 12.

### Step 4 — Design retire-by tests
Per top assumption:
- **Test method** — spike / PoC demo / fake-door / paper prototype / data analysis
- **Retire-by signal** — what observation confirms the assumption is safe
- **Kill signal** — what observation says the assumption is wrong and the project should stop

### Step 5 — Pre-commit to kill criteria
Before running any test, write the kill criterion explicitly. This prevents post-hoc rationalization when results are ambiguous.

## Output

`./discovery/risk-assumption-map.md` following the shared template.

## Handoff

Next phase: `scope-mvp-definition` (phase 9). The top 3 assumptions anchor the scope.

## Anti-patterns

- **Feasibility-only risks.** Engineers naturally list tech risks. Force desirability + viability + ethical — those kill more projects.
- **Risks without kill criteria.** A risk is a risk only if its failure would change behavior. If you'd build anyway, it's a concern, not a risk.
- **Generic assumptions.** "Users will like it" isn't testable. "5+ users will complete the core flow unassisted in <3 minutes" is.
- **Too many top assumptions.** If your "top 3" is actually 7, your solution is 7 bets disguised as 1 — cut scope first.

## Shared template

`orchestrator/templates/risk-assumption-map.md`
