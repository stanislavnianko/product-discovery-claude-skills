---
name: competitive-scan
description: >-
  Evidence group skill. Maps direct competitors, indirect substitutes,
  and adjacent (non-software) workarounds for the problem in
  problem-canvas.md. Identifies the actual gap and any "free incumbent"
  the client can't outcompete. Produces competitive-scan.md. Reads
  discovery-context.md.
group: evidence
produces: competitive-scan.md
consumes: discovery-context.md, problem-canvas.md
origin: ECC
---

# Competitive Scan

Answers two questions: **what's already out there**, and **why haven't users adopted it for this problem?** The second is more important.

## Step 1 — Read discovery context

Read `discovery-context.md`. Halt if missing.

Pull **1. Client → Domain**, **2. Product / Initiative**.
Read `problem-canvas.md`; halt if missing — without a framed problem, the scan is shapeless.

## Step 2 — List competitive set in 3 layers

1. **Direct competitors** — products explicitly solving the same problem in the same domain
2. **Indirect substitutes** — adjacent products or workflows users already use (often surfaced by interviews / SME workshops)
3. **Adjacent (non-software) workarounds** — Excel, manual ops, contractors, doing nothing

Aim for 4-8 entries across all 3 layers. More than 12 = over-research; fewer than 3 = the BA hasn't looked hard enough.

## Step 3 — Delegate web research if available

If `deep-research`, `market-research`, or `exa-search` skills are installed:
> "Use `deep-research` to produce a cited scan of tools that do `<problem from canvas>` for `<user segment>` in `<domain>`. Include pricing, last meaningful update, and notable user complaints."

Otherwise fall back to: G2/Capterra/Product Hunt for category, GitHub `topic:<keyword>` for OSS, Reddit + HN for complaints, vendor blogs for positioning (vs reality).

## Step 4 — Score each entrant

Per entrant capture:

| Field | Notes |
|---|---|
| Name + URL | |
| Layer | direct / indirect / adjacent |
| Positioning (their words) | from homepage / pitch |
| Real-world use (review/complaint signal) | often differs from positioning |
| Pricing model | including free tier |
| Last meaningful release | stale tools = often opportunities |
| Key limitation for the client's user segment | the why-not-this part |
| What it's great at | be honest, not dismissive |

## Step 5 — Extract the gap

One paragraph after the table: **what job is NOT well-served for this client's specific user segment?** Cite specific gaps with links to reviews / threads / dated screenshots.

This gap is the opportunity that feeds `opportunity-mapping`.

## Step 6 — Flag substitutes the client can't outcompete

If a free incumbent does 80%+ of the job, **call it out top of doc.** This is high-signal for `go-nogo-memo` — sometimes the right answer is "don't build this; integrate with the free thing".

Same for incumbents with significantly more capital, distribution, or network effects.

## Step 7 — Outsourcing-specific note

Strategic fit is judged from the **client's** perspective, not the agency's. The agency might find a competitor uninteresting; the client might find them existential. Frame the gap and the substitutes for **the client's success metric from problem-canvas.md**.

## Output

`./discovery/competitive-scan.md` per `./template.md`.

Append to `_log.md`: `[competitive-scan | <date>] direct: <N>; indirect: <N>; adjacent: <N>; gap headline: <one-line>; substitute risk: <high/med/low>`.

## Anti-patterns

- **Feature-checklist evaluation.** Users buy outcomes, not feature parity. Evaluate by "does this tool solve our user's job".
- **Ignoring "built it ourselves".** If users built their own internal tool to solve this, that IS the competitor.
- **Burying the substitute risk.** "We lose to a free thing" is the most important finding the scan can produce. Top of doc.
- **Generic gap statement.** "There's no good tool" is not a gap; "no tool serves SMB admins with 20-100 employee orgs in healthcare with HIPAA-compliant audit logs" is.
