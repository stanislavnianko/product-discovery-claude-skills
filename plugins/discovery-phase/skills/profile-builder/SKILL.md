---
name: profile-builder
description: >-
  Foundation skill for the discovery-phase pack. Interviews the BA about
  the client, the product/initiative, the engagement model, access
  constraints, and expected deliverable. Writes a single
  discovery-context.md to the project root. EVERY other skill in this
  pack reads that file at start and halts if missing. Run this first.
  TRIGGER when the user says "build my discovery profile", "set up
  discovery context", "start a new client engagement", or activates any
  other discovery-phase skill before this one has run.
group: foundation
origin: ECC
---

# Profile Builder

Produces `discovery-context.md` — the single source of truth that every other skill in this pack reads. Without it, no other skill in the pack will execute.

## Activation rule

The moment this skill triggers, **go straight to the interview**. Do not summarise the skill, do not ask permission, do not explain the structure. The user already knows what they activated.

## What this skill writes

A single file at the project root: **`discovery-context.md`**.

It contains 7 sections:
1. Client
2. Product / Initiative
3. Engagement
4. Access & Data
5. Expected deliverable
6. Constraints
7. Open questions about the engagement itself

See `./template.md` for the exact structure.

## Procedure

### Step 1 — Check for existing context
If `discovery-context.md` already exists in the project root:
- Show the user a 5-line summary of what's there.
- Ask: "Do you want to **refresh** (re-interview from scratch), **update** (only the section I name), or **keep** (just confirm and exit)?"
- Route accordingly. Default to "update" if unclear.

If the file doesn't exist, proceed to Step 2.

### Step 2 — Interview, in 4 batches
Use AskUserQuestion. Group questions to minimize round-trips.

**Batch A — Client**
- Client name and short description (1 sentence)
- Domain / industry
- Business model: B2B SaaS / B2C product / marketplace / services / internal tool / other
- Stage: pre-launch / early traction / scaling / mature / declining
- Decision-makers: who signs off on what (names/roles)
- Existing relationship: new logo / repeat client / staff aug / pre-sale prospect

**Batch B — Product / Initiative**
- What's being explored (one sentence)
- Current state of the thing: idea / spec / prototype / live but failing / live but pivoting
- Prior research / artifacts available (links, file names, or "none")
- Has the client already proposed a solution or feature list? (yes / no — and if yes, summarize it)

**Batch C — Engagement**
- Mode: pre-sale discovery sprint / paid discovery sprint / delivery-phase discovery / staff aug / internal request / other
- Timeline available: days / 1-2 weeks / 3-4 weeks / quarter / open-ended
- Runner role: solo BA / BA + PM / lead consultant / part of agency squad / internal product
- Budget context: free pre-sale / fixed-fee / time-and-materials / discovery-sprint fee / staff aug rate / unknown

**Batch D — Access, Data, Deliverable, Constraints**
- End-user access: direct / client-mediated / proxy-only / none
- Client SMEs available: list names + roles, or "none"
- Data we can request: analytics / support tickets / call recordings / past interviews / sales notes / NPS / other / none
- Tools BA has access to: list (Linear, Jira, Notion, Confluence, Mixpanel, etc.) or "TBD"
- Primary deliverable expected: proposal / SoW draft / discovery handoff / go-no-go memo / estimation / other
- Secondary deliverables (optional): list
- NDA / confidentiality status
- Languages, geographies, regulatory (GDPR / HIPAA / SOC2 / other / none)

### Step 3 — Render the file
Render answers into the template. Keep it tight: each field one to three lines. No filler prose.

Add at the bottom:
```
## Open questions about the engagement itself
- (any answers the BA marked unknown / TBD become bullets here)
```

### Step 4 — Confirm + exit
After writing, show the user a 6-bullet summary:
- Client: <name>, <domain>, <stage>
- Initiative: <one-line>
- Mode: <engagement>, <timeline>
- Access: <user-access level>; SMEs: <count>; Data: <count of sources>
- Deliverable: <primary>
- Open questions logged: <count>

Then state: **"Discovery context written. Other skills in this pack will now run. Suggest starting with: `problem-framing`, `stakeholder-mapping`, or `discovery-conductor` if you want a guided sequence."**

## Anti-patterns

- **Skipping the engagement section.** "We'll figure out the engagement later" is how proposals end up unsigned. Force completion.
- **Vague decision-makers.** "Client leadership" ≠ name. Push for at least one named human per decision.
- **Filler.** If the BA doesn't know something, write "TBD — see open questions" and add to bottom list. Don't invent.
- **Refreshing too eagerly.** If the file exists, default to "update specific section", not "rewrite everything". Old context is hard-won.

## What downstream skills consume

Every other skill in the pack starts with:
```
Read `discovery-context.md` from project root. If missing, tell the user
to run `profile-builder` first ("say `build my discovery profile`"),
then stop.
```

Specifically:
- **problem-framing** uses Client + Initiative + prior-solution sections
- **stakeholder-mapping** uses Client decision-makers + Engagement (two-tier map)
- **research-planning, user-interviews, sme-workshops, secondary-research, support-data-analysis** all branch on Access & Data
- **estimation, proposal, sow-draft** consume Engagement + Deliverable sections
- **All deliverable skills** read Constraints (NDA, regulatory) before writing
