---
name: tech-feasibility-spike
description: >-
  Phase 10 of the discovery-phase pack (tech-poc track). Time-boxed
  engineering spike targeting the top feasibility assumptions from
  phase 8. Produces tech-spike-report.md and throwaway code. Consumes
  scope-doc.md and risk-assumption-map.md. Skipped on the core-only
  track.
track: tech-poc
phase: 10
produces: tech-spike-report.md
consumes: scope-doc.md, risk-assumption-map.md
origin: ECC
---

# Phase 10 — Technical Feasibility Spike

Kill the biggest technical risks cheaply before committing engineering capacity to the PoC (phase 11). The spike is throwaway by contract.

## When to activate

- Only if the `orchestrator` is running the tech-poc track.
- After phase 9 (scope).
- When the risk-assumption-map has at least one top-3 assumption on the feasibility axis.
- Skip this phase if feasibility is green across the board (rare; usually means the team hasn't looked hard enough).

## Inputs

- `scope-doc.md` — what the MVP needs to do.
- `risk-assumption-map.md` — the specific feasibility assumptions to target.

## Procedure

### Step 1 — State the spike goal in one sentence
> Example: "Prove we can extract structured events from free-text emails with ≥80% precision using a single model call."

Tie the goal to a specific assumption. No assumption → no spike.

### Step 2 — Set the time box
- Short spike: 4 hours
- Standard: 1–2 days
- Escalated: 1 week (requires explicit user sign-off; if you're thinking "2 weeks", you're designing a PoC, not a spike)

Stop when the time box elapses regardless of progress. Overrunning spikes are the #1 way discovery bleeds into delivery.

### Step 3 — Choose the narrowest possible test
- Use production-representative inputs, not cherry-picked.
- Use a throwaway repo or a branch named `spike/<topic>` — never merge to main.
- Prefer manual/scripted over frameworks. Frameworks obscure what you're testing.

### Step 4 — Build the minimum
Just enough code to observe the behavior. UI is irrelevant. Logging is essential.

### Step 5 — Run and measure
Capture:
- What worked (with evidence — screenshots, logs, numbers)
- What didn't (same)
- Surprises — especially constraints you didn't know existed
- Rough performance / latency / cost

### Step 6 — Make the feasibility call
Three outcomes only:
- **Green:** ship the PoC as scoped.
- **Yellow:** feasible with caveats (list them — often becomes the phase-11 scope constraints).
- **Red:** blocker. Escalate before phase 11 starts. Escalation options:
  - Re-scope (back to phase 9)
  - Try a different solution (back to phase 7)
  - KILL at phase 12

### Step 7 — Archive and tear down
Commit the spike code under `discovery/spike/` for future reference. Do NOT merge to product code. Document tear-down status.

## Output

`./discovery/tech-spike-report.md` + spike code under `./discovery/spike/`.

## Handoff

- **Green / Yellow:** proceed to phase 11 (`poc-prototype-plan`). Yellow caveats become PoC scope constraints.
- **Red:** return to the orchestrator; likely loops phase 7 or jumps to phase 12 (KILL).

## Anti-patterns

- **Spike without an assumption.** If you can't name the assumption the spike retires, you're just exploring. That's fine, but don't call it a spike.
- **Merging spike code.** Spike code skips error handling, tests, and polish by design. Shipping it creates silent tech debt.
- **Over-running the time box.** "Just one more hour" is a rule-violation. Stop, report yellow, and decide.
- **Hiding the red result.** A failed spike is a saved project. Celebrate it to your team so the culture rewards early negative signals.

## Shared template

`orchestrator/templates/tech-spike-report.md`
