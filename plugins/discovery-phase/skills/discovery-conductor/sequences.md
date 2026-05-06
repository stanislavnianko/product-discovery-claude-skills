# Discovery Conductor — Recommended Sequences

These are guides, not gates. The conductor picks one based on `discovery-context.md` (engagement mode + access level), but the BA can override at any step.

## Sequence selection matrix

| Engagement mode | Access level | Sequence |
|---|---|---|
| Pre-sale discovery sprint | direct or client-mediated | [A](#sequence-a--pre-sale-direct-access) |
| Pre-sale discovery sprint | proxy-only or none | [B](#sequence-b--pre-sale-no-user-access) |
| Paid discovery sprint | direct | [C](#sequence-c--paid-discovery-sprint-direct-access) |
| Paid discovery sprint | client-mediated | [D](#sequence-d--paid-discovery-client-mediated) |
| Paid discovery sprint | proxy-only or none | [E](#sequence-e--paid-discovery-proxy-only--none) |
| Delivery-phase discovery | any | [F](#sequence-f--delivery-phase-discovery) |
| Staff aug | any | [G](#sequence-g--staff-aug) |
| Internal request | any | [H](#sequence-h--internal-request) |

---

## Sequence A — Pre-sale, direct access

Tight: 1-2 weeks. Bias toward proposal output.

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (interviews + competitive-scan in parallel)
4. `user-interviews` (target 3-5, accept lower saturation)
5. `competitive-scan`
6. `insight-synthesis`
7. `personas` (lightweight — 2-3, flag thin evidence)
8. `opportunity-mapping` — likely Validate-mode if client pitched a solution
9. `risk-assumption-mapping`
10. `feature-scoping`
11. `solution-architecture` (high-level only, critical flows)
12. `estimation`
13. `proposal`
14. (optional) `go-nogo-memo` for internal agency record

> Skip `journey-mapping` in pre-sale unless the client explicitly asked — too time-expensive for the win-rate uplift.

## Sequence B — Pre-sale, no user access

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (proxy methods only)
4. `secondary-research`
5. `competitive-scan`
6. `sme-workshops` (if any client SMEs available)
7. `insight-synthesis` (lower confidence — flag explicitly)
8. `personas` (heavily `[ASSUMED]` — built from SME proxy + secondary research)
9. `opportunity-mapping`
10. `risk-assumption-mapping`
11. `feature-scoping`
12. `solution-architecture` (helps compensate for thin user evidence with crisp tech rationale)
13. `estimation`
14. `proposal` (lead with discovery limitations)

> Skip `journey-mapping` — without user evidence, journey maps are fiction.

## Sequence C — Paid discovery sprint, direct access

3-4 weeks. Full discovery.

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning`
4. `user-interviews` (target 5-8, run to saturation)
5. `competitive-scan`
6. `support-data-analysis` (if client provides data)
7. `insight-synthesis`
8. `personas` (2-4, evidence-backed)
9. `journey-mapping` (1-2 journeys for the primary persona)
10. `opportunity-mapping`
11. `risk-assumption-mapping`
12. `feature-scoping`
13. `mvp-definition`
14. `solution-architecture`
15. `feasibility-spike` (if tech assumption is top-3 OR architecture surfaced new HIGH risks)
16. `prototype-plan` (if applicable)
17. `estimation`
18. `proposal` + `sow-draft` + `go-nogo-memo`

## Sequence D — Paid discovery, client-mediated

Same as C but: 3-5 interviews instead of 5-8, recruitment slower, add `sme-workshops` to compensate. `personas` may include 1 `[ASSUMED]` persona; `journey-mapping` typically only the primary persona's main journey.

## Sequence E — Paid discovery, proxy-only / none

1. `problem-framing`
2. `stakeholder-mapping`
3. `research-planning` (proxy heavy)
4. `sme-workshops` (3-5 sessions)
5. `support-data-analysis`
6. `secondary-research`
7. `competitive-scan`
8. `insight-synthesis` (flag confidence prominently)
9. `personas` (`[ASSUMED]` heavy — recommend client-validation step)
10. `opportunity-mapping`
11. `risk-assumption-mapping`
12. `feature-scoping`
13. `solution-architecture` (extra weight: tech rigor compensates for user-evidence gaps)
14. `estimation`
15. `proposal` + `go-nogo-memo`

> Skip `journey-mapping` — proxy data isn't enough to ground emotion lines.

## Sequence F — Delivery-phase discovery

Embedded in build, not pre-build. Discovery scope is narrower, focused on retiring delivery risks.

1. `problem-framing` (validate — engagement already started)
2. `stakeholder-mapping` (refresh)
3. `research-planning` (lightweight)
4. Pick 1-2 evidence skills based on access
5. `insight-synthesis`
6. `risk-assumption-mapping`
7. `solution-architecture` (if architecture wasn't done in pre-sale or has drifted)
8. `feasibility-spike` (often the main output)
9. `prototype-plan` (often built same week)
10. `discovery-handoff` to delivery team

> Skip `personas` and `journey-mapping` unless the team is debugging a UX problem mid-build — otherwise they're rework.

## Sequence G — Staff aug

Discovery is often skipped or compressed. If happening:

1. `problem-framing`
2. `stakeholder-mapping`
3. (skip evidence skills if mirror-client process; otherwise lightweight)
4. `risk-assumption-mapping`
5. `discovery-handoff`

## Sequence H — Internal request

The pack handles internal product teams too. Sequence mirrors C (full paid discovery, including `personas`, `journey-mapping`, `solution-architecture`), but ends in `go-nogo-memo` only — no `proposal` / `sow-draft` / `discovery-handoff` needed when discovery and delivery are the same team.
