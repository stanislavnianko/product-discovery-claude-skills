---
name: user-interviews
description: >-
  Phase 4 of the discovery-phase pack. Runs customer interviews to
  saturation using the guide from phase 3. Produces structured interview
  notes, one file per participant. Consumes interview-guide.md. Optimised
  for learning past behavior, not validating solutions.
track: core
phase: 4
produces: interview-notes/*.md
consumes: interview-guide.md
origin: ECC
---

# Phase 4 — User Interviews

Execute the interviews planned in phase 3. Capture what users *did*, not what they *think they'll do*. Stop at saturation.

## When to activate

- After phase 3 (research plan + guide) is signed off.
- Once per interview session (the skill helps prep, run, and capture).
- When the user says "I just did some user calls, help me write them up" — still invokable for the capture portion.

## Inputs

- `interview-guide.md` from phase 3.
- Participant scheduling info (name/initials, role, date).
- Optional: transcript / recording / live notes.

## Procedure per interview

### Before (15 min)
1. Open the guide alongside a blank note doc.
2. Skim the participant's profile — LinkedIn, past emails, any prior notes.
3. Confirm one objective for *this specific* interview (which of the research questions lands heaviest with this person?).

### During (45–60 min)
Follow the guide, but optimize for these behaviors:
- **Listen past the polite answer.** First answer is usually rehearsed. Ask "what else?" and wait.
- **Chase specifics.** "Last time" > "usually". "Show me" > "tell me".
- **Mirror silence.** 5 seconds of silence after an answer often produces the real answer.
- **Note surprises inline.** A margin mark like `[!]` — these become gold in synthesis.
- **Capture quotes verbatim** for anything that makes you raise your eyebrows.

### After (20 min)
Write `./discovery/interview-notes/p<NN>-<initials>.md` using the structure below. Do this **within 24 hours** — memory decays fast.

## Note structure per interview

```markdown
# P<NN> — <initials>, <role>, <date>

## Context
- How recruited:
- Current role:
- Relevant experience:

## Pain points observed (with quotes)
-  [!] "..."

## Workarounds
-

## Surprises
-

## Tools / systems mentioned
-

## Willingness signals
- Paid today for this?
- Who else cares?

## Referrals given
-

## My confidence in this interview (1–5) and why
```

## Saturation tracking

After each interview, write one line in `./discovery/interview-notes/_saturation-log.md`:
```
P01 — new themes: A, B, C
P02 — new themes: D; confirmed: A
P03 — new themes: none; confirmed: A, B
```
Three consecutive "new themes: none" is the stop signal. Tell the user.

## Output

- One note file per participant, `interview-notes/p<NN>-<initials>.md`.
- Running `_saturation-log.md`.

## Handoff

Next phase: `insight-synthesis` (phase 6). Phase 5 (`market-competitive-scan`) runs in parallel if not already done.

## Anti-patterns

- **Pitching mid-interview.** The moment you describe a solution, you've lost the signal. Redirect if the participant asks "so what are you building?" with "honestly still figuring it out — what would an ideal solution even look like to you?" and route back to past behavior.
- **Batching notes at the end of the week.** By Friday, Tuesday's interview is fuzzy. Write within 24 hours.
- **Editing quotes.** Capture verbatim — even the filler words — for the 1–2 quotes per interview that will land in the final memo.
- **Re-scoping mid-interview.** If the first 2 interviews reveal the problem is different, finish the round anyway, then loop phase 1.
