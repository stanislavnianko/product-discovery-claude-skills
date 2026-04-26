---
name: sow-draft
description: >-
  Deliverables group skill. Drafts a Statement of Work for legal/
  procurement review post-proposal acceptance. Captures deliverables,
  acceptance criteria, payment milestones, change-request process,
  warranties, and termination clauses. NOT a substitute for legal review.
  Produces sow-draft.md.
group: deliverables
produces: sow-draft.md
consumes: discovery-context.md, scope-doc.md, estimation.md, proposal.md (recommended)
origin: ECC
---

# SoW Draft

Statement of Work draft for the legal team to harden. The discovery team's job is to capture commercial reality precisely; legal then translates to enforceable terms.

> **This skill produces a draft, not a contract.** Always route through agency legal + client legal before signing. The discovery team should not be the last line of defense on contract terms.

## Step 1 — Read context + prerequisites

Read `discovery-context.md`. Halt if missing.

Pull **3. Engagement → Budget context** (drives payment structure), **6. Constraints** (regulatory clauses).

Required reads:
- `scope-doc.md` — deliverables and exclusions
- `estimation.md` — pricing structure

Recommended:
- `proposal.md` — gives the language already shared with client; SoW should be consistent (don't introduce new scope here)
- `risk-assumption-map.md` — informs warranty language

## Step 2 — Section walkthrough

### 2.1 Parties + engagement reference
Agency legal name, client legal name, engagement title, master agreement reference if applicable.

### 2.2 Deliverables
Pulled from `scope-doc.md` "in" column. Each deliverable as:

| # | Deliverable | Description | Format | Acceptance criteria |
|---|---|---|---|---|

**Acceptance criteria are the most important field.** Vague = disputes. "User can complete X workflow without errors" not "system works".

### 2.3 Out of scope
Verbatim from `scope-doc.md` "out" + "explicitly deferred". Critical — prevents post-signature scope creep.

### 2.4 Timeline + milestones
From estimation phases. Mark which milestones are payment triggers.

### 2.5 Pricing structure
Pick based on `discovery-context.md` section 3 Budget context:

| Model | Use when |
|---|---|
| **Fixed fee** | Tight scope, low-risk delivery, repeat work |
| **T&M with cap** | Moderate scope uncertainty |
| **Pure T&M** | Staff aug, exploratory delivery, very uncertain scope |
| **Phased / milestone-based** | Long engagement, gates between phases |

Spell out: hourly/daily rates per discipline if T&M, fixed numbers if fixed-fee, milestone amounts if phased.

### 2.6 Payment terms
- Invoice frequency (monthly / per milestone / on completion)
- Net days (Net 30 typical)
- Late payment terms
- Currency, exchange rate handling if cross-border
- Tax handling

### 2.7 Change-request process
**Critical.** Without this, every "small addition" mid-build becomes an argument.

- Who can request changes (named roles)
- How requests are submitted (form, email, ticket)
- Estimation turnaround (3-5 business days typical)
- Sign-off authority
- How changes affect price + timeline

### 2.8 Acceptance + revision process
- How client signs off on deliverables
- Revision rounds included (typically 1-2)
- Beyond included revisions = change request

### 2.9 Warranties
- What the agency warrants (e.g., 30-60 day bug fix window post-delivery)
- What's NOT warranted (third-party issues, scope changes, environment issues)
- Inputs for this come from `risk-assumption-map.md` `[agency]` rows — agency carries those, so warranty must be bounded.

### 2.10 IP and confidentiality
- Who owns what (typically: client owns deliverable IP; agency retains tools/methodologies)
- Confidentiality term (mutual NDA reference if exists)
- Use of work in agency portfolio (often: anonymized OK, named requires permission)

### 2.11 Termination
- For convenience (notice period both ways)
- For cause (with cure period)
- What happens to in-progress work + payment for it

### 2.12 Dependencies on client
From `scope-doc.md` outsourcing extras + risk-map `[client]` rows. State explicitly that delays on these may impact timeline + cost.

### 2.13 Assumptions
Verbatim from `estimation.md`. If any becomes false, SoW is voidable / must be amended.

## Step 3 — Outsourcing-specific clauses (often missed)

Add if relevant:

- **Time-zone overlap requirement** — if discovery context shows distributed teams
- **Subcontractor disclosure** — does the agency use subs? Client right to approve?
- **Data handling** — GDPR / HIPAA / SOC2 compliance specifics if section 6 flagged any
- **Communication cadence SLA** — response times, meeting cadence
- **Tooling rights** — who provides Linear/Jira/Slack/Figma seats; ownership of artifacts in those tools

## Step 4 — Output

`./discovery/sow-draft.md` per `./template.md`. Mark prominently at top:

> **DRAFT — REQUIRES AGENCY LEGAL + CLIENT LEGAL REVIEW BEFORE EXECUTION.**

Append to `_log.md`: `[sow-draft | <date>] pricing model: <model>; deliverables: <count>; acceptance criteria defined: <Y/N>; legal review: pending`.

## Anti-patterns

- **Ambiguous acceptance criteria.** "Acceptance: when client says ok" = future dispute. Be precise.
- **No change-request process.** Mid-build scope additions become free, then resented, then disputed.
- **Pricing structure mismatch.** Fixed-fee on uncertain scope = either agency loses money or client gets hidden change requests.
- **Dependencies on client buried.** They must be top-section visible.
- **Skipping legal review.** This skill produces a draft; the BA must route to legal.
