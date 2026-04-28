---
name: user-interviews
description: >-
  Evidence group skill. Runs direct end-user interviews to saturation.
  Warns (does not halt) if discovery-context says user_access is none or
  proxy-only — recommends sme-workshops / support-data-analysis /
  secondary-research instead, but allows override. Captures past
  behavior, not hypotheticals. Produces one note file per participant +
  saturation log.
group: evidence
produces: interview-notes/p<NN>-*.md, _saturation-log.md
consumes: discovery-context.md, interview-guide.md (if exists)
origin: ECC
---

# User Interviews

Direct user interviews. Run only when `user_access` allows it.

## Step 1 — Read discovery context (recommended, not required)

Try to read `discovery-context.md`.

**If present:** Pull section **4. Access & Data**.

**If missing:** Tell the BA:
> "Heads-up: `discovery-context.md` is missing. Three options:
> 1. Run `profile-builder` first (recommended)
> 2. Bootstrap inline — confirm 1 thing: end-user access is direct / client-mediated / proxy-only / none?
> 3. Proceed assuming direct access — I'll tag any access-related note as `[ASSUMED]`"
>
> Which?"

Default to option 2. Never block.

**Access reality-check (warn + confirm, do not halt):**

If access is `proxy-only` or `none`, tell the BA:
> "⚠ Reality check: your context says `user_access: <value>`. Direct interviews typically aren't reachable in that case. Recommended alternatives: `sme-workshops`, `support-data-analysis`, `secondary-research`. Three choices:
> 1. Switch to one of those skills (recommended)
> 2. Proceed anyway — you have an override path (e.g. friendly contact, recruiting independently). I'll tag every note with `[NO-ACCESS-OVERRIDE]` and add a banner to `_saturation-log.md` explaining the deviation
> 3. Update `discovery-context.md` first to reflect the new access reality, then re-run"
>
> Which?"

Never auto-halt. If the BA picks option 2, proceed and ensure the `[NO-ACCESS-OVERRIDE]` tag appears in every note file plus a banner at the top of `_saturation-log.md`: "⚠ Run with insufficient access — outputs are speculative."

If guide exists at `./discovery/interview-guide.md`, use it. If not, recommend running `research-planning` first to build one (offer to bootstrap a 4–5 question generic guide inline as a fallback).

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
