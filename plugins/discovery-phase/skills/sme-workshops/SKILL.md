---
name: sme-workshops
description: >-
  Evidence group skill. Structured workshop sessions with the client's
  subject-matter experts when end users are unreachable. Captures their
  view of user pain, current process, edge cases, and existing
  workarounds — flagged as proxy evidence (lower weight than direct user
  data). Produces sme-notes/*.md.
group: evidence
produces: sme-notes/*.md
consumes: discovery-context.md, problem-canvas.md (optional)
origin: ECC
---

# SME Workshops

Use when direct user access is blocked but the client has people who interact with the user daily — customer success, support, sales, ops, internal tool admins. Their view is **proxy** evidence: faster to access, lower fidelity than direct.

## Step 1 — Read discovery context (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull **1. Client → Decision-makers**, **4. Access & Data → Client SMEs**. If no SMEs listed, ask BA to list them now (and update the context file).

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Three options:
> 1. Run `profile-builder` first (recommended)
> 2. Bootstrap inline — I'll ask 1 question: which client SMEs are accessible (names + roles, or 'none yet') (fast)
> 3. Proceed and ask SME-recruitment questions before workshop planning, tagged `[ASSUMED]`"
>
> Which?"

Default to option 2. Never block.

## Step 2 — Choose workshop format

| Goal | Format | Duration |
|---|---|---|
| Map a process end-to-end | 1:1 walk-through with the SME closest to the process | 60 min |
| Validate competing hypotheses | Small group (3-4 SMEs) facilitated debate | 90 min |
| Surface edge cases | Asynchronous prompt + 30-min sync | 30 min sync + 1 day async |
| Get pain frequency / severity ranking | Solo intake, then group calibration | 45 min solo + 30 min group |

## Step 3 — Pre-workshop prompts (sent 24h before)

Send the SME a 4-bullet brief:
1. The problem-canvas one-liner
2. "Bring a recent example (last 90 days) where this came up"
3. "List the 3 most painful touch-points you've heard about from users in the last quarter"
4. "What would 'fixed' look like to you, in user behavior, not feature names?"

## Step 4 — Workshop facilitation

- **Anchor on stories.** "Walk me through the last user who hit this." Same rule as user-interviews — past beats hypothetical.
- **Separate observation from speculation.** When the SME says "users feel X", probe: "How do you know? Did a user say it, or are you inferring?" Tag accordingly.
- **Get artifacts.** Screenshots, ticket numbers, recorded call links, internal docs. SMEs hoard these by default; ask explicitly.
- **End with disagreements.** "Where do you and your team disagree about this problem?" Internal disagreement = signal.

## Step 5 — Capture as proxy evidence

Write `./discovery/sme-notes/<initials>-<role>.md` per `./template.md`.

**Critical: tag every observation with confidence:**
- `[direct]` — SME quoted a specific user
- `[inferred]` — SME's interpretation
- `[anecdotal]` — single-case generalization
- `[disagreement]` — multiple SMEs disagree

This is what makes synthesis trustworthy when interviews aren't in the mix.

## Step 6 — Triangulation note

After 2+ SME workshops, write `./discovery/sme-notes/_triangulation.md`:
- What multiple SMEs agree on (raise confidence)
- What only one SME claims (lower confidence)
- What SMEs flatly disagree on (flag for follow-up)

## Output

- `./discovery/sme-notes/<initials>-<role>.md` per SME
- `./discovery/sme-notes/_triangulation.md` running

Append to `_log.md`: `[sme-workshops | <date>] <SME initials>: <one-line>; confidence: <high/med/low>`.

## Anti-patterns

- **Treating SME insight as user insight.** It isn't. Every artifact downstream of this skill must visibly mark "proxy evidence". Synthesis weights it lower than direct interviews.
- **Letting one loud SME dominate.** Separate intakes first, calibrate second.
- **Skipping disagreements.** SME consensus is suspicious — they often work in the same building, share the same biases.
- **No artifacts collected.** A workshop without ticket/call references produces opinion, not evidence.
