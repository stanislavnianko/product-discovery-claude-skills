---
name: proposal
description: >-
  Deliverables group skill. Generates a client-facing proposal document
  consolidating problem understanding, recommended approach, scope,
  assumptions, dependencies, team, timeline, and headline pricing
  guidance. Designed for pre-sale or paid-discovery conclusion.
  Produces proposal.md. Reads discovery-context.md and most upstream
  artifacts.
group: deliverables
produces: proposal.md
consumes: discovery-context.md, problem-canvas.md, scope-doc.md, estimation.md, risk-assumption-map.md, opportunity-tree.md (optional)
origin: ECC
---

# Proposal

Agency-to-client proposal document. The output the client reads, signs (or doesn't), and budgets against.

## Step 1 — Read context + prerequisites (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull **3. Engagement → Mode** (if mode is staff aug or internal, suggest `discovery-handoff` instead — but allow override) and **5. Expected deliverable**.

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Three options:
> 1. Run `profile-builder` first (recommended)
> 2. Bootstrap inline — I'll ask 2 questions: (a) engagement mode (pre-sale / paid discovery / other), (b) client name + sector (fast)
> 3. Proceed with generic engagement framing, tagged `[ASSUMED]`"
>
> Which?"

Default to option 2. Never block.

**Prerequisite artifacts:** Try to read these. They're the proposal's substance.

- `scope-doc.md` — scope language
- `estimation.md` — effort + assumption list
- `risk-assumption-map.md` — risk register

Strongly recommended:
- `problem-canvas.md` — anchors problem statement
- `opportunity-tree.md` — supports recommended-approach narrative

**If any required artifact is missing**, tell the BA:
> "Heads-up: missing prerequisite artifacts: `<list>`. A proposal without scope or estimation is unusable for client signature. Three options:
> 1. Run the prerequisite skills first (`feature-scoping`, `estimation`, `risk-assumption-mapping`) — recommended for any client-facing proposal
> 2. Bootstrap inline — for each missing artifact, give me 3–5 bullets I can use as a stand-in (fast, suitable for internal draft only)
> 3. Proceed with `[ASSUMED <artifact>]` placeholder sections — output marked DRAFT-ONLY at the top, NOT for client send"
>
> Which?"

Default to option 2 if 1–2 artifacts missing. If 3+ missing, recommend option 1 explicitly. Never block — but the auto-applied DRAFT-ONLY banner is non-removable when option 3 is picked.

## Step 2 — Pick proposal style

| Style | When | Length |
|---|---|---|
| **Executive brief** | Senior client decision-maker, pre-sale, time-pressured | 2-3 pages |
| **Detailed proposal** | Procurement / RFP response, larger engagement | 8-12 pages |
| **Pitch deck** | Initial conversation; supplements verbal pitch | Doc + companion deck |

Default to **executive brief** unless context section 3 (Mode) implies RFP.

## Step 3 — Required sections (in this order)

1. **Cover** — engagement title, client name, agency name, date, version, primary contact
2. **TL;DR** — 3-4 bullets max. The client should be able to forward just this.
3. **Problem we'd solve** — one paragraph from `problem-canvas.md`, in client-language. NOT in agency-language.
4. **What we learned (if discovery happened already)** — 3-5 bullets from `insight-matrix.md` top-3 with one quote each. Supports the recommendation.
5. **Recommended approach** — what we'd build, why this and not alternatives. Pull from `opportunity-tree.md` chosen-direction. If client pre-proposed a different solution and our recommendation differs, **handle this section carefully** — see step 4.
6. **Scope** — pull "in" column from `scope-doc.md`. Include the success metrics.
7. **Out of scope** — pull "out" column + "explicitly deferred". Crucial — prevents post-contract scope wars.
8. **Approach / phases** — high-level timeline aligned to discipline matrix from `estimation.md`. Show milestones, not all tasks.
9. **Team** — who from agency works on what. Pull discipline columns from estimation.
10. **Timeline** — calendar weeks, key milestones, decision points
11. **Effort and pricing guidance** — from `estimation.md` adjusted total. **Range, not a number.** Specify whether fixed-fee, T&M, or phased.
12. **What we need from you** — the client-side assumptions and dependencies (from `scope-doc.md` outsourcing extras + `risk-assumption-map.md` `[client]`/`[shared]` rows)
13. **Risks and how we'll handle them** — from `risk-assumption-map.md` register, prioritized
14. **Assumptions** — verbatim from `estimation.md` "Assumptions that invalidate the estimate"
15. **Next steps** — concrete, signable: "we'll send a SoW within 5 business days of your verbal yes" or similar

## Step 4 — Handle "we recommend something different than client asked"

If `opportunity-tree.md` was Validate-mode and chose against client's pre-proposed solution:

- Section 5 **leads with empathy**: "You came to us with `<client's idea>`. Here's what we learned and where it took us."
- Section 5 **shows the alternatives** — including client's idea — with honest scoring.
- Don't pretend the client's idea was never on the table; that breaks trust.
- Pre-draft the BA-to-client conversation script as an appendix the BA can rehearse.

## Step 5 — Voice and tone

- Client-language, not agency-language. "We'll do X" → "We'll help you do Y for users".
- No internal jargon ("MVP", "v1", "story points"). Translate to client terms ("first release", "subsequent release", "effort estimate").
- Active voice. Short sentences. The client is busy.
- No buzzwords ("synergy", "leverage", "best-in-class"). They lower trust.

## Step 6 — Output

`./discovery/proposal.md` per `./template.md`.

Append to `_log.md`: `[proposal | <date>] style: <executive/detailed/pitch>; total range: <X-Y>; sent to: <client contact>`.

## Anti-patterns

- **Buried scope.** Scope (and out-of-scope) are the two most-read sections. Don't hide them in section 11.
- **Single-number price.** Always range. Single number = commitment.
- **Hiding "what we need from you".** This is where the engagement actually lives or dies. Be explicit.
- **Including discovery's open questions** as "we'll figure this out". Either resolve them before proposal or surface them as risks.
- **Agency-internal language.** "Sprint 1, 2, 3" → "First 3 weeks". "Deliverable D1" → describe it in plain terms.
- **No alternatives in Validate-mode handling.** If you recommend differently than client asked, show your work. Hiding it = lost trust.
