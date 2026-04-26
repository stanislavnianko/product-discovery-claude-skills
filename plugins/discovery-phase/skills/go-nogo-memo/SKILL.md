---
name: go-nogo-memo
description: >-
  Deliverables group skill. Produces a single GO / PIVOT / KILL memo
  consolidating all evidence into a one-page decision document. The only
  artifact most senior stakeholders read. Adapted for outsourcing —
  decision-owner is typically the client, agency provides recommendation
  with evidence chain.
group: deliverables
produces: go-no-go-memo.md
consumes: discovery-context.md, all available upstream artifacts
origin: ECC
---

# Go / No-Go Memo

The terminal decision document. Everything before this fed into it; everything after follows from it. In outsourcing, the **agency recommends**, the **client decides** — the memo must support both perspectives.

## When to run

- End of any discovery cycle
- Standalone if BA brings in evidence from elsewhere and just needs to write the memo
- Re-run after major new evidence (re-versioned)

Differs from `proposal`: proposal is commercial (here's what we'd do, please sign); memo is decisional (here's what we believe, please decide). They can co-exist.

## Step 1 — Read context + scan evidence

Read `discovery-context.md`. Halt if missing.

Pull **5. Expected deliverable** — must include "go-no-go memo" or be ambiguous.

Scan `./discovery/` for available artifacts. Even partial discovery can produce a memo, but flag the gaps.

## Step 2 — Force the decision first

Before writing anything, ask the BA:

> "Based on what we have, what's the recommendation: GO / PIVOT / KILL? One word. We'll justify on paper next."

If they hesitate or equivocate, probe:

- "What's the one finding that would flip this to the opposite answer?"
- "If you had to bet 10% of the agency's quarterly capacity (or your own time) on this, would you?"
- "Imagine this memo arrived from another team. Would you approve their recommendation?"

The memo serves the recommendation. No defensive prose.

## Step 3 — Outsourcing context: clarify decision split

Two roles must be explicit:

- **Recommendation owner** — the agency BA / lead. Owns the recommendation in the memo.
- **Decision owner** — typically the client (per `discovery-context.md` engagement). The memo gives them what they need to decide.

State both at top of memo. "We (agency) recommend X. Decision rests with `<named client decision-maker>`."

## Step 4 — Decision (line 1)

The first line of the memo: **"Recommendation: GO / PIVOT / KILL — `<one sentence why>`."**

Not in paragraph 3. Not buried in summary. Line 1.

## Step 5 — TL;DR (3 bullets)

For phone-readability:

- 
- 
- 

## Step 6 — Recommendation rationale (2 paragraphs max)

What should happen Monday morning. If GO: who, scope, ship window, success metric. If PIVOT: new hypothesis + what carries over. If KILL: one-sentence reason + trigger for reconsidering.

## Step 7 — Evidence chain

Link every artifact in `./discovery/`. A reader who disagrees with the recommendation can audit the chain in 20 minutes.

```
- [Discovery Context](./discovery-context.md)
- [Problem Canvas](./problem-canvas.md)
- [Insight Matrix](./insight-matrix.md)
- [Risk & Assumption Map](./risk-assumption-map.md)
- [Scope Doc](./scope-doc.md)
- [Tech Spike Report](./tech-spike-report.md) (if applicable)
- [Prototype Plan](./poc-plan.md) (if applicable)
- ...
```

## Step 8 — Key findings (3-5)

Each finding = one-sentence claim + one quote / data point. Quotable in future planning docs.

## Step 9 — Risks that remain

From `risk-assumption-map.md` rows NOT retired during discovery. With owner per row.

In outsourcing, distinguish:
- Risks the **client** owns post-decision
- Risks the **agency** owns if engagement converts

## Step 10 — Decision-specific section

Fill ONE; delete the others.

### If GO
- Proposed scope: link to `scope-doc.md`
- Proposed owner: 
- Proposed timeline: 
- First next step (this week): 
- Success metric + when measured: 
- Commercial path: link to `proposal.md` / `sow-draft.md` if applicable

### If PIVOT
- New hypothesis: 
- What changed our mind: 
- What artifacts carry over (interviews still valid? scope obsolete?): 
- Recommended next-cycle scope: 
- Estimated effort to re-discover: 

### If KILL
- One-sentence reason: 
- What would need to change for this to be worth revisiting: 
- Where this memo should be archived (so we don't re-ask in 6 months): 
- Resources released back to agency / client capacity: 

## Step 11 — Signatures

- Recommendation by (agency): name, role, date
- Decision by (client): name, role, date — **left blank until the client decides**
- Reviewers: 

## Output

`./discovery/go-no-go-memo.md` per `./template.md`. Update `DISCOVERY.md` index to "Cycle complete — recommendation: `<X>`; decision: pending/`<Y>`".

Append to `_log.md`: `[go-nogo-memo | <date>] recommendation: <GO/PIVOT/KILL>; decision-owner: <client/agency>; commercial path: <proposal/sow/handoff/none>`.

## Anti-patterns

- **"Needs more research."** Almost always KILL or PIVOT in disguise. Name it. If you genuinely need another cycle, name the specific question, the specific test, and the cost — otherwise "more research" is a graveyard.
- **GO by default.** Teams hate killing projects they researched. Apply the third-party test: "would you approve this if it came from another team?"
- **Buried recommendation.** Line 1, no exceptions.
- **Memo without evidence links.** Claims rot; linked claims survive.
- **Conflating recommendation and decision.** In outsourcing, agency recommends, client decides. Be explicit.
- **No risks-remain section.** This is where the engagement quietly fails post-launch. Capture them with owners.
