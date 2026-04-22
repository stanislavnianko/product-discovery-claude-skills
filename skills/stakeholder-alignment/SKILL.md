---
name: stakeholder-alignment
description: >-
  Phase 2 of the discovery-phase pack. Maps stakeholders, captures their
  success criteria, and surfaces conflicts BEFORE research starts.
  Produces stakeholder-map.md. Consumes problem-canvas.md.
track: core
phase: 2
produces: stakeholder-map.md
consumes: problem-canvas.md
origin: ECC
---

# Phase 2 — Stakeholder Alignment

Projects that die mid-discovery usually die because a stakeholder surfaces a deal-breaker in week 4. This phase catches them in week 1.

## When to activate

- After phase 1 (problem-framing) produces a hypothesis.
- Before phase 3 (research-planning) — stakeholder input can reshape the research question.
- Again at phase 12 (go-nogo) if the stakeholder list has changed.

## Inputs

- `problem-canvas.md`
- Org context from the user: team structure, recent priorities, known political dynamics.

## Procedure

### Step 1 — List stakeholders
Identify 4–8 people who can say yes, no, or "not now" to this project. Categories to cover:
- **Decision-maker** — whose approval ships this
- **Budget owner** — who pays
- **Delivery owner** — who builds
- **Impacted teams** — whose work the result touches
- **Customer-facing owner** — support, CS, sales
- **Domain experts** — legal, compliance, security, accessibility
- **A sceptic** — the person most likely to block; include them before they block

### Step 2 — For each stakeholder, capture
| Field | Purpose |
|---|---|
| Name / role | |
| Their stake | What they win/lose from the outcome |
| Their success metric | How they'd know this is worth it |
| Their concerns | Quoted in their words where possible |
| Input needed from them (and when) | |
| Decision rights | Approve / veto / advise / inform |

### Step 3 — Surface conflicts
Read the "success metric" column. Conflicts often look like: sales wants "fast time-to-value", security wants "SSO integration shipped first", CS wants "no regressions in existing flows". Name the conflict on the map — don't try to resolve it yet.

### Step 4 — 15-minute async check-in
For each high-stakes stakeholder, send a 3-bullet async message:
1. The problem canvas one-liner.
2. "Here's what I think your success criterion is — right?"
3. "Anything you'd kill this project over? Say it now, not in 4 weeks."

Capture responses in the map.

### Step 5 — Set review cadence
Decide up front: how often do stakeholders see artifacts? Weekly async update is usually enough. Over-communicating early prevents re-litigation later.

## Output

`./discovery/stakeholder-map.md` with the table from Step 2 plus a "Conflicts to resolve" section and a review cadence decision.

## Handoff

Next phase: `user-research-planning` (phase 3). Review cadence starts now.

## Anti-patterns

- **Missing the sceptic.** If everyone on the map is supportive, the map is incomplete.
- **"We'll loop them in later."** Stakeholders who learn about a project in week 4 veto it in week 4. Cheaper to absorb the veto in week 1.
- **Treating the map as static.** Update after phase 6 synthesis and again before phase 12.
