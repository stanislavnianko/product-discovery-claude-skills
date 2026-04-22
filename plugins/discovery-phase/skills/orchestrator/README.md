# discovery-phase — Orchestrator

Human-facing documentation for the `discovery-phase` skill pack.

## What this pack does

Takes a rough idea and drives it through a structured 12-phase discovery cycle:

```
Frame → Align → Research-plan → Interview → Market-scan
      → Synthesize → Opportunity-tree → Risk-map → Scope
      → (Spike → PoC) → Decide
```

Each phase produces a named artifact. The terminal output is either:
- a **GO/PIVOT/KILL memo** + artifacts (core track), or
- the memo **plus a runnable PoC skeleton** (core + tech-poc track).

## Who it's for

- Product managers starting a new initiative.
- Founders validating a problem before committing engineers.
- Engineering leads scoping a prototype.
- Anyone who has been told "just build it" and wants to push back with evidence.

## Typical cycle duration

- **Core track only:** 1–2 weeks with ~5–8 interviews.
- **Core + tech-PoC:** 3–4 weeks.

## How to run

After the pack is installed (see repo root `README.md`), in any Claude session:

> Use the `orchestrator` skill to start a discovery cycle for &lt;problem&gt;.

The skill asks 3 intake questions, writes a plan, and walks you through phases one at a time with gates between them.

## What you'll own at the end

```
discovery/
├── DISCOVERY.md                 Running index
├── problem-canvas.md
├── stakeholder-map.md
├── research-plan.md
├── interview-guide.md
├── interview-notes/
│   ├── p01-<user-initials>.md
│   └── ...
├── competitive-scan.md
├── insight-matrix.md
├── themes.md
├── opportunity-tree.md
├── risk-assumption-map.md
├── scope-doc.md
├── tech-spike-report.md         (tech-poc track only)
├── poc-plan.md                  (tech-poc track only)
├── poc/                         (tech-poc track only — runnable skeleton)
└── go-no-go-memo.md
```
