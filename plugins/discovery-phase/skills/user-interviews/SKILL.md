---
name: user-interviews
description: >-
  Evidence group skill. Runs direct end-user interviews to saturation.
  Gates on access — halts if discovery-context says user_access is none
  or proxy-only. Captures past behavior, not hypotheticals. Produces one
  note file per participant + saturation log.
group: evidence
produces: interview-notes/p<NN>-*.md, _saturation-log.md
consumes: discovery-context.md, interview-guide.md (if exists)
origin: ECC
---

# User Interviews

Direct user interviews. Run only when `user_access` allows it.

## Step 1 — Read discovery context

Read `discovery-context.md`. Halt if missing (run `profile-builder`).

Pull section **4. Access & Data**.

**Access gate:**
- `direct` or `client-mediated` → proceed
- `proxy-only` → tell user: "discovery-context says no end-user access. Use `sme-workshops`, `support-data-analysis`, or `secondary-research` instead. Halting."
- `none` → same as above

If guide exists at `./discovery/interview-guide.md`, use it. If not, recommend running `research-planning` first to build one.

## Step 2 — Per-interview prep (15 min)

1. Open guide alongside a blank note doc.
2. Skim participant profile — LinkedIn, prior emails, any client-shared notes.
3. Confirm one objective for *this specific* interview (which research question lands heaviest with this person).

## Step 3 — During the interview (45-60 min)

Optimize for these behaviors:

- **Listen past the polite answer.** First answer is rehearsed. Ask "what else?" and wait.
- **Chase specifics.** "Last time" > "usually". "Show me" > "tell me".
- **Mirror silence.** 5 seconds after an answer often produces the real answer.
- **Note surprises inline** with `[!]`. These are gold during synthesis.
- **Capture quotes verbatim** for anything that makes you raise your eyebrows.

## Step 4 — Capture (within 24 hours)

Write `./discovery/interview-notes/p<NN>-<initials>.md` per `./template.md`.

**Within 24 hours.** Memory decays fast; Friday writeup of Tuesday interview = mostly fiction.

## Step 5 — Saturation tracking

After each interview, write one line in `./discovery/interview-notes/_saturation-log.md`:
```
P01 — new themes: A, B, C
P02 — new themes: D; confirmed: A
P03 — new themes: none; confirmed: A, B
```

Three consecutive "new themes: none" = saturation. Tell the user.

## Output

- `./discovery/interview-notes/p<NN>-<initials>.md` per participant
- `./discovery/interview-notes/_saturation-log.md` running

Append to `_log.md` after every interview: `[user-interviews | <date>] P<NN>: <one-line takeaway>`.

## Handoff

Next: `insight-synthesis` once saturation reached or window closes.

## Anti-patterns

- **Pitching mid-interview.** The moment you describe a solution, signal dies. If asked "so what are you building?" → "honestly still figuring out — what would an ideal solution even look like to you?" and route back to past behavior.
- **Batching writeup at week-end.** By Friday, Tuesday is fuzzy.
- **Editing quotes for grammar.** Verbatim, including filler. The 1-2 quotes per interview that land in the final memo need authentic voice.
- **Re-scoping mid-round.** If first 2 interviews reveal the problem is different — finish the round, then loop `problem-framing`.
