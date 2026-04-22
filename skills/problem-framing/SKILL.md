---
name: problem-framing
description: >-
  Phase 1 of the discovery-phase pack. Turns a rough idea into a framed
  problem, target user, success signal, and testable hypothesis. Produces
  a problem-canvas.md. Activate when starting a discovery cycle or when
  stuck because the team is pitching solutions to an undefined problem.
track: core
phase: 1
produces: problem-canvas.md
consumes: none
origin: ECC
---

# Phase 1 — Problem Framing

Turns "I have an idea" into a testable hypothesis and a set of research questions. Sets the north star for the rest of the cycle.

## When to activate

- Start of any discovery cycle (called by the `orchestrator` skill).
- Team is debating solutions but can't agree — almost always a symptom of an unframed problem.
- User asks "what should we build?" — the right answer is usually "let's frame the problem first."

## Inputs

- Rough problem statement (one or two sentences from the user).
- Optional: related context (existing feature areas, prior research, strategic priorities).

## Procedure

### Step 1 — Forbid solutions
Open the session by stating the rule: **no solution words in this phase**. Catch and reframe when the user slips into solution-speak ("we should add a button…"). Redirect: "What outcome would the button produce? Why do they not get that outcome today?"

### Step 2 — Fill the canvas
Walk the user through the canvas template (see `./template.md` or the shared `templates/problem-canvas.md` in orchestrator). Sections to complete:

1. **Problem statement** — who / in what context / what outcome
2. **Why now** — what changed that makes this worth doing
3. **Target user** — role, segment, buyer vs end-user
4. **Current workaround** — how this is solved today
5. **Success signal** — metric + direction + rough magnitude
6. **Out of scope** — explicit exclusions
7. **Open questions** — 3–5 items research must answer

### Step 3 — Write the hypothesis
Render the canvas into a single sentence of the form:
> We believe that `<user>` experiences `<problem>` when `<context>`. Solving it would unlock `<outcome>`, measurable by `<signal>`.

### Step 4 — Pressure test
Apply these 4 checks. If any fails, loop back to the weak section:
- **Falsifiability:** what evidence would make us drop this hypothesis?
- **Specificity:** can we name a real person who has this problem?
- **Novelty:** does the current workaround already solve 80% of it? If yes, is the remaining 20% worth a project?
- **Alignment:** does "why now" match the company's current priorities? If no, surface this to the user before continuing.

## Output

Write `./discovery/problem-canvas.md` using the shared template. Append a 3-line exit summary to `DISCOVERY.md`.

## Handoff

Next phase: `stakeholder-alignment` (phase 2). Feed the filled canvas forward.

## Anti-patterns

- **"I already know the problem."** Ask them to write the hypothesis sentence. If they can't in 90 seconds, the problem is not framed.
- **Multi-problem canvas.** If the user crams 3 problems into one canvas, split into 3 canvases and pick one for this cycle.
- **Solution smuggled into success signal.** "Success = button click rate" is a solution metric. Push up one level: what is the button supposed to cause?

## Shared template

`orchestrator/templates/problem-canvas.md` — same content as this skill's local `template.md`; either is authoritative.
