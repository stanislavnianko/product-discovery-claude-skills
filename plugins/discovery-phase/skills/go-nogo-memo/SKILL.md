---
name: go-nogo-memo
pack: discovery-phase
description: >-
  [discovery-phase pack · deliverables] Produces a single GO / PIVOT /
  KILL memo consolidating all evidence into a one-page decision document.
  The only artifact most senior stakeholders read. Adapted for
  outsourcing — decision-owner is typically the client, agency provides
  recommendation with evidence chain.
group: deliverables
produces: go-no-go-memo.md
consumes: discovery-context.md, all available upstream artifacts
origin: ECC
---

# Go / No-Go Memo

> Part of the **discovery-phase** skill pack · `deliverables` group · reads `discovery-context.md` (run `profile-builder` first if missing).

The terminal decision document. Everything before this fed into it; everything after follows from it. In outsourcing, the **agency recommends**, the **client decides** — the memo must support both perspectives.

## When to run

- End of any discovery cycle
- Standalone if BA brings in evidence from elsewhere and just needs to write the memo
- Re-run after major new evidence (re-versioned)

Differs from `proposal`: proposal is commercial (here's what we'd do, please sign); memo is decisional (here's what we believe, please decide). They can co-exist.

## Step 1 — Read context + scan evidence

Read `discovery-context.md` (section **5. Expected deliverable**). Then scan `./discovery/` for available artifacts — even partial discovery can produce a memo, but flag the gaps explicitly in the memo's "Evidence" section.

If `discovery-context.md` is missing, ask the BA inline: "who's the decision-owner (client / agency / both) and what decision are we framing (proceed / pivot / kill)?" — tag the output `[ASSUMED FRAMING]`. Never block; recommend `profile-builder` for high-stakes work.

## Step 2 — Force the decision first

Before writing anything, ask the BA:

> "Based on what we have, what's the recommendation: GO / PIVOT / KILL? One word. We'll justify on paper next."

If they hesitate, probe:
- "What's the one finding that would flip this to the opposite answer?"
- "If you had to bet 10% of the agency's quarterly capacity (or your own time) on this, would you?"
- "Imagine this memo arrived from another team. Would you approve their recommendation?"

The memo serves the recommendation. No defensive prose.

## Step 3 — Clarify the decision split (outsourcing)

Two roles must be explicit:
- **Recommendation owner** — the agency BA / lead. Owns the recommendation in the memo.
- **Decision owner** — typically the client (per `discovery-context.md` engagement). The memo gives them what they need to decide.

State both at the top of the memo: *"We (agency) recommend X. Decision rests with `<named client decision-maker>`."*

## Step 4 — Fill the template

Fill `./template.md`. It owns the structure (recommendation line 1, TL;DR, rationale, evidence chain, key findings, risks-remaining, decision-specific GO/PIVOT/KILL section, signatures). This skill's job is the *content* — the template is the shape.

Key rules while filling:
- **Line 1** is the recommendation. Not buried, not in paragraph 3.
- **Evidence chain** links every artifact in `./discovery/`. A reader who disagrees can audit in 20 minutes. Mark missing artifacts explicitly (e.g., `~~Tech Spike Report~~ — not run`).
- **Key findings** = one-sentence claim + one quote / data point each. Quotable in future planning docs.
- **Risks-remain** comes from `risk-assumption-map.md` rows NOT retired during discovery, with owner per row. Distinguish client-owned (post-decision) vs agency-owned (if engagement converts).
- **Decision-specific section** — fill ONE (GO / PIVOT / KILL), delete the others.
- **Client decision signature** — leave blank until the client decides.

## Step 5 — Output + index update

`./discovery/go-no-go-memo.md` per `./template.md`. Update `DISCOVERY.md` (or `_log.md`) index entry to: *"Cycle complete — recommendation: `<X>`; decision: pending/`<Y>`"*.

Append to `_log.md`: `[go-nogo-memo | YYYY-MM-DD] recommendation: <GO/PIVOT/KILL>; decision_owner: <client/agency>; commercial_path: <proposal/sow/handoff/none>`.

## Anti-patterns

- **"Needs more research."** Almost always KILL or PIVOT in disguise. Name it. If you genuinely need another cycle, name the specific question, the specific test, and the cost — otherwise "more research" is a graveyard.
- **GO by default.** Teams hate killing projects they researched. Apply the third-party test: "would you approve this if it came from another team?"
- **Buried recommendation.** Line 1, no exceptions.
- **Memo without evidence links.** Claims rot; linked claims survive.
- **Conflating recommendation and decision.** In outsourcing, agency recommends, client decides. Be explicit.
- **No risks-remain section.** This is where the engagement quietly fails post-launch. Capture them with owners.
