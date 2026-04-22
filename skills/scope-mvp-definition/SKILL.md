---
name: scope-mvp-definition
description: >-
  Phase 9 of the discovery-phase pack. Turns the chosen opportunity and
  retired assumptions into a tight MVP scope with explicit in/out, success
  metrics, and rollout boundaries. Produces scope-doc.md. Consumes
  opportunity-tree.md and risk-assumption-map.md.
track: core
phase: 9
produces: scope-doc.md
consumes: opportunity-tree.md, risk-assumption-map.md
origin: ECC
---

# Phase 9 — Scope / MVP Definition

Turns "we want to solve X for Y" into a build-able scope. The goal is a scope that's tight enough to ship in weeks, not months, and narrow enough that the next interview with a user is a measurable experiment.

## When to activate

- After phase 7 (opportunity-solution-tree) picks a direction and phase 8 (risk-assumption-map) names the assumptions to retire.
- Before any engineering estimate happens. Estimates before scope are always wrong.
- Re-run if phase 10 (spike) surfaces constraints that force re-scoping.

## Inputs

- `opportunity-tree.md` — chosen solution direction and proposed experiments.
- `risk-assumption-map.md` — top 3 assumptions to retire.
- `insight-matrix.md` — for pain-point framing.

## Procedure

### Step 1 — State the MVP job
One sentence. "The MVP lets `<user>` do `<task>` in `<context>`, such that `<assumption>` is retired."

This forces scope to serve assumption-retirement, not feature completeness.

### Step 2 — Draw the scope line
Fill the in/out table across these areas. Every row must have both an `in` and `out` entry — ambiguity causes mid-build scope creep.

| Area | In | Out |
|---|---|---|
| Users | Which segment, which seats | Which segments excluded |
| Core flow | The one happy path | Alternative flows |
| Auth | Existing SSO / new login | Role-based permissions |
| Data | Read / write, persistence | Migrations, historical data |
| Integrations | The 1 must-have | Everything else |
| UI | Rough / polished / designer-built | |
| Error handling | Which errors are shown, which are swallowed | |
| Observability | What we'll log to learn | Full production telemetry |
| Platforms | Web / mobile / CLI | |
| Accessibility | A11y floor (e.g., keyboard-only ok, screen reader later) | |
| i18n | English-only | |

### Step 3 — Define success metrics
Two numbers, pre-committed:
- **Leading metric:** engagement signal during the MVP window (e.g., 40% of invited users complete the core flow within 7 days).
- **Lagging metric:** the phase-1 success signal, measured at MVP + 4 weeks.

State what would cause a PIVOT or KILL in phase 12 language.

### Step 4 — Rollout boundary
Who gets the MVP first? Options:
- Internal dogfood
- 5–10 friendlies by email
- A % feature flag on real users
- A separate URL / product

Write the plan. Include a rollback criterion ("if metric X drops below Y in 48h, disable flag").

### Step 5 — Size it
A rough T-shirt for engineering: S (<1 week), M (1–3 weeks), L (1+ month). If L, loop back to step 2 and cut scope. Discovery MVPs should be S or M.

### Step 6 — Name what we're NOT doing
A bullet list titled "Explicitly deferred" with 5–15 items. This list gets referenced at every standup during the build to prevent re-litigation.

## Output

`./discovery/scope-doc.md` with the structure above.

## Handoff

- If core track: next is `go-nogo-decision` (phase 12). The scope doc becomes the "if GO" section.
- If tech-poc track: next is `tech-feasibility-spike` (phase 10). The MVP scope is the spike's context.

## Anti-patterns

- **Scope by feature list.** Features without a user job create orphan UI. Lead with the job.
- **Open-ended MVP.** If the MVP has no end date or success metric, it's not an MVP, it's a build.
- **Hidden dependencies.** "We just need a small change to auth" is how 3-week projects become 3-month projects. Put auth changes in the "in" column explicitly or declare them out.
- **Scope copied from the opportunity tree.** The OST names solutions; the scope doc picks one slice of one solution. If they're the same size, the scope is too big.
