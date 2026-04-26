---
name: discovery-handoff
description: >-
  Deliverables group skill. Hands discovery findings to a delivery team
  (could be same agency squad in delivery phase, different agency, or
  client internal team). Captures decisions made, open questions, risks
  transferred, evidence chain. The "what we know vs what we don't"
  document. Produces discovery-handoff.md.
group: deliverables
produces: discovery-handoff.md
consumes: discovery-context.md, all upstream artifacts available
origin: ECC
---

# Discovery Handoff

When discovery ends and delivery begins — possibly with a different team. This document is the bridge. Reading it cold should be enough to start delivery work.

## When to run

- End of paid discovery sprint, transitioning to delivery contract
- End of pre-sale discovery, transitioning to client's internal team (PIVOT/KILL or "we'll do it ourselves" outcomes)
- Mid-engagement transition between agency teams
- Post-discovery internal handoff (PM → engineering)

Distinct from `proposal` (commercial) and `go-nogo-memo` (decision). Handoff is **operational**.

## Step 1 — Read context + scan available artifacts

Read `discovery-context.md`. Halt if missing.

Scan `./discovery/` directory for what's actually present. Build an inventory at top of doc.

## Step 2 — Identify the receiving team

Ask BA:

- Who's receiving this? (named team / org / lead)
- What's their context? (familiar with the client / new to the domain / experienced with the tech stack)
- What format do they prefer? (doc / wiki / Linear / Notion)
- Will there be a live walkthrough, or async-only?

This shapes voice and depth. A familiar team needs links + summary. A cold team needs context-rich narrative.

## Step 3 — Required sections

### 3.1 Inventory of artifacts
Bullet list of every file in `./discovery/`. For each, one-sentence "what's in it".

### 3.2 The 30-second pitch
What was discovered, in 4 bullets max. Anyone reading this should know: the problem, the chosen direction, the top risks, the next concrete action.

### 3.3 Decisions made (with reasoning)
A table:

| Decision | Made on | Why | Evidence | Reversible? |
|---|---|---|---|---|

This is the most-referenced section a year later. Future engineering will ask "why did we do X?" — the answer lives here.

### 3.4 Open questions / un-retired risks
From `risk-assumption-map.md` rows that didn't get retired. Per row:

- The question / risk
- Why we couldn't retire it during discovery
- What evidence would resolve it
- Owner for follow-up

### 3.5 What we tried that didn't work
A surprisingly valuable section. Saves the receiving team from re-running spike X with the same negative result.

- Approach we considered: 
- Why it failed: 
- Conditions under which it might still work later: 

### 3.6 Recommended first steps for delivery
3-5 concrete starting actions. Linked to `prototype-plan` build steps if available, or `scope-doc` deliverables.

### 3.7 People + access
- Client decision-makers + their preferences (per `discovery-context.md` + `stakeholder-map.md`)
- Client SMEs + how to reach them
- Tooling, accounts, data sources the receiving team needs
- Existing artifacts in client's systems (Confluence pages, design files, etc.)

### 3.8 Watchouts
What surprised the discovery team. Patterns the receiving team should expect.

- "Client requires 48h for any decision involving security"
- "End-user volume drops 60% in November-December"
- "There's an undocumented dependency on `<X>` in production"

### 3.9 Glossary
Domain-specific terms the receiving team will hit. Especially valuable if the receiving team is new to the client's domain.

## Step 4 — Walkthrough preparation (if live handoff)

If a live walkthrough is happening, suggest BA prepare:

- 60-90 minute slot
- Order: pitch → decisions → open questions → first steps → Q&A
- Receiving team gets the doc 24h before
- Questions documented during walkthrough; doc updated post-walkthrough

## Output

`./discovery/discovery-handoff.md` per `./template.md`. If receiving team prefers a wiki / Notion / Linear format, the BA exports/converts.

Append to `_log.md`: `[discovery-handoff | <date>] receiving team: <name>; format: <doc/walkthrough>; open questions transferred: <count>`.

## Anti-patterns

- **Just dumping artifacts.** A handoff is a synthesis, not a folder forwarding.
- **Skipping "what didn't work".** Receiving team rediscovers the same dead ends.
- **No decision reasoning.** "We chose X" without "why" creates future re-litigation.
- **Watchouts buried.** They should be highlighted, not in an appendix.
- **No follow-up owner on open questions.** Open questions without owners stay open forever.
