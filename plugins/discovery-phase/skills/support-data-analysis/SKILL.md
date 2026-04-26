---
name: support-data-analysis
description: >-
  Evidence group skill. Mines client's existing data — support tickets,
  call recordings, chat logs, NPS verbatims, sales call transcripts,
  product analytics — for unsolicited user signal. Faster and more
  honest than interviews. Produces support-data-analysis.md. Reads
  discovery-context.md.
group: evidence
produces: support-data-analysis.md
consumes: discovery-context.md, problem-canvas.md (optional)
origin: ECC
---

# Support Data Analysis

The most underused evidence source in outsourcing discovery. Users complain in tickets, chats, and NPS comments without any selection bias from interview recruitment. The data already exists — just nobody read it systematically.

## Step 1 — Read discovery context

Read `discovery-context.md`. Halt if missing.

Pull **4. Access & Data → Data we can request**, **6. Constraints** (PII, regulatory).

If no data sources listed in section 4, ask BA: "What data does the client have that we could request access to? Tickets / NPS / chat / call recordings / analytics?" Then update the context file.

## Step 2 — Request data from client

Send the BA a templated ask to forward to the client SME:

> "We'd like to ground discovery in real user signal. Could you share:
> 1. Support tickets from the last 90 days mentioning `<keywords related to problem>` (anonymized PII OK)
> 2. NPS verbatims from the last 6 months (the comments, not the scores)
> 3. 5-10 sales call recordings or transcripts where this problem came up
> 4. Product analytics for the relevant flow (event funnel, drop-off rates)
>
> Send what you have; don't gate on completeness."

## Step 3 — Pre-clean PII

Before analysis, scan for and redact: emails, phone numbers, full names, account IDs, credit card fragments. Use a script if volume is high. Note in the artifact that PII was redacted.

If regulatory constraints (GDPR, HIPAA) prohibit handling raw data, ask the client to do the redaction before sending. Document the chain-of-custody.

## Step 4 — Code the data

For each data source, tag entries with:

- **Pain category** (start with 5-7 buckets from the problem-canvas Open questions; let new ones emerge)
- **Severity signal** — language strength, escalation, volume per user
- **Workaround mentioned** — what the user did instead
- **Outcome** — resolved / unresolved / churned / refunded / churning-risk

For tickets: aim to code 50-200 in 2-4 hours. Larger volumes — sample stratified by date and user segment.

For NPS verbatims: read every one. They're short.

For call recordings: timestamp the relevant 30-second clips; don't try to listen to full calls.

For analytics: run funnel + cohort analysis at the specific point the problem-canvas says it hurts. Don't go on a fishing expedition.

## Step 5 — Aggregate

Per pain category compute:
- Frequency (count or % of sample)
- Severity distribution
- Common workarounds
- Notable verbatim quotes (3-5 max per category)

## Step 6 — Cross-check against problem-canvas

For each Open question in `problem-canvas.md`, write what the data says — supports, contradicts, or silent.

If data **contradicts** the hypothesis: flag prominently. This is the highest-value outcome from this skill — the team was about to build the wrong thing.

If data is **silent** on a question: that's still a finding (push toward primary research or `sme-workshops`).

## Output

`./discovery/support-data-analysis.md` per `./template.md`.

Append to `_log.md`: `[support-data-analysis | <date>] sources: <list>; volume: <count>; categories: <count>; canvas claims supported/contradicted/silent: <X/Y/Z>`.

## Anti-patterns

- **Cherry-picking.** Code everything in the sample window or stratify; don't read 5 tickets and declare a pattern.
- **Ignoring resolved tickets.** "Resolved" tickets often expose workarounds, which are signal.
- **Over-coding.** 7 buckets is the limit. More = no longer mining for signal, just classifying.
- **Volume worship.** 10,000 tickets is not better than 200 well-coded ones. Fast confirmation that you've reached signal saturation > exhaustive coding.
- **Skipping the contradiction check.** This is the *point* of the skill.
