---
name: discovery-conductor
pack: discovery-phase
description: >-
  [discovery-phase pack · foundation] Optional orchestrator for the
  discovery-phase pack. Walks the BA through a recommended skill sequence
  based on engagement type and access level — but does not enforce. Acts
  as a guide for users new to the pack. Skills can be (and often are)
  run independently of this conductor. Activate when the user wants a
  guided sequence rather than picking skills à la carte.
group: foundation
origin: ECC
---

# Discovery Conductor

> **Optional orchestrator** for the **discovery-phase** skill pack · `foundation` group · reads `discovery-context.md` + `_log.md` to recommend the next skill.

The optional "guide me through this" skill. Most experienced users skip the conductor and invoke skills directly when needed. The conductor is for: first-time users, complex engagements with mixed access patterns, or BAs who want a checklist.

> This is a **guide**, not a gate. You can stop, skip, or branch at any point. The pack works without the conductor.

## When to activate

- BA says "walk me through discovery" / "what should I run?"
- After `profile-builder` if the BA isn't sure what comes next
- For a new engagement type the BA hasn't run before

**Do not activate** if the BA names specific skills directly — they know what they want.

## Step 1 — Read context

Read `discovery-context.md`. If missing, ask the BA inline: "(a) engagement mode (pre-sale / paid discovery / delivery / staff aug / internal); (b) end-user access (direct / client-mediated / proxy-only / none)?" — enough to pick a sequence. Or recommend running `profile-builder` first for high-stakes work. Never block; default to a generic sequence if the BA insists.

## Step 2 — Pick a recommended sequence

Use the **selection matrix** in [`./sequences.md`](./sequences.md) to map (engagement mode × access level) → sequence A–H. Read the chosen sequence's full step list from that file before presenting it to the BA.

## Step 3 — Hand off control

Show the BA the chosen sequence. Then:

> "Recommended sequence based on your context: `<list>`. I'll suggest the next skill after each one completes. You can run them in this order, skip any, or invoke a different skill manually any time. Ready to start with `<step 1>`?"

## Step 4 — After each phase, suggest next

Read `_log.md` (canonical line schema documented in `profile-builder`) to see which skills have run. Based on completed phases, suggest the next from the sequence:

> "`<previous skill>` complete. Recommended next: `<next skill>`. Run it now, skip, or pick something different?"

If the BA reports a partial / failed run (e.g., "I tried but the client wouldn't share data"), update the recommendation:

> "OK, support-data unavailable. Adjusting: skip `support-data-analysis`, weight `sme-workshops` heavier."

## Step 5 — Closing

When the deliverable skill completes:

> "Sequence complete. Final artifacts in `./discovery/`. Recommend you also run `<one not-yet-run skill>` if `<condition>`. Otherwise, this engagement's discovery is done."

## Anti-patterns

- **Treating sequences as mandatory.** They're guides. Override often.
- **Forcing a sequence when access shifts.** If interviews fall through, re-plan; don't barrel through.
- **Conducting after `profile-builder` automatically.** Wait for the BA to ask. Some users want à la carte.
- **Hiding the rationale.** Always state *why* the sequence is what it is, so BA can override intelligently.
