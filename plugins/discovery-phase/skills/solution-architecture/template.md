# Solution Architecture

> Phase: solution-architecture. Discovery-grade design (C4 Level 1-2). Not detailed design.

## Overview
- Scope source: `<scope-doc.md | mvp-definition.md>`
- Client constraints: `<cloud, vendor, language, regulatory>`
- Confidence: `<strong | mixed | thin>`
- Assumed-tagged items: `<count>`

---

## 1. System context

```mermaid
flowchart LR
  %% Replace with actual actors and external systems
  actor1[Actor]
  system[<<system>>]
  ext1[External System]

  actor1 --> system
  system --> ext1
```

**Out of scope (explicit):**
- <system / capability>
- <system / capability>

---

## 2. Logical components

| # | Component | Responsibility | Owns data? | Talks to | New / Existing |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |

---

## 3. Critical data flows

### Flow 1 — `<name>`
- Sync / Async: `<>`
- Failure mode: `<>`
- Expected latency / volume: `<>`
- Steps:
  1.
  2.
  3.

### Flow 2 — `<name>`
(repeat)

---

## 4. Integrations + auth

| Integration | Direction | Protocol | Auth model | Data ownership | Rate / SLA |
|---|---|---|---|---|---|
| | | | | | |

**Auth model:**
<who issues identity, who validates, session location, SSO requirements>

---

## 5. Non-functional requirements

| NFR | Target | Source |
|---|---|---|
| Availability | | |
| Latency (p95) | | |
| Throughput | | |
| Scale ceiling | | |
| Security / compliance | | |
| Data retention | | |
| Observability | | |
| Recovery (RTO/RPO) | | |

---

## 6. Tech-stack rationale

| Choice | Selected | Alternatives considered | Why this | Constraint / skill / fit |
|---|---|---|---|---|
| Language | | | | |
| Framework | | | | |
| Database | | | | |
| Queue / events | | | | |
| Deploy target | | | | |
| Auth | | | | |
| Observability | | | | |

---

## 7. Risk surface update

**New technical risks discovered:**
1. <risk> — <severity> — <mitigation>
2.

**Existing risks from `risk-assumption-map.md`:**
- <risk-id>: `<mitigated | accepted | amplified>` — <rationale>
- <risk-id>:

---

## Pressure test results
- [ ] Estimable — `estimation` can derive effort without invention?
- [ ] Scope-aligned — every component maps to a scope item?
- [ ] Constraint-honest — respects client-mandated tech / cloud / vendor?
- [ ] NFR-grounded — targets are numbers, not adjectives?
- [ ] Risk-linked — every HIGH risk addressed?

## Per-skill follow-ups
-
