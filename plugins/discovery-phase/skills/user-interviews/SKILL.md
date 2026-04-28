---
name: user-interviews
pack: discovery-phase
description: >-
  [discovery-phase pack · evidence] Runs direct end-user interviews to
  saturation. Warns (does not halt) if discovery-context says user_access
  is none or proxy-only — recommends sme-workshops /
  support-data-analysis / secondary-research instead, but allows
  override. Captures past behavior, not hypotheticals. Produces one note
  file per participant + saturation log.
group: evidence
produces: interview-notes/p<NN>-*.md, _saturation-log.md
consumes: discovery-context.md, interview-guide.md (if exists)
origin: ECC
---

# User Interviews

> Part of the **discovery-phase** skill pack · `evidence` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Direct user interviews. Run only when `user_access` allows it.

## Step 1 — Read discovery context

Read `discovery-context.md` (section **4. Access & Data**) and `./discovery/interview-guide.md` if it exists.

If `discovery-context.md` is missing, ask the BA inline: "end-user access — direct / client-mediated / proxy-only / none?" — tag access-related notes `[ASSUMED]`. If the interview guide is missing, recommend running `research-planning` first or bootstrap a 4–5 question generic guide inline. Never block; recommend `profile-builder` for high-stakes work.

**Access reality-check (warn + confirm, do not halt):** if access is `proxy-only` or `none`, warn that direct interviews typically aren't reachable. Recommend switching to `sme-workshops`, `support-data-analysis`, or `secondary-research`. If the BA proceeds anyway (override path — friendly contact, independent recruiting), tag every note with `[NO-ACCESS-OVERRIDE]` and add a banner to `_saturation-log.md`: "⚠ Run with insufficient access — outputs are speculative."

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

Append to `_log.md` after every interview: `[user-interviews | YYYY-MM-DD] participant: P<NN>; takeaway: <one-line>`.

## Handoff

Next: `insight-synthesis` once saturation reached or window closes.

## Anti-patterns

- **Pitching mid-interview.** The moment you describe a solution, signal dies. If asked "so what are you building?" → "honestly still figuring out — what would an ideal solution even look like to you?" and route back to past behavior.
- **Batching writeup at week-end.** By Friday, Tuesday is fuzzy.
- **Editing quotes for grammar.** Verbatim, including filler. The 1-2 quotes per interview that land in the final memo need authentic voice.
- **Re-scoping mid-round.** If first 2 interviews reveal the problem is different — finish the round, then loop `problem-framing`.
