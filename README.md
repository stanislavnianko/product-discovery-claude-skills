# ClaudeSkills

A curated pack of Claude skills for structured product work. Primary targets: Claude (claude.ai) and Claude Cowork; also compatible with Claude Code.

## First pack: `discovery-phase`

Drives a team from a rough idea through 12 discovery phases to either a validated prototype/PoC or a documented GO/PIVOT/KILL memo. The tech-PoC track (phases 10–11) is skippable when feasibility is already known.

### The 12 phases

| # | Skill | Track | Produces |
|---|---|---|---|
| 0 | `orchestrator` | — | Drives the full cycle, writes `DISCOVERY.md` index |
| 1 | `problem-framing` | core | `problem-canvas.md` |
| 2 | `stakeholder-alignment` | core | `stakeholder-map.md` |
| 3 | `user-research-planning` | core | `research-plan.md`, `interview-guide.md` |
| 4 | `user-interviews` | core | `interview-notes/*.md` |
| 5 | `market-competitive-scan` | core | `competitive-scan.md` |
| 6 | `insight-synthesis` | core | `insight-matrix.md`, `themes.md` |
| 7 | `opportunity-solution-tree` | core | `opportunity-tree.md` |
| 8 | `risk-assumption-mapping` | core | `risk-assumption-map.md` |
| 9 | `scope-mvp-definition` | core | `scope-doc.md` |
| 10 | `tech-feasibility-spike` | tech-poc | `tech-spike-report.md` |
| 11 | `poc-prototype-plan` | tech-poc | `poc-plan.md` + runnable skeleton |
| 12 | `go-nogo-decision` | core | `go-no-go-memo.md` |

Flow diagram: [`skills/orchestrator/assets/flow.md`](skills/orchestrator/assets/flow.md).

## Install

### Option A — Claude plugin marketplace (recommended)

Inside Claude Cowork or Claude Code:

```
/plugin marketplace add https://github.com/<your-user>/ClaudeSkills
/plugin install discovery-phase
```

Skills then appear namespaced as `discovery-phase:orchestrator`, `discovery-phase:problem-framing`, etc. Updates land via `/plugin update`.

### Option B — Upload to claude.ai Projects

Each skill folder under `skills/` can be uploaded as-is to a Claude Project's Skills settings. The `orchestrator` skill should always be uploaded first; it references the others by name.

### Option C — `install.sh` fallback (Codex CLI / CI / plain filesystem)

```bash
git clone https://github.com/<your-user>/ClaudeSkills.git
cd ClaudeSkills
./install.sh                      # full pack → ~/.claude/skills/
./install.sh core                 # core track only (skips tech-poc phases)
./install.sh --project ~/myproj   # project scope: ~/myproj/.claude/skills/
./install.sh --link               # symlink instead of copy (dev mode)
./install.sh --dry-run            # preview without touching the filesystem
```

## Using the pack

Once installed, start any session with:

> Use the `orchestrator` skill to plan a discovery cycle for `<problem one-liner>`.

The skill asks three intake questions (problem, users, PoC needed?), writes a plan, creates `./discovery/DISCOVERY.md`, and walks you through phases one at a time with gates between them.

See [`skills/orchestrator/README.md`](skills/orchestrator/README.md) for the full usage guide.

## Repository layout

```
ClaudeSkills/
├── .claude-plugin/plugin.json    Plugin manifest (name=discovery-phase)
├── README.md                     (this file)
├── LICENSE                       MIT
├── install.sh                    Fallback filesystem installer
├── scripts/
│   └── validate-skills.sh        Lints every SKILL.md's frontmatter
└── skills/
    ├── orchestrator/             Master skill — entry point
    │   ├── SKILL.md
    │   ├── README.md
    │   ├── assets/flow.md
    │   └── templates/            Shared artifact templates (8 files)
    ├── problem-framing/
    ├── stakeholder-alignment/
    ├── user-research-planning/
    ├── user-interviews/
    ├── market-competitive-scan/
    ├── insight-synthesis/
    ├── opportunity-solution-tree/
    ├── risk-assumption-mapping/
    ├── scope-mvp-definition/
    ├── tech-feasibility-spike/   (tech-poc track)
    ├── poc-prototype-plan/       (tech-poc track)
    └── go-nogo-decision/
```

Each skill folder contains `SKILL.md` (frontmatter + workflow), `template.md` (fill-in artifact), and `examples/`.

## Validating

```bash
./scripts/validate-skills.sh
```

Checks every `SKILL.md` has valid frontmatter with required keys. Exits non-zero on failures.

## Contributing / extending

Patterns to follow when adding a phase or a new pack:

- Each skill lives in `skills/<skill-name>/` with its own `SKILL.md`.
- Frontmatter must include `name`, `description`. Phase skills also include `track`, `phase`, `produces`, `consumes`.
- Keep `description` under 500 characters — Claude Code truncates beyond that.
- Shared artifact templates live in `skills/orchestrator/templates/`. Phase-local templates cross-reference them.
- Reference existing skills by name (e.g., `blueprint`, `deep-research`) rather than duplicating functionality.

## Credits

Structure inspired by [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills). Opportunity-solution-tree methodology follows Teresa Torres. Assumption-mapping axes follow the desirability/viability/feasibility frame.

## License

MIT — see [LICENSE](LICENSE).
