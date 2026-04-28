---
name: problem-framing
pack: discovery-phase
description: >-
  [discovery-phase pack · discovery] Restates the client's problem, target
  user, current workaround, success signal, and renders a falsifiable
  hypothesis. Pressure-tests against falsifiability, specificity, novelty,
  and strategic alignment. Produces problem-canvas.md. Reads
  discovery-context.md.
group: discovery
produces: problem-canvas.md
consumes: discovery-context.md
origin: ECC
---

# Problem Framing

> Part of the **discovery-phase** skill pack · `discovery` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Turns whatever the client said into a testable, falsifiable hypothesis. If the client already proposed a solution (very common in outsourcing), this skill **un-pitches** it back into a problem statement before anything downstream runs.

## Step 1 — Read discovery context

Read `discovery-context.md` (sections **1. Client**, **2. Product / Initiative**). If section 2 says the client already proposed a solution, flag it — this skill will need to extract the underlying problem from that solution rather than starting clean.

If `discovery-context.md` is missing, ask the BA inline: "(a) client name + sector; (b) what's being explored in one line; (c) did the client propose the solution or did the agency?" — tag any unverified canvas field as `[ASSUMED]`. Never block; recommend `profile-builder` for high-stakes work.

## Step 2 — Forbid solution-speak (mid-skill rule)

Apply this rule throughout: any phrasing like "build X", "add Y feature", "implement Z" is intercepted and reframed as "what outcome would X produce, and why is that outcome missing today?"

This applies even to the client's own framing. If the discovery-context says they want "an AI assistant", the canvas asks: "What job is the AI assistant supposed to do, and what's broken about how that job gets done today?"

## Step 3 — Fill the canvas

Walk the BA through the canvas. Each section is 1-3 sentences max.

1. **Problem statement** — who has the problem, in what context, what outcome they're not getting
2. **Why now** — what changed in the world / market / client's business that makes this worth solving this quarter
3. **Target user** — role, segment, size; if B2B, name the buyer AND the end user if different (often same in SMB, different in enterprise)
4. **Current workaround** — how the user solves this today (Excel, manual ops, a competitor, contractors, doing nothing)
5. **Success signal** — metric + direction + rough magnitude (NOT a feature; a behavior or outcome)
6. **Out of scope** — explicit exclusions
7. **Open questions** — 3-5 items research must answer

If the BA cannot answer a section because the engagement is too early or the client hasn't been asked, mark "TBD — ask client" and add to a per-skill follow-up list at the bottom of the canvas. Do not invent.

## Step 4 — Render hypothesis

One sentence:
> We believe that `<user>` experiences `<problem>` when `<context>`. Solving it would unlock `<outcome>`, measurable by `<signal>`.

## Step 5 — Pressure test (4 checks)

Run these. If any fails, loop back to the linked section.

| Test | Question | Fix in section |
|---|---|---|
| **Falsifiability** | What concrete observation would make us drop this hypothesis? | Success signal + Open questions |
| **Specificity** | Can we name a real living person who has this problem right now? | Target user |
| **Novelty** | Does the current workaround already do 80%? Is the remaining 20% worth a project? | Current workaround |
| **Strategic alignment** | Does "why now" match the **client's** current priorities (not the agency's)? | Why now (and surface to stakeholder-mapping) |

If 3+ tests fail, tell the BA: "This hypothesis isn't ready. Three of four pressure tests failed. Loop back, ideally with another 30-minute conversation with the client."

## Step 6 — Write artifact

Output: `./discovery/problem-canvas.md` — see `./template.md`.

Append to `_log.md`: `[problem-framing | YYYY-MM-DD] hypothesis: <one-line>; pressure_tests: <4/4 pass | flags>`.

## Anti-patterns

- **Accepting client's solution as the problem.** "Client wants an AI chatbot" is not a problem statement. Force the un-pitch.
- **Multi-problem canvas.** If the BA cram 3 problems into one canvas, split into 3, pick one for this cycle.
- **TBD in success signal.** Without a measurable signal, every downstream phase is guesswork. Push the BA to call the client if necessary.
- **Skipping pressure test for a friendly client.** Especially dangerous in repeat engagements — comfort breeds vague hypotheses.
