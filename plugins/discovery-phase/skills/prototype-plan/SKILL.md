---
name: prototype-plan
pack: discovery-phase
description: >-
  [discovery-phase pack · validation] Plans a runnable prototype that
  retires the top assumptions in a realistic environment. Differs from
  MVP by being internally-scoped (limited audience, throwaway by default).
  Includes demo script. Produces poc-plan.md and a runnable skeleton
  scaffold. Reads discovery-context.md.
group: validation
produces: poc-plan.md, ./discovery/poc/ (runnable skeleton)
consumes: discovery-context.md, scope-doc.md, risk-assumption-map.md, tech-spike-report.md (optional)
origin: ECC
---

# Prototype Plan

> Part of the **discovery-phase** skill pack · `validation` group · reads `discovery-context.md` (run `profile-builder` first if missing).

A prototype proves user/product assumptions in a realistic environment. Built minimally, demoed deliberately, torn down by contract.

## Step 1 — Read context

Read `discovery-context.md` (section **3. Engagement** — mode + budget drive prototype ambition), `scope-doc.md` (prototype is a slice of MVP scope), `risk-assumption-map.md` (top-3 assumptions), and optionally `tech-spike-report.md`.

If `discovery-context.md` is missing, ask the BA inline: "who's running the prototype build — solo BA / BA + engineer / engineering lead?" — tag `[ASSUMED]`. If `scope-doc.md` is missing, proceed tagged `[NO-SCOPE-DOC]`. If `risk-assumption-map.md` is missing, ask for 1–3 assumptions inline or proceed tagged `[NO-RISK-FRAME]`. Never block; recommend `profile-builder` / `feature-scoping` / `risk-assumption-mapping` for high-stakes work.

**Reality checks (warn + confirm, do not halt):**
- If `tech-spike-report.md` says feasibility is **Red**, warn that the prototype will test politics, not tech. Offer: resolve the blocker first (re-spike / re-scope / pivot via `opportunity-mapping`), defer to delivery, or proceed with a `⚠ RED-FEASIBILITY-OVERRIDE` banner and aggressive tear-down plan.
- If context shows **no engineering capacity**, warn that the plan will be conceptual rather than runnable. Offer: loop in an engineer, defer to delivery, switch to `feasibility-spike` (smaller), or proceed solo with a `⚠ NO-ENGINEER-OVERRIDE` banner — Step 7 (runnable skeleton) will be skipped or stubbed.

## Step 2 — State the prototype objective

One sentence. End-to-end happy path.

> "The prototype lets a single SMB admin import a CSV, see preview, and confirm — in one session, on real data."

## Step 3 — Pre-committed success criteria

Before any code:

- Happy-path completion time: `<N>` minutes
- `<N>` users complete unassisted
- Specific signal `<X>` crosses threshold `<Y>`

Without pre-commit, the team will declare success regardless.

## Step 4 — Cut scope (delta vs scope-doc)

The prototype is narrower than the MVP scope. Build a scope delta table:

| Area | MVP scope | Prototype scope | Why cut |
|---|---|---|---|

Cut MORE aggressively than feels comfortable. Polished UI, edge errors, scale, integrations — all default OUT for prototype.

## Step 5 — Architecture sketch

10-minute ASCII or mermaid. Identify:

- The prototype/production boundary (what's throwaway vs what could survive)
- External dependencies
- Happy-path data flow

## Step 6 — Generate construction plan

If the prototype is ≥3 build steps:

> "Use `blueprint` to generate a step-by-step construction plan for `<prototype objective>` with the listed exclusions. One PR per step."

If <3 steps, list inline.

## Step 7 — Scaffold runnable skeleton

Create `./discovery/poc/` containing:

- `README.md` with **3 commands max** to run it
- `package.json` / `pyproject.toml` / equivalent
- Minimum working code for step 1 — get to "hello world in target environment" fast
- `.env.example` if secrets needed

Skeleton means **plumbing works**: dev can `npm run dev` / `uv run` and see the frame. Business logic comes in later steps.

## Step 8 — Demo script

Exactly what the BA / PM clicks, types, shows during the demo. Step by step. This becomes the phase-end exhibit consumed by `go-nogo-memo` / `proposal` / `discovery-handoff`.

Per step: action → expected result → the assumption it retires.

## Step 9 — Tear-down plan

Pre-commit:

- **If prototype validates** — what happens? (rebuild for MVP / harden in place / hand off)
- **If prototype invalidates** — when is it deleted, and what evidence is preserved?

A prototype with no tear-down plan becomes accidental production via inertia.

## Output

- `./discovery/poc-plan.md` per `./template.md`
- `./discovery/poc/` runnable skeleton

Append to `_log.md`: `[prototype-plan | YYYY-MM-DD] objective: <one-line>; success_criteria: <list>; build_steps: <count>; demo_ready: <yes/no>`.

## Anti-patterns

- **Building the MVP.** Prototype proves assumptions; MVP delivers value. Conflating them triples build time.
- **No tear-down plan.** Prototypes become production via inertia.
- **Polishing the UI** when assumptions are about backend / data / model.
- **Demo script written after build.** Writing demo first forces the build to serve the demo, not a feature list.
- **Skipping pre-committed success criteria.** Without them, "the prototype works" becomes whatever's most defensible post-hoc.
