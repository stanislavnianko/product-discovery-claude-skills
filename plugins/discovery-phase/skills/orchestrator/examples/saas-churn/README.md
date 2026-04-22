# Worked example — "Why are our SMB accounts churning at month 4?"

A compressed walk-through of the `discovery-phase` pack on a fictional B2B SaaS case. Shows the shape of each artifact; real runs produce longer, evidence-linked documents.

## Intake (orchestrator)

- **Problem one-liner:** SMB accounts on our standard plan churn at ~28% by month 4, vs 9% on the enterprise plan.
- **Users:** SMB admin owners (20–100 employee companies); typically the founder or ops lead.
- **Tech-PoC needed?** No — we want a GO/PIVOT/KILL decision first, and a scope proposal if GO.

→ Track set to `core`. Phases 10–11 skipped.

## Phase 1 — problem-framing → `problem-canvas.md`
- **Hypothesis:** We believe SMB admins churn in month 4 because setup friction delays first-value beyond their evaluation window. Solving it would move month-4 retention from 72% toward enterprise parity (91%), measurable by activation rate at day 14.
- **Success signal:** Day-14 activation rate ≥ 60% (today ~35%).
- **Out of scope:** Pricing changes, enterprise features.

## Phase 2 — stakeholder-alignment → `stakeholder-map.md`
- Decision-maker: VP Product (wants "less churn" — vague)
- Budget owner: CFO (skeptic: "is this worth more than a price experiment?")
- Impacted teams: CS (owns onboarding), Sales (quotas on upsell)
- Conflict flagged: Sales wants "show enterprise features in trial to upsell"; CS wants "hide advanced features to reduce overwhelm".

## Phase 3 — user-research-planning → `research-plan.md` + `interview-guide.md`
- 8 interviews targeted: 4 churned admins (month 3–5), 4 retained (month 6+), all SMB.
- Guide focuses on: last time they hit a blocker during onboarding, what they did, who they asked.
- Kill-by-saturation after 3 consecutive interviews with no new themes.

## Phase 4 — user-interviews → `interview-notes/p01..p08.md`
Saturation reached at P07. Recurring signals:
- 5 of 8: "I couldn't figure out how to import my existing data; tried CSV, gave up at the 3rd error."
- 4 of 8: "The product team sent me a Loom but it was 22 minutes."
- 3 of 8: "My ops person quit / changed roles; I inherited the account mid-setup and had no context."

## Phase 5 — market-competitive-scan → `competitive-scan.md`
- Two direct competitors offer concierge onboarding in the first 2 weeks on similar tiers.
- One free alternative covers 70% of our SMB use case; flagged as a real substitute.

## Phase 6 — insight-synthesis → `insight-matrix.md`, `themes.md`
Top 3 themes by F×I×S:
1. **Data import friction** (frequency 5/8, intensity 5/5, strategic fit 4/5) — score 100
2. **Self-serve learning paths too long** (4/8, 4/5, 3/5) — 48
3. **Account handoff leaves no context** (3/8, 5/5, 3/5) — 45

Surprise: the "handoff" theme was not in the original hypothesis. It suggests part of churn is admin turnover, not product friction — flagged.

## Phase 7 — opportunity-solution-tree → `opportunity-tree.md`
Attacking opportunity 1 (data import). Candidate solutions:
- **Incremental:** better CSV error messages
- **Radical:** concierge import service (humans in the loop for week 1)
- **Buy:** integrate an existing CSV import SaaS
- **Do-nothing baseline:** improve docs only

Chosen direction: **concierge import**, because interviews repeatedly showed users gave up silently rather than asking for help. Tests it with an experiment: offer 10 churning-risk accounts a 30-min concierge call; measure activation vs matched control.

## Phase 8 — risk-assumption-mapping → `risk-assumption-map.md`
Top 3 to retire:
1. **Desirability:** SMB admins will accept a scheduled call from a human (Impact 5, Evidence 2 → Leverage 20). Retire by: offer it to 10 risk accounts, measure take-rate. Kill if <30% take.
2. **Viability:** concierge is cost-defensible at our ACV (Impact 5, Evidence 3 → 15). Retire by: back-of-envelope — 2 hours CS × $50/hr on a $3000 ACV.
3. **Feasibility:** CS team has capacity for pilot (Impact 4, Evidence 2 → 16). Retire by: 1 CS manager confirms in writing.

## Phase 9 — scope-mvp-definition → `scope-doc.md`
**MVP job:** Offer a 30-minute scheduled concierge import call to every SMB account on day 3 of their trial, such that the "willingness to accept help" assumption is retired.

- In: day-3 email trigger, 3 CS reps available, manual booking via Calendly, tracking form
- Out: product changes, automated onboarding, self-serve improvements
- Leading metric: ≥30% of eligible accounts book a call (MVP window: 4 weeks, 50 accounts)
- Lagging: month-4 retention of booked-call cohort vs control at +8 pp
- Rollback: if <10% book or CS burns out, pause after week 2
- Size: S (<1 week setup, 4-week run)

## Phase 10–11 — SKIPPED (core track)

## Phase 12 — go-nogo-decision → `go-no-go-memo.md`
**Decision: GO — pilot the concierge import offer for 4 weeks.**

**TL;DR:**
- 5 of 8 SMBs gave up during data import; it's the dominant churn driver in month 1.
- Competitors already solve this with humans; pure self-serve loses to a free alternative.
- Pilot retires "will they accept help?" in 4 weeks at ~$6k cost. If no, we KILL — cheap.

**Key findings:** (each linked to interview evidence)

**Remaining risks:**
- Account-handoff churn (theme 3) is untouched; plan a separate cycle.
- The free alternative substitute means we need a second bet if concierge fails.

**If GO (active):** owner CS Lead Alice; 4-week pilot window; success = ≥30% book, ≥+8pp month-4 retention on booked cohort; first next step = draft the day-3 email template and CS playbook by Friday.

---

## What a real run produces

A real cycle yields ~12 files of actual evidence (not a compressed narrative). The artifacts above sketch the shape; your job is to fill them with the specifics of your project. Trust the pack to pull the next phase when you're ready to `/proceed`.
