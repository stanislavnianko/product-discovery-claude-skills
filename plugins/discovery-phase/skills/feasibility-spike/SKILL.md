---
name: feasibility-spike
description: >-
  Validation group skill. Time-boxed engineering investigation targeting
  the top feasibility assumptions from risk-assumption-map. Produces
  tech-spike-report.md and disposable code. Warns (does not halt) if no
  engineering capacity is reflected in the engagement context — output
  is tagged speculative if the BA chooses to proceed solo.
group: validation
produces: tech-spike-report.md
consumes: discovery-context.md, risk-assumption-map.md, scope-doc.md (optional)
origin: ECC
---

# Feasibility Spike

Kill the biggest technical risks cheaply. Throwaway by contract.

## Step 1 — Read context (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull **3. Engagement → Runner role**.

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Three options:
> 1. Run `profile-builder` first (recommended)
> 2. Bootstrap inline — I'll ask 1 question: who's running the spike (solo BA / BA + engineer / engineering lead)?
> 3. Proceed assuming engineering capacity is available, tagged `[ASSUMED ENGINEERING]`"
>
> Which?"

Default to option 2. Never block.

**Engineering capacity reality-check (warn + confirm, do not halt):**

If runner is **solo BA** with no engineering support listed, tell the BA:
> "⚠ Reality check: this skill assumes engineering capacity. Your context says runner is `<runner>`. Without an engineer the spike will produce a spike-shaped artifact with weak engineering signal. Four choices:
> 1. Loop in an engineer (update context with their name) — recommended
> 2. Defer the spike to post-contract / delivery phase
> 3. Skip and accept the feasibility risk explicitly in the proposal
> 4. Proceed solo anyway — output will get a `⚠ NO-ENGINEER-OVERRIDE` banner and findings tagged `[SPECULATIVE]`"
>
> Which?"

Never auto-halt. If the BA picks option 4, proceed and add the banner at the top of `tech-spike-report.md`.

Try to read `risk-assumption-map.md`.

**If present:** Anchor the spike to a specific assumption.

**If missing:** Tell the BA:
> "Heads-up: `risk-assumption-map.md` is missing. A spike without an assumption is exploration, not a spike. Three options:
> 1. Run `risk-assumption-mapping` first (recommended)
> 2. Bootstrap inline — name 1–3 feasibility assumptions to test in one sentence each (fast)
> 3. Proceed as open exploration — output will be tagged `[EXPLORATION-NOT-SPIKE]` so reviewers know it's not assumption-driven"
>
> Which?"

Default to option 2. Never block.

## Step 2 — State spike goal

One sentence. Tie to a specific assumption from risk-map.

> Example: "Prove we can extract structured events from free-text emails with ≥80% precision using a single Claude API call."

## Step 3 — Time box

| Tier | When |
|---|---|
| **Short — 4 hours** | Ruling out a "is this even possible?" question |
| **Standard — 1-2 days** | Validating a specific approach against representative inputs |
| **Escalated — up to 1 week** | Genuinely unknown territory; requires explicit BA + engineering lead sign-off |
| **>1 week** | This is no longer a spike. Re-frame as `prototype-plan`. |

Stop at the time box. Overrunning spikes are how discovery bleeds into delivery.

## Step 4 — Narrowest test

- Use **production-representative inputs**, not cherry-picked
- Throwaway branch / repo named `spike/<topic>` — never merge to main
- Prefer manual scripting over frameworks (frameworks hide what you're testing)
- Logging is essential; UI is irrelevant

## Step 5 — Build minimum, run, measure

Capture:
- What worked, with evidence (screenshots, logs, numbers)
- What didn't, with same
- Surprises — especially newly-discovered constraints
- Rough performance, latency, cost per operation

## Step 6 — Feasibility call

Three outcomes only:

- **Green** — proceed to PoC / MVP as scoped
- **Yellow** — feasible with caveats; caveats become PoC scope constraints
- **Red** — blocker. Escalate before building anything. Options:
  - Re-scope (loop `feature-scoping`)
  - Different solution (loop `opportunity-mapping`)
  - KILL or PIVOT in `go-nogo-memo`

In outsourcing, a Red call before contract = save the engagement (don't sell what can't be built). After contract = harder; either renegotiate scope or eat the loss.

## Step 7 — Archive + tear down

Commit spike code under `./discovery/spike/<topic>/`. Do **NOT** merge to product code. Document tear-down status — was the spike code disposed of, kept as reference, or repurposed?

## Output

- `./discovery/tech-spike-report.md` per `./template.md`
- `./discovery/spike/<topic>/` — disposable code

Append to `_log.md`: `[feasibility-spike | <date>] goal: <one-line>; box: <hours>; result: <green/yellow/red>; constraints: <list>`.

## Anti-patterns

- **Spike without an assumption.** That's exploration. Useful sometimes, but don't mislabel.
- **Merging spike code.** Spike code skips error handling, tests, polish. Shipping = silent tech debt.
- **Overrun.** "Just one more hour" violates the rule. Stop, report yellow, decide.
- **Hiding red.** A failed spike is a saved project. Surface it; celebrate it.
- **Spike with no time box.** That's R&D. Different cost structure.
- **Skipping prerequisite check** (engineering capacity in context). BA running this solo will produce a spike-shaped artifact with zero engineering signal.
