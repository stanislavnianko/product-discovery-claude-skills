---
name: prototype-plan
description: >-
  Validation group skill. Plans a runnable prototype that retires the
  top assumptions in a realistic environment. Differs from MVP by being
  internally-scoped (limited audience, throwaway by default). Includes
  demo script. Produces poc-plan.md and a runnable skeleton scaffold.
  Reads discovery-context.md.
group: validation
produces: poc-plan.md, ./discovery/poc/ (runnable skeleton)
consumes: discovery-context.md, scope-doc.md, risk-assumption-map.md, tech-spike-report.md (optional)
origin: ECC
---

# Prototype Plan

A prototype proves user/product assumptions in a realistic environment. Built minimally, demoed deliberately, torn down by contract.

## Step 1 — Read context

Read `discovery-context.md`. Halt if missing.

Pull **3. Engagement** (mode + budget context drive prototype ambition).
Read `scope-doc.md` — prototype is a slice of MVP scope.
Read `risk-assumption-map.md` for the top-3 assumptions.
Read `tech-spike-report.md` if it exists. If feasibility was Red, halt and tell user to resolve before building.

## Step 2 — Engineering capacity check

Same gate as `feasibility-spike`: if context shows no engineering capacity, halt and ask the BA to either loop in engineering or defer to post-contract.

## Step 3 — State the prototype objective

One sentence. End-to-end happy path.

> "The prototype lets a single SMB admin import a CSV, see preview, and confirm — in one session, on real data."

## Step 4 — Pre-committed success criteria

Before any code:

- Happy-path completion time: `<N>` minutes
- `<N>` users complete unassisted
- Specific signal `<X>` crosses threshold `<Y>`

Without pre-commit, the team will declare success regardless.

## Step 5 — Cut scope (delta vs scope-doc)

The prototype is narrower than the MVP scope. Build a scope delta table:

| Area | MVP scope | Prototype scope | Why cut |
|---|---|---|---|

Cut MORE aggressively than feels comfortable. Polished UI, edge errors, scale, integrations — all default OUT for prototype.

## Step 6 — Architecture sketch

10-minute ASCII or mermaid. Identify:

- The prototype/production boundary (what's throwaway vs what could survive)
- External dependencies
- Happy-path data flow

## Step 7 — Generate construction plan

If the prototype is ≥3 build steps:

> "Use `blueprint` to generate a step-by-step construction plan for `<prototype objective>` with the listed exclusions. One PR per step."

If <3 steps, list inline.

## Step 8 — Scaffold runnable skeleton

Create `./discovery/poc/` containing:

- `README.md` with **3 commands max** to run it
- `package.json` / `pyproject.toml` / equivalent
- Minimum working code for step 1 — get to "hello world in target environment" fast
- `.env.example` if secrets needed

Skeleton means **plumbing works**: dev can `npm run dev` / `uv run` and see the frame. Business logic comes in later steps.

## Step 9 — Demo script

Exactly what the BA / PM clicks, types, shows during the demo. Step by step. This becomes the phase-end exhibit consumed by `go-nogo-memo` / `proposal` / `discovery-handoff`.

Per step: action → expected result → the assumption it retires.

## Step 10 — Tear-down plan

Pre-commit:

- **If prototype validates** — what happens? (rebuild for MVP / harden in place / hand off)
- **If prototype invalidates** — when is it deleted, and what evidence is preserved?

A prototype with no tear-down plan becomes accidental production via inertia.

## Output

- `./discovery/poc-plan.md` per `./template.md`
- `./discovery/poc/` runnable skeleton

Append to `_log.md`: `[prototype-plan | <date>] objective: <one-line>; success criteria: <list>; build steps: <count>; demo script ready: <yes/no>`.

## Anti-patterns

- **Building the MVP.** Prototype proves assumptions; MVP delivers value. Conflating them triples build time.
- **No tear-down plan.** Prototypes become production via inertia.
- **Polishing the UI** when assumptions are about backend / data / model.
- **Demo script written after build.** Writing demo first forces the build to serve the demo, not a feature list.
- **Skipping pre-committed success criteria.** Without them, "the prototype works" becomes whatever's most defensible post-hoc.
