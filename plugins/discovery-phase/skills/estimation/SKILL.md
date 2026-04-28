---
name: estimation
pack: discovery-phase
description: >-
  [discovery-phase pack · scoping] Translates a defined scope into an
  effort estimate broken down by discipline (Dev / QA / BA / PM / Design)
  × phase, with confidence intervals and explicit assumptions. Designed
  to feed proposal and sow-draft. Produces estimation.md. Reads
  discovery-context.md and scope-doc.md.
group: scoping
produces: estimation.md
consumes: discovery-context.md, scope-doc.md, risk-assumption-map.md (optional)
origin: ECC
---

# Estimation

> Part of the **discovery-phase** skill pack · `scoping` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Agency-style estimation: effort by discipline × phase, with low / expected / high ranges, and a list of assumptions that, if violated, invalidate the estimate. The output is the heart of any commercial proposal.

## Step 1 — Read context

Read `discovery-context.md` (sections **1. Client → Stage**, **3. Engagement → Mode** and **Budget context**, **6. Constraints**) and `scope-doc.md`.

If `discovery-context.md` is missing, ask the BA inline: "(a) greenfield or migration; (b) fixed-fee or T&M?" — tag the output `[ASSUMED ENGAGEMENT]`. If `scope-doc.md` is missing, ask for in/out scope bullets per area, or fall back to a class-of-magnitude estimate (S / M / L / XL) tagged `[NO-SCOPE]` — not for client use without a follow-up proper estimate. Never block; recommend `profile-builder` / `feature-scoping` for high-stakes work.

## Step 2 — Pick estimation method

Match to engagement timeline + scope size:

| Method | When | Effort to produce |
|---|---|---|
| **3-point parametric** | Standard for proposals; S/M/L scopes | 30-60 min |
| **Bottom-up by user story** | Detailed scope, large engagement | 2-4 hours |
| **Reference-class** ("we did X for Y, multiply by Z") | Repeat engagement, similar scope | 15-30 min |
| **Phased gates** | Long engagement; only first phase precise | 30 min for phase 1, range for rest |

Default to **3-point parametric** for discovery-phase outputs.

## Step 3 — Discipline × Phase matrix

Build the matrix. Adapt phases to engagement mode:

| Phase \ Discipline | BA | PM | Design | Dev (FE) | Dev (BE) | QA | DevOps | Total |
|---|---|---|---|---|---|---|---|---|
| Discovery follow-ups | | | | | | | | |
| Design (wireframe → high-fi) | | | | | | | | |
| Build phase 1 | | | | | | | | |
| Build phase 2 | | | | | | | | |
| QA / hardening | | | | | | | | |
| Launch / handoff | | | | | | | | |
| **Total per discipline** | | | | | | | | |

Numbers are person-hours or person-days. Pick one unit and stick to it.

## Step 4 — Three-point ranges

For every cell with non-trivial effort, capture:

- **Low** — best case, no surprises
- **Expected** — most likely
- **High** — top 10% case (NOT worst case — worst case is "kill")

Total each row and column. Sum row totals = sum of column totals = grand total (sanity check).

## Step 5 — Apply uncertainty multipliers

Per discipline, apply a multiplier reflecting estimate confidence:

| Confidence | Multiplier on Expected |
|---|---|
| Done this exact thing before | 1.0 |
| Familiar pattern, slight variation | 1.2 |
| Familiar tech, new domain | 1.5 |
| New tech + new domain | 2.0 |
| Bleeding edge / heavy R&D | 3.0 |

Show both raw and adjusted totals.

## Step 6 — Assumptions that invalidate the estimate

A bullet list of what must be true. If any becomes false, the estimate is void and re-estimation is required.

Typical:
- Scope-doc remains stable (no mid-build scope additions)
- Client provides decisions within 2 business days
- Existing tech stack: `<X>`
- Auth uses existing SSO (no new identity provider)
- Data volume below `<N>`
- Third-party APIs: `<list>` available with documented contracts
- Design assets / brand guidelines provided by client
- Single time zone overlap of 4+ hours daily

## Step 7 — Risk-driven contingency

Pull from `risk-assumption-map.md` (if present) the rows tagged `[agency]` or `[shared]`. For each, add a contingency line item:

| Risk | If realized, additional effort | Owner |
|---|---|---|

This becomes the basis for proposal "contingency budget" or T&M risk-pool conversations.

## Step 8 — Format for downstream skills

Format the output so `proposal` can pull headline numbers + assumption list verbatim, and `sow-draft` can pull the matrix + risk register.

## Output

`./discovery/estimation.md` per `./template.md`.

Append to `_log.md`: `[estimation | YYYY-MM-DD] method: <method>; total: <hours/days>; multiplier: <Xx>; contingency: <Y%>`.

## Anti-patterns

- **Single-number estimate.** Always 3-point. Stakeholders read the single number as a commitment.
- **No assumption list.** An estimate without listed assumptions = a commitment. Different commercial implications.
- **Padding via vague "buffer".** Be specific: "+20% because new domain", not "+20% buffer".
- **Estimating by hours when budget is in days.** Match the unit the client thinks in.
- **Hiding contingency.** If risks are real, name them with their cost. Hidden buffers fund themselves with worse risks later.
- **Estimating without a scope-doc.** Strongly preferred to run `feature-scoping` first; if you proceed via inline bootstrap, the estimate inherits any vagueness in the bullets — keep it tagged DRAFT-ONLY until a real scope doc exists.
