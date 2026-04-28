---
name: research-planning
description: >-
  Discovery group skill. Designs the evidence-gathering plan based on
  what access is actually available. Branches into direct interviews,
  SME workshops, secondary research, support-data analysis, or a mix.
  Produces research-plan.md and (if applicable) interview-guide.md.
  Reads discovery-context.md.
group: discovery
produces: research-plan.md, interview-guide.md (conditional)
consumes: discovery-context.md, problem-canvas.md
origin: ECC
---

# Research Planning

The skill that decides **how** the BA will learn — informed by access reality, not aspiration. In outsourcing, this almost always means a mix of methods, not pure interviews.

## Step 1 — Read discovery context (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull section **4. Access & Data**. This drives the entire plan.

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Access level drives the entire research plan, so this matters more here than elsewhere. Three options:
> 1. Run `profile-builder` now (recommended)
> 2. Bootstrap inline — I'll ask 2 questions: (a) end-user access (direct / client-mediated / proxy-only / none), (b) which proxy data sources are available (SMEs / support tickets / analytics / none) (fast)
> 3. Proceed and recommend a generic mixed-methods plan, tagged `[ASSUMED ACCESS]`"
>
> Which?"

Default to option 2. Never block.

Read `problem-canvas.md`. If absent, recommend running `problem-framing` first — research without a hypothesis is a fishing expedition. The BA can override and proceed; in that case tag the plan's research questions as `[NO-HYPOTHESIS]` so reviewers see the limitation.

## Step 2 — Match access level → method mix

| Access level (from context) | Primary method | Secondary | Skip |
|---|---|---|---|
| `direct` (BA can interview end users) | `user-interviews` (5-8 sessions to saturation) | `competitive-scan`, `support-data-analysis` if available | — |
| `client-mediated` (interviews via client introductions) | `user-interviews` (3-5 sessions, accept slower recruitment) + `sme-workshops` | `competitive-scan`, `secondary-research` | — |
| `proxy-only` (no interviews, but data + SMEs available) | `sme-workshops` + `support-data-analysis` | `secondary-research`, `competitive-scan` | `user-interviews` |
| `none` (no users, no data, no SMEs) | `secondary-research` + `competitive-scan` | analogous-domain interviews if BA can recruit independently | `user-interviews`, `support-data-analysis`, `sme-workshops` |

State the chosen mix explicitly in the plan. If the BA wants to override (e.g., "I know we said proxy-only but I have a friendly client contact who agreed to one interview"), record it AND note the confidence-loss caveat.

## Step 3 — Translate hypothesis to research questions

From `problem-canvas.md` Open questions, derive 3-5 research questions. Rule:

- Each must be answerable from the chosen method mix
- Each must be falsifiable (a "no" answer is possible)
- Drop quantitative questions ("what % of users do X?") — those are surveys/analytics, not interviews

## Step 4 — If interviews are in the mix

Build `./discovery/interview-guide.md` (separate artifact). Behavioral, not hypothetical:
- ✅ "Walk me through the last time you…"
- ❌ "Would you use X if we built it?"

Apply `user-interviews` skill conventions (see that skill for the full guide template). Pre-flight at least 1 pilot interview before booking 5+.

If interviews are NOT in the mix, skip this step and route to `sme-workshops`, `secondary-research`, or `support-data-analysis` skills directly when execution time comes.

## Step 5 — Recruitment / data-request plan

Per chosen method:

- **Interviews:** target N, recruitment channels (client list / LinkedIn / community / Respondent), screener, stop rule (saturation)
- **SME workshops:** workshop count, format (1:1 vs group), duration, who facilitates, what artifacts they bring
- **Secondary research:** topic areas, sources (industry reports, competitor blogs, academic if relevant), time budget
- **Support-data analysis:** data sources to request from client, time window (e.g. last 90 days), volume estimate

## Step 6 — Logistics

- Window: what calendar week(s) the data lands
- Interview/workshop length: 45-60 min (not 30)
- Recording + consent: decide before first session
- Note-taker: ideally a second person, especially for interviews
- Synthesis (next phase) start date

## Step 7 — Success criteria

Pre-commit: "We'll know the research worked if we can update the problem-canvas current-workaround and target-user sections, and cite which evidence supported each change."

## Output

- `./discovery/research-plan.md` per `./template.md`
- `./discovery/interview-guide.md` IF interviews are in the mix (use the dedicated `user-interviews` template)

Append to `_log.md`: `[research-planning | <date>] mix: <methods>; target sessions/sources: <count>; window: <dates>`.

## Anti-patterns

- **Defaulting to interviews when access says proxy-only.** "We'll figure out interviews later" usually means never. Plan for the access you actually have.
- **Mixing segments without tracking.** If you interview 3 admins and 2 end-users, label every note. Do not merge.
- **Surveys disguised as interviews.** "How often do you do X?" is a survey question. Reformulate to behavior: "Walk me through the last time…"
- **No stop rule.** Without saturation criteria, research expands to fill all available time.
