---
name: feature-scoping
description: >-
  Scoping group skill. Translates the chosen solution direction and top
  risks into a tight, build-able scope with explicit in/out boundaries
  per area. Designed to be reusable as a chunk of a proposal or SoW.
  Produces scope-doc.md. Reads discovery-context.md, opportunity-tree.md,
  and risk-assumption-map.md.
group: scoping
produces: scope-doc.md
consumes: discovery-context.md, opportunity-tree.md, risk-assumption-map.md
origin: ECC
---

# Feature Scoping

The boundary-drawing skill. Output is a scope doc precise enough that engineering can estimate it and the client can sign off on it. Built to be paste-able into a proposal or SoW (commercial documents) with minimal rework.

## Step 1 — Read context (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull **3. Engagement** (timeline + budget context shape what's realistic), **5. Expected deliverable** (drives output framing), **6. Constraints**.

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Three options:
> 1. Run `profile-builder` first (recommended)
> 2. Bootstrap inline — I'll ask 2 questions: (a) timeline + budget shape (days / weeks / month / quarter), (b) any hard constraints (NDA / regulatory / tech-stack lock-in) (fast)
> 3. Proceed assuming a generic 4-week paid-discovery shape, tagged `[ASSUMED ENGAGEMENT]`"
>
> Which?"

Default to option 2. Never block.

Try to read `opportunity-tree.md`. If missing, tell the BA:
> "`opportunity-tree.md` missing. Three options: (1) run `opportunity-mapping` first (recommended), (2) tell me the solution direction in one line so I can scope against it, (3) proceed without solution framing — scope will be tagged `[NO-SOLUTION-DIRECTION]` and likely too generic to estimate cleanly."

Try to read `risk-assumption-map.md`. If missing, tell the BA:
> "`risk-assumption-map.md` missing. Scope-without-risk-context is fragile. Three options: (1) run `risk-assumption-mapping` first (recommended), (2) name 1–3 top assumptions to retire inline, (3) proceed without — scope will be feature-driven rather than assumption-driven and tagged `[NO-RISK-FRAME]`."

Default to option 2 in both cases. Never block.

## Step 2 — State the MVP job

One sentence. **"The scope lets `<user>` do `<task>` in `<context>`, such that `<top assumption from risk-map>` is retired."**

This anchors scope to assumption-retirement, not feature completeness.

## Step 3 — Draw the scope line — 11 areas

Every row must have BOTH `in` and `out`. Ambiguity is where mid-build scope creep lives. If a row is genuinely "TBD", say so explicitly with a deadline for resolution, but don't leave blanks.

| Area | In | Out |
|---|---|---|
| Users / segments | Which segment / seats | Which segments excluded |
| Core flow | The one happy path | Alternative flows |
| Auth | Existing SSO / new login | Role-based permissions |
| Data | Read / write, persistence | Migrations, historical data |
| Integrations | The 1 must-have | All others |
| UI polish | Rough / polished / designer-built | |
| Error handling | Which errors shown, which swallowed | |
| Observability | What we'll log to learn | Full prod telemetry |
| Platforms | Web / mobile / CLI | |
| Accessibility | A11y floor (e.g., keyboard-only ok, screen reader later) | |
| i18n | English-only or specific languages | |

## Step 4 — Define success metrics

Two pre-committed numbers:

- **Leading metric** — engagement signal during the build window (e.g., 40% of invited users complete core flow within 7 days)
- **Lagging metric** — the problem-canvas success signal at scope + 4 weeks

State pivot/kill thresholds (consumed by `go-nogo-memo` later).

## Step 5 — Rollout boundary

Pick one based on engagement mode (per `discovery-context.md` section 3):

- Pre-sale demo: agency-hosted, no real users
- Discovery-sprint output: client internal dogfood
- Delivery-phase MVP: 5-10 friendlies, % feature flag on real users, or separate URL/product
- Staff aug: mirror client's existing rollout pattern

Include a rollback criterion ("if metric X drops below Y in 48h, disable flag").

## Step 6 — Engineering size estimate

T-shirt: S (<1 wk), M (1-3 wk), L (>1 mo). If L, **loop back to Step 3** and cut. Discovery-sprint scopes should be S or M.

The actual hour-level estimate is `estimation` skill's job. This skill produces the t-shirt for early reality-check.

## Step 7 — Explicitly deferred list

5-15 bullet items titled "Explicitly deferred". This list gets referenced at every standup during build to prevent re-litigation. In a proposal/SoW context, this becomes the "Out of Scope" section.

## Step 8 — Outsourcing-specific extras

Add at bottom:

- **Assumptions of the client** (from `risk-assumption-map.md` rows tagged `[client]` or `[shared]`) — what the client must do/provide for this scope to be valid
- **Agency dependencies** — what the agency needs from third parties or other team members

These flow directly into the proposal "what we need from you" / "our dependencies" sections.

## Output

`./discovery/scope-doc.md` per `./template.md`. Designed to be reused — `proposal` and `sow-draft` skills will pull sections from here verbatim.

Append to `_log.md`: `[feature-scoping | <date>] MVP job: <one-line>; t-shirt: <S/M/L>; deferred items: <count>; client assumptions: <count>`.

## Anti-patterns

- **Scope by feature list.** Features without a user job create orphan UI. Lead with the job.
- **Open-ended MVP.** No date or success metric → not an MVP, just a build.
- **Hidden auth/data/integration changes.** "Just a small change to auth" is how 3-week projects become 3-month projects. Put it explicitly in `in` or `out`.
- **Scope identical to opportunity-tree.** OST names solutions; scope picks one slice of one solution. Same size = scope is too big.
- **Skipping assumptions/dependencies for outsourcing.** These exist in any internal scope too, but in outsourcing they become legally/commercially load-bearing. Be explicit.
