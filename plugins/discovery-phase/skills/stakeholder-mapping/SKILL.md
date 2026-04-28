---
name: stakeholder-mapping
pack: discovery-phase
description: >-
  [discovery-phase pack · discovery] Maps client-side AND agency-side
  stakeholders with their stakes, success metrics, concerns, decision
  rights, and conflicts. Two-tier map. Surfaces deal-breakers in week 1,
  not week 4. Produces stakeholder-map.md. Reads discovery-context.md.
group: discovery
produces: stakeholder-map.md
consumes: discovery-context.md, problem-canvas.md (optional)
origin: ECC
---

# Stakeholder Mapping

> Part of the **discovery-phase** skill pack · `discovery` group · reads `discovery-context.md` (run `profile-builder` first if missing).

Two-tier map for outsourcing reality: client stakeholders + agency stakeholders. The agency tier is the one most often forgotten, and it's where engagement-killers (sales conflict, delivery capacity, partner dependencies) live.

## Step 1 — Read discovery context

Read `discovery-context.md` (sections **1. Client → Decision-makers**, **3. Engagement → Runner role**) and `problem-canvas.md` if it exists (anchors stakeholders against the actual problem).

If `discovery-context.md` is missing, ask the BA inline: "(a) name 1–3 client decision-makers + role; (b) engagement mode (pre-sale / paid discovery / delivery / staff aug)?" — tag any unverified stakeholder field as `[ASSUMED]`. Never block; recommend `profile-builder` for high-stakes work.

## Step 2 — List client-side stakeholders

Identify 3-6 people on the client side. Cover these roles (combine if one person fills multiple):

- **Decision-maker** — whose approval ships this
- **Budget owner** — who pays
- **Delivery owner (client side)** — who'll integrate the result into their org
- **Impacted teams** — whose work is touched (CS, sales, ops, security, legal)
- **Domain experts** — compliance, security, accessibility — needed for sign-off
- **A sceptic** — the person most likely to block. **Always include.** If everyone is supportive, the map is incomplete.

## Step 3 — List agency-side stakeholders

Often skipped. Typical roles:

- **Engagement lead / account manager** — owns the client relationship
- **Delivery owner (agency side)** — would lead build if engagement converts
- **Discipline leads** — engineering, design, QA — capacity gates
- **Sales / partnerships** — if pre-sale, has commercial pressure
- **Domain SME** — if the domain (healthcare, finance) requires specific expertise
- **Finance / ops** — for fixed-fee viability

## Step 4 — Per-stakeholder fields

For each stakeholder (both tiers):

| Field | Purpose |
|---|---|
| Name + role + tier (client/agency) | |
| Their stake | What they win/lose from the outcome |
| Their success metric | How they personally know this is worth it |
| Their concerns | In their own words, ideally a quote |
| Input needed (and when) | Which discovery phase needs them |
| Decision rights | Approve / veto / advise / inform |

## Step 5 — Surface conflicts

After both tiers are filled, scan the success-metric column. Conflicts often look like:

- Client sales wants "fast time-to-value" vs client security wants "SSO integration first"
- Agency sales wants "convert to delivery" vs agency engineering wants "scope this down or we'll miss deadlines"
- Client decision-maker wants "build it" vs client end-user manager wants "fix the workflow first"

**Name conflicts on the map. Do not try to resolve them here.** Resolution happens during proposal/SoW or in stakeholder workshops.

## Step 6 — 15-minute async check-ins

Recommend (or send, if BA has the access) a 3-bullet async message to each high-stakes stakeholder:

1. The problem-canvas one-liner.
2. "Here's what I think your success criterion is — right?"
3. "Anything you'd kill this engagement over? Say it now, not in 4 weeks."

Capture responses in the map.

## Step 7 — Set review cadence

Pick one based on engagement timeline:

- Pre-sale sprint (≤2 wks): no recurring review, ad-hoc sync per major artifact
- Discovery sprint (3-4 wks): weekly async update, doc-based
- Delivery phase: bi-weekly stakeholder readout
- Staff aug: mirror client's existing rituals

## Output

`./discovery/stakeholder-map.md` per `./template.md`.

Append to `_log.md`: `[stakeholder-mapping | YYYY-MM-DD] client_tier: <N>; agency_tier: <N>; conflicts: <N>; cadence: <cadence>`.

## Anti-patterns

- **Skipping the agency tier.** It's where the most fixable conflicts hide.
- **No sceptic on the map.** Find one. If you really can't, your discovery is happening inside an echo chamber.
- **"We'll loop them in later."** Stakeholders who learn about a project on week 4 veto it on week 4. Cheaper to absorb the veto on week 1.
- **Static map.** Update after major artifacts (insights, scope, prototype). Especially before any deliverable skill runs.
