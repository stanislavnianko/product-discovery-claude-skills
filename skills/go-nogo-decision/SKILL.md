---
name: go-nogo-decision
description: >-
  Phase 12 (terminal) of the discovery-phase pack. Consumes every prior
  artifact and produces a single GO / PIVOT / KILL memo with evidence
  links, key findings, remaining risks, and a Monday-morning next step.
  This is the only document most stakeholders will read.
track: core
phase: 12
produces: go-no-go-memo.md
consumes: all prior artifacts
origin: ECC
---

# Phase 12 — Go / No-Go Decision

Terminal phase. Produces the memo that ends the discovery cycle. Every prior artifact is evidence; this memo is the verdict.

## When to activate

- After phase 9 (scope) on the core track.
- After phase 11 (PoC plan / prototype) on the tech-poc track.
- Called by the `orchestrator` skill as the last step.
- Also callable standalone if the user has a cycle from another tool and just wants to write the memo.

## Inputs

Every file in `./discovery/`:
- problem-canvas, stakeholder-map, research-plan, interview-guide
- interview-notes/*
- competitive-scan, insight-matrix, themes
- opportunity-tree, risk-assumption-map, scope-doc
- (tech-poc) tech-spike-report, poc-plan, runnable PoC

## Procedure

### Step 1 — Decide first, write second
Before drafting, force the decision. Ask the user:
> "Based on what we learned, is this GO, PIVOT, or KILL? One word. We'll justify it on paper next."

If they hesitate or equivocate, probe:
- "What's the one finding that would flip this to the opposite answer?"
- "If you had to bet 10% of headcount on this, would you?"

The memo serves the decision, not the other way around. No defensive prose.

### Step 2 — Write the TL;DR
3 bullets, max. Problem, learning, next action. This is what stakeholders will read on their phone.

### Step 3 — Write the recommendation
2 paragraphs max. What should happen Monday morning. If GO: who, scope, ship window. If PIVOT: new hypothesis and what carries over. If KILL: reason in one sentence plus "what would need to change for this to be worth revisiting".

### Step 4 — Link every artifact
Walk the `./discovery/` directory and hyperlink every file under the **Evidence** section. A reader who disagrees with the decision should be able to audit the chain in 20 minutes.

### Step 5 — Extract key findings
3–5 bullets. Each is a sentence-long claim plus one quote or data point from the artifacts. These are what make the memo quotable in future planning docs.

### Step 6 — Name remaining risks
Any assumption from the risk-assumption-map that did NOT get retired. Owners need to know these exist and who should watch them. Don't paper over them — unclaimed risks are how projects quietly die post-launch.

### Step 7 — Fill the decision-specific section
Only fill the section matching the decision. Delete the other two from the final doc.

- **If GO:** proposed scope (link), owner, ship window, first next step, success metric.
- **If PIVOT:** new hypothesis, what changed your mind, what artifacts carry over vs get thrown out.
- **If KILL:** one-sentence reason, trigger for revisiting, archive location so we don't re-ask.

### Step 8 — Signatures
Footer: decided-by, date, reviewers. This is not ceremony; it gives the memo durability a year from now when someone asks "whose call was this?".

## Output

`./discovery/go-no-go-memo.md` using the shared template.

Also: mark `DISCOVERY.md` index as **Cycle complete — decision: `<GO/PIVOT/KILL>`**.

## Handoff

- **GO + tech-poc track:** link the runnable PoC at `./discovery/poc/` in the memo; hand the scope to delivery.
- **GO + core track:** memo goes to an engineering team for estimate + kickoff.
- **PIVOT:** loop the pack with the new hypothesis — start a fresh cycle at phase 1, reusing stakeholder-map and any interviews that still apply.
- **KILL:** archive the entire `./discovery/` folder under a stable path; commit the memo so it's searchable.

## Anti-patterns

- **"Needs more research."** This is almost always KILL in disguise; say it. If you genuinely need another cycle, name the specific question and the specific next test — otherwise "more research" becomes a graveyard.
- **GO by default.** Teams hate killing projects they've researched. Ask: if this memo arrived from another team, would you approve? If no, it's not GO.
- **Burying the decision.** The word GO/PIVOT/KILL must appear in line 1. Not in paragraph 3.
- **Memo without evidence links.** Claims without links rot; claims with links survive.

## Shared template

`orchestrator/templates/go-no-go-memo.md`
