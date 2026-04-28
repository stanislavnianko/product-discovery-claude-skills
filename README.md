# product-discovery-claude-skills

A Claude skill pack for structured product discovery — designed for **outsourcing engagements** (BA / agency / consultant working on a client's product), but works equally well for internal product teams.

22 skills, organized into 7 groups, runnable independently in any sequence. One foundation skill writes a reusable context file that every other skill reads.

## Concept

```
profile-builder  ──writes──▶  discovery-context.md
                                   │
                                   ▼
              every other skill reads it; halts if missing
```

## Skill groups

| Group | Skills | What they do |
|---|---|---|
| **Foundation** | `profile-builder`, `discovery-conductor` | Build the context file. Optional conductor guides sequence. |
| **Discovery** | `problem-framing`, `stakeholder-mapping`, `research-planning` | Frame the problem, surface stakeholders, plan how to learn. |
| **Evidence** | `user-interviews`, `sme-workshops`, `competitive-scan`, `secondary-research`, `support-data-analysis` | Gather evidence — pick what your access actually permits. |
| **Synthesis** | `insight-synthesis`, `opportunity-mapping`, `risk-assumption-mapping` | Turn raw evidence into ranked themes, opportunities, and risks. |
| **Scoping** | `feature-scoping`, `mvp-definition`, `estimation` | Define what to build, what's MVP vs PoC, and how much it costs. |
| **Validation** | `feasibility-spike`, `prototype-plan` | Retire tech / product assumptions before build. |
| **Deliverables** | `proposal`, `sow-draft`, `discovery-handoff`, `go-nogo-memo` | Commercial + decisional outputs for the client and the receiving team. |

Full skill list: see the [skill groups table above](#skill-groups) or run `./scripts/validate-skills.sh` to enumerate.

## Why outsourcing-first?

Most product-discovery resources assume an internal team with direct user access. Real outsourcing engagements look different:

- The client owns the problem; you extract it from a brief
- End users may be unreachable — replace interviews with SME workshops, support-data analysis, secondary research
- Decision-owner is the client, not the agency
- Output is usually a proposal / SoW / handoff, not a GO/PIVOT/KILL memo
- Risks split into client-owned, agency-owned, shared

This pack defaults to that reality. For internal product use, the same skills apply unchanged — the foundation captures "we're internal" in the context file, and every skill adapts.

## Install

### Recommended: Claude Desktop or claude.ai (web)

Designed for non-technical users (BAs, PMs, consultants). No git, no terminal.

1. **Download the bundle.** Open the [latest release][rel] and download `discovery-phase-all.zip` (all 22 skills) — or grab individual `<skill>.zip` files if you only need a few.
2. **Unzip** `discovery-phase-all.zip`. You'll get a `skills/` folder with 22 individual `<skill>.zip` files inside. **Do not unzip those inner files** — claude.ai expects each skill as a single zip.
3. **Open Claude → Settings → Capabilities → Skills → Upload skill.** Same path in Claude Desktop and claude.ai web.
4. **Upload `profile-builder.zip` first** — it's the foundation every other skill reads. Then upload the other skills you need.

> Tip: every skill checks for `discovery-context.md` in your project and halts if missing. Always run `profile-builder` first in any new engagement.

[rel]: https://github.com/stanislavnianko/product-discovery-claude-skills/releases/latest

### Advanced: Claude Code `/plugin` (CLI / IDE)

```
/plugin marketplace add https://github.com/stanislavnianko/product-discovery-claude-skills
/plugin install discovery-phase@claude-skills
```

The `@claude-skills` suffix is the marketplace name from `.claude-plugin/marketplace.json` — without it Claude Code can't locate the plugin. Skills appear namespaced as `discovery-phase:profile-builder`, etc.

### Advanced: filesystem install (CI / fallback)

```bash
git clone https://github.com/stanislavnianko/product-discovery-claude-skills.git
cd product-discovery-claude-skills
./install.sh                            # all 22 skills → ~/.claude/skills/
./install.sh --group foundation         # just foundation skills
./install.sh --project ~/myclient       # install into project scope
./install.sh --force                    # overwrite existing (re-install)
./install.sh --link --force             # dev mode: symlink, overwrite
./install.sh --dry-run                  # preview without writing
```

`./install.sh` without `--force` skips folders that already exist — pass `--force` to overwrite when re-installing.

## Using the pack

**1. Build context first.**

```
Use the profile-builder skill.
```

It interviews you about the client, the engagement, the access, and the deliverable. Writes `discovery-context.md` to your current project root. That's the one file every other skill needs.

**2. Run skills à la carte, or use the conductor.**

À la carte:
```
Use the problem-framing skill.
Use the stakeholder-mapping skill.
Use the user-interviews skill.
... etc
```

Guided:
```
Use the discovery-conductor skill.
```

The conductor reads your context, picks a sequence based on engagement type and access level, and walks you through it — but you can override any step.

**3. Each skill produces an artifact in `./discovery/`.**

Discovery cycle output looks like:

```
./
├── discovery-context.md         (from profile-builder, foundation)
└── discovery/
    ├── _log.md                  (running log of skill runs)
    ├── problem-canvas.md
    ├── stakeholder-map.md
    ├── research-plan.md
    ├── interview-guide.md
    ├── interview-notes/
    ├── sme-notes/
    ├── competitive-scan.md
    ├── secondary-research.md
    ├── support-data-analysis.md
    ├── insight-matrix.md
    ├── themes.md
    ├── opportunity-tree.md
    ├── risk-assumption-map.md
    ├── scope-doc.md
    ├── mvp-definition.md
    ├── estimation.md
    ├── tech-spike-report.md
    ├── poc-plan.md
    ├── poc/                     (runnable skeleton if applicable)
    ├── proposal.md
    ├── sow-draft.md
    ├── discovery-handoff.md
    └── go-no-go-memo.md
```

Most engagements run a subset — typical pre-sale produces ~10 files; a full paid discovery sprint produces ~18.

## Repository layout

```
product-discovery-claude-skills/
├── .claude-plugin/marketplace.json   Marketplace manifest (lists 1 plugin)
├── README.md                         (this file)
├── LICENSE                           MIT
├── install.sh                        Fallback filesystem installer
├── scripts/
│   └── validate-skills.sh            Lints SKILL.md frontmatter
└── plugins/
    └── discovery-phase/              The plugin
        ├── .claude-plugin/plugin.json
        └── skills/                   22 skills, one folder each
            ├── profile-builder/
            ├── discovery-conductor/
            ├── problem-framing/
            ├── stakeholder-mapping/
            ├── research-planning/
            ├── user-interviews/
            ├── sme-workshops/
            ├── competitive-scan/
            ├── secondary-research/
            ├── support-data-analysis/
            ├── insight-synthesis/
            ├── opportunity-mapping/
            ├── risk-assumption-mapping/
            ├── feature-scoping/
            ├── mvp-definition/
            ├── estimation/
            ├── feasibility-spike/
            ├── prototype-plan/
            ├── proposal/
            ├── sow-draft/
            ├── discovery-handoff/
            └── go-nogo-memo/
```

Each skill folder has `SKILL.md` (frontmatter + procedure) and `template.md` (artifact template).

## Validating

```bash
./scripts/validate-skills.sh
```

Confirms every SKILL.md has valid frontmatter with `name` + `description`, plus group/produces for non-foundation skills.

## Versioning

**v1.0.0** — first stable release. 22 skills, foundation pattern, group-based, outsourcing-first framing.

Pre-1.0 history (12-phase orchestrator pattern) was wiped on the v1.0 release. If you need it, check the `v0.1.0` git tag.

## License

MIT — see [LICENSE](LICENSE).
