---
name: sow-draft
pack: discovery-phase
description: >-
  [discovery-phase pack · deliverables] Drafts a Statement of Work for
  legal/procurement review post-proposal acceptance. Captures
  deliverables, acceptance criteria, payment milestones, change-request
  process, warranties, and termination clauses. NOT a substitute for
  legal review. Produces sow-draft.md.
group: deliverables
produces: sow-draft.md
consumes: discovery-context.md, scope-doc.md, estimation.md, proposal.md (recommended)
origin: ECC
---

# SoW Draft

> Part of the **discovery-phase** skill pack · `deliverables` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Statement of Work draft for the legal team to harden. The discovery team's job is to capture commercial reality precisely; legal then translates to enforceable terms.

> **This skill produces a draft, not a contract.** Always route through agency legal + client legal before signing. The discovery team should not be the last line of defense on contract terms.

## Step 1 — Read context + prerequisites

Read `discovery-context.md` (sections **3. Engagement → Budget context** — drives payment structure; **6. Constraints** — regulatory clauses), `scope-doc.md` (deliverables + exclusions), and `estimation.md` (pricing structure). Recommended: `proposal.md` (consistency with what's already shared with client) and `risk-assumption-map.md` (informs warranty language).

If `discovery-context.md` is missing, ask the BA inline: "(a) budget structure (fixed-fee / T&M / milestone-based); (b) regulatory constraints (GDPR / HIPAA / SOC2 / none)?" — tag the output `[ASSUMED COMMERCIAL]` and DRAFT-ONLY. If `scope-doc.md` or `estimation.md` is missing, ask for stand-in bullets, or proceed with `[TBD]` placeholders and a non-removable DRAFT-ONLY banner — NOT for legal review until placeholders resolved. Never block; recommend `profile-builder` / `feature-scoping` / `estimation` for high-stakes work.

## Step 2 — Fill the template

Fill `./template.md`. It owns the structure (parties, deliverables table, out-of-scope, timeline + milestones, pricing model, payment terms, change-requests, acceptance + revisions, warranties, IP + confidentiality, termination, client dependencies, assumptions, outsourcing-specific clauses, signatures). This skill's job is the *content*; the template is the shape.

**Fields that hide disputes — be precise here:**

- **Acceptance criteria** (per deliverable). "User can complete X workflow without errors" not "system works". Vague = future dispute.
- **Out of scope.** Verbatim from `scope-doc.md` "out" + "explicitly deferred". Critical — prevents post-signature scope creep.
- **Pricing model.** Pick from `discovery-context.md` budget context: fixed-fee (tight scope, repeat work) / T&M with cap (moderate uncertainty) / pure T&M (staff aug, exploratory) / phased (long engagement with gates). Spell out: rates per discipline if T&M, fixed numbers if fixed-fee, milestone amounts if phased.
- **Change-request process.** Without it, every "small addition" mid-build becomes an argument. Specify: who can request, how submitted, estimation turnaround (3-5 business days typical), sign-off authority, how changes affect price + timeline.
- **Warranties.** What the agency warrants (e.g., 30-60 day bug-fix window post-delivery) AND what's NOT warranted (third-party issues, scope changes, environment). Bound from `risk-assumption-map.md` `[agency]` rows.
- **Client dependencies.** From `scope-doc.md` outsourcing extras + risk-map `[client]` rows. State explicitly that delays may impact timeline + cost. Don't bury — top-section visible.
- **Assumptions.** Verbatim from `estimation.md` "Assumptions that invalidate the estimate". If any becomes false, SoW is voidable / must be amended.

## Step 3 — Outsourcing-specific clauses (often missed)

Add to template's section 14 if relevant:
- **Time-zone overlap requirement** — if context shows distributed teams
- **Subcontractor disclosure** — does the agency use subs? Client right to approve?
- **Data handling** — GDPR / HIPAA / SOC2 specifics if section 6 flagged any
- **Communication cadence SLA** — response times, meeting cadence
- **Tooling rights** — who provides Linear/Jira/Slack/Figma seats; ownership of artifacts

## Step 4 — Output

`./discovery/sow-draft.md` per `./template.md`. Mark prominently at top:

> **DRAFT — REQUIRES AGENCY LEGAL + CLIENT LEGAL REVIEW BEFORE EXECUTION.**

Append to `_log.md`: `[sow-draft | YYYY-MM-DD] pricing: <model>; deliverables: <count>; acceptance_defined: <Y/N>; legal_review: pending`.

## Anti-patterns

- **Ambiguous acceptance criteria.** "Acceptance: when client says ok" = future dispute. Be precise.
- **No change-request process.** Mid-build scope additions become free, then resented, then disputed.
- **Pricing structure mismatch.** Fixed-fee on uncertain scope = either agency loses money or client gets hidden change requests.
- **Dependencies on client buried.** They must be top-section visible.
- **Skipping legal review.** This skill produces a draft; the BA must route to legal.
