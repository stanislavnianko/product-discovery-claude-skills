---
name: mvp-definition
description: >-
  Scoping group skill. Defines a Minimum Viable Product as a learning
  vehicle, not a feature-stripped product. Distinguishes MVP scope from
  PoC scope and from full-product scope. Often run after feature-scoping
  when the client conflates "MVP" with "first release". Produces
  mvp-definition.md.
group: scoping
produces: mvp-definition.md
consumes: discovery-context.md, scope-doc.md (optional), risk-assumption-map.md
origin: ECC
---

# MVP Definition

A clarifier skill — runs when "what is the MVP, exactly?" comes up. Distinguishes three levels: PoC (proves a tech assumption), MVP (proves a market assumption), v1 (delivers value at scale). Outputs an explicit comparison so the client and agency align before scope hardens.

## When to run this skill

- Client and agency disagree on what "MVP" means
- The team is conflating "stripped-down product" with "learning experiment"
- After `feature-scoping` to validate the scope is actually MVP-shaped
- During pre-sale conversations to align expectations

## Step 1 — Read context

Read `discovery-context.md`. Halt if missing.

Read `risk-assumption-map.md`; pull the top-3 assumptions to retire. These are what the MVP must validate.

Read `scope-doc.md` if it exists — the scope-doc and MVP-definition reinforce each other.

## Step 2 — Three-level table

Build the comparison.

| Level | Goal | Audience | Success criterion | Tear-down? | Lifespan |
|---|---|---|---|---|---|
| **PoC** | Retire 1-3 specific assumptions | Internal + maybe 5 friendlies | Assumption resolved (yes/no) | Yes, throwaway | Days-weeks |
| **MVP** | Validate market hypothesis | Real users (limited segment) | Leading metric crosses pre-committed threshold | Maybe — could harden if MVP wins | Weeks-months |
| **v1** | Deliver value at scale | Full target market | Lagging business metric (revenue, retention, NPS) | No | Open-ended |

Fill the rows specific to this engagement.

## Step 3 — State which level applies

Most discovery cycles end with one of:

- "We need a PoC first" → recommends `feasibility-spike` + `prototype-plan` from validation group
- "We're ready for MVP" → use `feature-scoping` + `proposal`/`sow-draft` 
- "v1 is appropriate" → unusual at end of discovery; re-check; usually means discovery validated existing solution

## Step 4 — Pre-committed MVP success criteria (if MVP level applies)

Two numbers. Without these, the MVP isn't an MVP — it's just a build.

- **Leading (during MVP window):** behavior that says "users want this"
- **Lagging (4-8 weeks post-launch):** outcome that says "this changed something"

## Step 5 — MVP exclusion list

What the MVP does NOT include — even though it'd be tempting to add. This is different from `scope-doc.md` "explicitly deferred":

- scope-doc deferred = "later release"
- MVP exclusion = "we'd be wasting money to include this in the *learning experiment*"

Examples: full UI polish, edge-case error handling, scale-grade infra, every integration, multi-language support, full a11y compliance.

## Step 6 — Tear-down decision

State up front: if the MVP **fails** its success criterion, what happens?

- Throwaway, return to pre-MVP state
- Keep as evidence artifact, don't operate
- Hand off to client for them to maintain (rare)

If the MVP **succeeds**, what's the path to v1?

- Harden in place
- Rebuild clean from scratch
- Hand off architecture decisions to delivery team

## Output

`./discovery/mvp-definition.md` per `./template.md`.

Append to `_log.md`: `[mvp-definition | <date>] applicable level: <PoC/MVP/v1>; success threshold: <leading + lagging>; tear-down: <yes/no>`.

## Anti-patterns

- **MVP as "v1 minus features".** That's not an MVP — that's a delayed v1. MVP is a *learning vehicle*.
- **No success threshold pre-committed.** Without it, every MVP "succeeds" on whichever metric looks best post-hoc.
- **Conflating PoC and MVP.** PoC retires tech risk for the team; MVP retires market risk against real users. Different audiences, different bars.
- **Open-ended tear-down.** "We'll see how it goes" — that's how MVPs become unmaintained zombies. Decide upfront.
