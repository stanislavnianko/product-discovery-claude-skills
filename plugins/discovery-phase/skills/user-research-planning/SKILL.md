---
name: user-research-planning
description: >-
  Phase 3 of the discovery-phase pack. Designs the research plan —
  participant profile, recruitment target, interview guide, and success
  criteria — before anyone runs a single interview. Produces
  research-plan.md and interview-guide.md. Consumes problem-canvas.md.
track: core
phase: 3
produces: research-plan.md, interview-guide.md
consumes: problem-canvas.md
origin: ECC
---

# Phase 3 — User Research Planning

Designs *how* we'll learn from users before we actually talk to them. A weak plan makes expensive interviews useless.

## When to activate

- After phase 1 (problem-framing) and phase 2 (stakeholder-alignment) are complete.
- Before any phase 4 (user-interviews) session is booked.
- When the team wants to "just go talk to users" — this skill exists to inject a 30-minute structure step before that happens.

## Inputs

- `problem-canvas.md` — hypothesis, target user, open questions.
- Optional: prior research, CRM lists, existing user communities.

## Procedure

### Step 1 — Define the research question
Restate the 3–5 open questions from the canvas as *research questions* — each one must be answerable from 5–8 interviews. Drop any question that requires quantitative data (that's a survey, not interviews).

### Step 2 — Participant profile
Write a one-paragraph screener. Include:
- Required role / responsibility
- Context they must have experienced in the last 3 months
- Disqualifiers (competitors, internal employees, participants from prior round)

### Step 3 — Recruitment target
- **Minimum:** 5 participants for a homogeneous segment, 7–10 for mixed.
- **Stop rule:** saturation — the last 2 interviews surface no new themes.
- Name channels: CRM list, LinkedIn, user community, a recruiting platform (Respondent, User Interviews), warm intros.

### Step 4 — Interview guide
Use the shared `templates/interview-guide.md`. The guide is the artifact — other team members should be able to run an interview from it without coaching.

Keep the guide **behavioral, not hypothetical**:
- ✅ "Walk me through the last time you…"
- ❌ "Would you use X if we built it?"

### Step 5 — Success criteria
Pre-commit to what "learning something" looks like. Example: "We'll know we've learned if we can update the problem canvas' current-workaround section and cite which interviews supported each change."

### Step 6 — Logistics
- Timeline: 1–2 calendar weeks for recruiting + interviews.
- Interview length: 45–60 min. Avoid 30 min — you lose the gold that comes after minute 25.
- Recording and consent: decide before the first interview, state in the guide.
- Note-taker: ideally a second person (PM + engineer, designer + PM).

## Output

Write two files:
- `./discovery/research-plan.md` — sections above
- `./discovery/interview-guide.md` — the shared guide filled in with the project's specifics

## Handoff

Next phase: `user-interviews` (phase 4). Phase 5 (`market-competitive-scan`) can start in parallel.

## Anti-patterns

- **Writing the guide in Monday and interviewing Tuesday.** Pilot the guide on 1 friendly user first; fix what breaks.
- **Mixing segments without tracking.** If you interview 3 admins and 2 end-users, label every note; do not merge.
- **Asking leading questions.** "How frustrating is X?" assumes frustration. Ask "how did that go?" instead.
- **Skipping the stop rule.** Teams keep interviewing past saturation to feel thorough. Stop when learning stops.

## Shared template

`orchestrator/templates/interview-guide.md`
