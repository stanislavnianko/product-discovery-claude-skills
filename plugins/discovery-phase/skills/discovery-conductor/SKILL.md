---
name: discovery-conductor
description: >-
  Optional orchestrator for the discovery-phase pack. Walks the BA
  through a recommended skill sequence based on engagement type and
  access level — but does not enforce. Acts as a guide for users new to
  the pack. Skills can be (and often are) run independently of this
  conductor. Activate when the user wants a guided sequence rather than
  picking skills à la carte.
group: foundation
origin: ECC
---

# Discovery Conductor

The optional "guide me through this" skill. Most experienced users skip the conductor and invoke skills directly when needed. The conductor is for: first-time users, complex engagements with mixed access patterns, or BAs who want a checklist.

> This is a **guide**, not a gate. You can stop, skip, or branch at any point. The pack works without the conductor.

## When to activate

- BA says "walk me through discovery" / "what should I run?"
- After `profile-builder` if the BA isn't sure what comes next
- For a new engagement type the BA hasn't run before

**Do not activate** if the BA names specific skills directly — they know what they want.

## Step 1 — Read context

Read `discovery-context.md`. If missing:

> "Run `profile-builder` first. The conductor needs context to recommend the right sequence. Halting."

Pull all 7 sections — the conductor reads everything to plan the sequence.

## Step 2 — Pick a recommended sequence

Based on context, pick a profile from this matrix:

| Engagement mode | Access level | Recommended sequence |
|---|---|---|
| Pre-sale discovery sprint | direct or client-mediated | A |
| Pre-sale discovery sprint | proxy-only or none | B |
| Paid discovery sprint | direct | C |
| Paid discovery sprint | client-mediated | D |
| Paid discovery sprint | proxy-only or none | E |
| Delivery-phase discovery | any | F |
| Staff aug | any | G |
| Internal request | any | H |

## Step 3 — Recommended sequences

### Sequence A — Pre-sale, direct access
Tight: 1-2 weeks. Bias toward proposal output.

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (interviews + competitive-scan in parallel)
4. `user-interviews` (target 3-5, accept lower saturation)
5. `competitive-scan`
6. `insight-synthesis`
7. `opportunity-mapping` — likely Validate-mode if client pitched a solution
8. `risk-assumption-mapping`
9. `feature-scoping`
10. `estimation`
11. `proposal`
12. (optional) `go-nogo-memo` for internal agency record

### Sequence B — Pre-sale, no user access
1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (proxy methods only)
4. `secondary-research`
5. `competitive-scan`
6. `sme-workshops` (if any client SMEs available)
7. `insight-synthesis` (lower confidence — flag explicitly)
8. `opportunity-mapping`
9. `risk-assumption-mapping`
10. `feature-scoping`
11. `estimation`
12. `proposal` (lead with discovery limitations)

### Sequence C — Paid discovery sprint, direct access
3-4 weeks. Full discovery.

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning`
4. `user-interviews` (target 5-8, run to saturation)
5. `competitive-scan`
6. `support-data-analysis` (if client provides data)
7. `insight-synthesis`
8. `opportunity-mapping`
9. `risk-assumption-mapping`
10. `feature-scoping`
11. `mvp-definition`
12. `feasibility-spike` (if tech assumption is top-3)
13. `prototype-plan` (if applicable)
14. `estimation`
15. `proposal` + `sow-draft` + `go-nogo-memo`

### Sequence D — Paid discovery, client-mediated
Same as C but: 3-5 interviews instead of 5-8, recruitment slower, add `sme-workshops` to compensate.

### Sequence E — Paid discovery, proxy-only / none
1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (proxy heavy)
4. `sme-workshops` (3-5 sessions)
5. `support-data-analysis`
6. `secondary-research`
7. `competitive-scan`
8. `insight-synthesis` (flag confidence prominently)
9. `opportunity-mapping`
10. `risk-assumption-mapping`
11. `feature-scoping`
12. `estimation`
13. `proposal` + `go-nogo-memo`

### Sequence F — Delivery-phase discovery
Embedded in build, not pre-build. Discovery scope is narrower, focused on retiring delivery risks.

1. `problem-framing` (validate — engagement already started)
2. `stakeholder-mapping` (refresh)
3. `research-planning` (lightweight)
4. Pick 1-2 evidence skills based on access
5. `insight-synthesis`
6. `risk-assumption-mapping`
7. `feasibility-spike` (often the main output)
8. `prototype-plan` (often built same week)
9. `discovery-handoff` to delivery team

### Sequence G — Staff aug
Discovery is often skipped or compressed. If happening:

1. `problem-framing`
2. `stakeholder-mapping`
3. (skip evidence skills if mirror-client process; otherwise lightweight)
4. `risk-assumption-mapping`
5. `discovery-handoff`

### Sequence H — Internal request
The pack handles internal product teams too. Sequence is essentially classic product discovery:

1-9 same as C, ending in `go-nogo-memo` (no proposal/sow needed).

## Step 4 — Hand off control

Show the BA the chosen sequence. Then:

> "Recommended sequence based on your context: `<list>`. I'll suggest the next skill after each one completes. You can run them in this order, skip any, or invoke a different skill manually any time. Ready to start with `<step 1>`?"

## Step 5 — After each phase, suggest next

Read `_log.md` to see which skills have run. Based on completed phases, suggest the next from the sequence:

> "`<previous skill>` complete. Recommended next: `<next skill>`. Run it now, skip, or pick something different?"

If the BA reports a partial / failed run (e.g., "I tried but the client wouldn't share data"), update the recommendation:

> "OK, support-data unavailable. Adjusting: skip `support-data-analysis`, weight `sme-workshops` heavier."

## Step 6 — Closing

When the deliverable skill completes:

> "Sequence complete. Final artifacts in `./discovery/`. Recommend you also run `<one not-yet-run skill>` if `<condition>`. Otherwise, this engagement's discovery is done."

## Anti-patterns

- **Treating sequences as mandatory.** They're guides. Override often.
- **Forcing a sequence when access shifts.** If interviews fall through, re-plan; don't barrel through.
- **Conducting after `profile-builder` automatically.** Wait for the BA to ask. Some users want à la carte.
- **Hiding the rationale.** Always state *why* the sequence is what it is, so BA can override intelligently.
