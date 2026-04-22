---
name: orchestrator
description: >-
  Master orchestrator for the discovery-phase skill pack. Drives a team
  from a rough idea through 12 phases (frame → research → synthesize →
  scope → spike → PoC → decide) to either a working prototype or a
  documented GO/PIVOT/KILL memo. The tech-PoC track (phases 10–11) is
  skippable when feasibility is already known. Activate when a user is
  starting a new project, feature, or initiative and wants a structured
  validation cycle before committing to delivery.
origin: ECC
---

# Discovery-to-PoC Orchestrator

Entry point for the `discovery-phase` pack. Runs a structured 12-phase cycle, invoking one phase skill at a time, producing a named artifact per phase, and gating between phases with an exit summary.

## When to activate

- User opens a new project/feature and the problem or solution is not yet validated.
- User asks for a "discovery plan", "validation cycle", or "PoC roadmap".
- User wants help deciding whether to build something.

**Do not activate** when the problem and solution are already well-understood and the user just wants to build. In that case, route to delivery/engineering skills directly.

## Inputs (intake)

Ask exactly 3 short questions before starting:

1. **Problem one-liner** — "In one sentence, what problem are you exploring?"
2. **Users** — "Who experiences this problem? (role / segment)"
3. **Tech-PoC needed?** — "At the end of discovery, do you need a working prototype or runnable PoC, or just a go/no-go decision?"

Based on (3), set:
- `track = core` → run phases 1–9, 12. Skip 10–11.
- `track = core+tech-poc` → run all 12 phases.

## The 12 phases

| # | Skill | Track | Produces |
|---|---|---|---|
| 1 | `problem-framing` | core | `problem-canvas.md` |
| 2 | `stakeholder-alignment` | core | `stakeholder-map.md` |
| 3 | `user-research-planning` | core | `research-plan.md`, `interview-guide.md` |
| 4 | `user-interviews` | core | `interview-notes/*.md` |
| 5 | `market-competitive-scan` | core | `competitive-scan.md` |
| 6 | `insight-synthesis` | core | `insight-matrix.md`, `themes.md` |
| 7 | `opportunity-solution-tree` | core | `opportunity-tree.md` |
| 8 | `risk-assumption-mapping` | core | `risk-assumption-map.md` |
| 9 | `scope-mvp-definition` | core | `scope-doc.md` |
| 10 | `tech-feasibility-spike` | tech-poc | `tech-spike-report.md` |
| 11 | `poc-prototype-plan` | tech-poc | `poc-plan.md` + runnable skeleton |
| 12 | `go-nogo-decision` | core | `go-no-go-memo.md` |

Full artifact templates live in `./templates/`. A visual flow diagram is in `./assets/flow.md`.

## Execution protocol

### Step 1 — Plan
Write a TodoWrite list with one entry per phase in the chosen track. Mark phases 10–11 as skipped if `track = core`. Create a working directory `./discovery/` in the user's project (or a dated subfolder if re-running).

### Step 2 — Create the running index
Create `./discovery/DISCOVERY.md` as the pack's running index:
```
# Discovery Cycle — <problem one-liner>
Started: <date>  |  Track: <core | core+tech-poc>

## Artifacts
- [ ] Phase 1 — problem-canvas.md
- [ ] Phase 2 — stakeholder-map.md
- ...
```
Link each artifact as it lands.

### Step 3 — Run phases sequentially
For each phase in order:
1. Invoke the phase skill by name (e.g., "use the `problem-framing` skill").
2. Feed it the prior phase's artifact(s) as input (see `consumes` in each phase's frontmatter).
3. Save the output artifact(s) under `./discovery/` and link from `DISCOVERY.md`.
4. Write a **3-line phase exit summary**:
   - What was learned
   - What is the next question
   - What assumption got flagged (if any)

### Step 4 — Gate between phases
After each exit summary, offer 3 choices:
- **proceed** → next phase
- **loop** → re-run the current phase with new inputs
- **skip** → jump to the next phase (mark current as skipped in the index)

Never advance silently; require user confirmation at each gate for phases that produce expensive artifacts (3, 4, 11). Skip the gate for cheap synthesis phases (6, 7, 8) unless the user asks for control.

### Step 5 — Terminal phase (12)
`go-nogo-decision` consumes all artifacts and produces `go-no-go-memo.md` with one of:
- **GO** — solution is worth building; memo includes the MVP scope and next step.
- **PIVOT** — problem is real but the hypothesized solution is wrong; memo names the new direction.
- **KILL** — evidence says don't build; memo captures why, to prevent re-asking.

If `GO` **and** `track = core+tech-poc`: the runnable skeleton from phase 11 is linked in the memo.

## Reuse — skills and agents to delegate to

- **Phase 5 (market-competitive-scan)** — delegate the web research to the existing `deep-research` or `market-research` skills if installed; don't re-implement.
- **Phase 4 (user-interviews)** — if a transcript tool or notetaking MCP is available, use it.
- **Phase 10 (tech-feasibility-spike)** — if the problem is code-heavy, delegate to `Explore` / `feature-dev:code-explorer` agents.
- **Phase 11 (poc-prototype-plan)** — use `blueprint` skill to generate the construction plan for the PoC skeleton.

## Anti-patterns

- **Skipping phase 1.** "I already know the problem" almost always means the team has a solution in mind, not a framed problem. Run phase 1 even if it takes 10 minutes.
- **Running interviews without a guide.** Phase 3 is non-optional whenever phase 4 runs.
- **Jumping to phase 9 (scope) from phase 1.** Scope without insight is speculation.
- **Building a PoC without phase 8 (risks).** The PoC exists to retire the top risk; you must name the risk first.

## Output contract

When the cycle completes, the user has:
- `./discovery/DISCOVERY.md` — running index with links to every artifact.
- 10–12 artifact files (depending on track and skips).
- `./discovery/go-no-go-memo.md` — the terminal decision.
- If GO + tech-poc: a runnable skeleton in `./discovery/poc/`.
