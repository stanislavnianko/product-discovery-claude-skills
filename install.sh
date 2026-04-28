#!/usr/bin/env bash
# Fallback installer — copies skills into ~/.claude/skills/ (or <project>/.claude/skills/).
# Preferred install path is the Claude plugin marketplace; see README.md.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$REPO_DIR/plugins/discovery-phase/skills"

TARGET_DIR="$HOME/.claude/skills"
GROUP=""                  # empty = all; otherwise restrict to this group
FORCE=0
DRY_RUN=0
MODE="copy"               # copy | link

usage() {
  cat <<EOF
Usage: ./install.sh [options]

  --group <name>        Install only skills in this group
                        (foundation, discovery, evidence, synthesis,
                         scoping, validation, deliverables)
  --project <path>      Install to <path>/.claude/skills/ instead of ~/.claude/skills/
  --link                Symlink instead of copy (live edits reflect immediately)
  --force               Overwrite existing skill folders
  --dry-run             List actions without touching the filesystem
  -h, --help            Show this help

Examples:
  ./install.sh                              Install all 22 skills globally
  ./install.sh --group foundation           Just profile-builder + conductor
  ./install.sh --group evidence --project . Install evidence group into current dir
  ./install.sh --force                      Re-install, overwrite existing folders
  ./install.sh --link --force               Dev mode: symlink, overwrite

NOTE: For Claude Cowork / Code, the preferred path is the plugin marketplace:
  /plugin marketplace add https://github.com/stanislavnianko/product-discovery-claude-skills
  /plugin install discovery-phase
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --group) GROUP="$2"; shift 2 ;;
    --project) TARGET_DIR="$2/.claude/skills"; shift 2 ;;
    --link) MODE="link"; shift ;;
    --force) FORCE=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 1 ;;
  esac
done

skill_group() {
  local skill_md="$1"
  awk '/^---$/{n++;next} n==1 && /^group:/{print $2; exit}' "$skill_md"
}

mkdir -p "$TARGET_DIR"

installed=0
skipped=0
for skill_path in "$SOURCE_DIR"/*/; do
  name="$(basename "$skill_path")"
  skill_md="$skill_path/SKILL.md"

  if [[ ! -f "$skill_md" ]]; then
    echo "skip (no SKILL.md): $name"; continue
  fi

  if [[ -n "$GROUP" ]]; then
    g="$(skill_group "$skill_md" || true)"
    if [[ "$g" != "$GROUP" ]]; then
      echo "skip (group=$g != $GROUP): $name"; ((skipped++)) || true; continue
    fi
  fi

  dest="$TARGET_DIR/$name"
  if [[ -e "$dest" && $FORCE -eq 0 ]]; then
    echo "skip (exists, use --force): $name"; ((skipped++)) || true; continue
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    echo "would install ($MODE): $name -> $dest"
  else
    rm -rf "$dest"
    if [[ "$MODE" == "link" ]]; then
      ln -s "$skill_path" "$dest"
    else
      cp -R "$skill_path" "$dest"
    fi
    echo "installed: $name"
  fi
  ((installed++)) || true
done

echo ""
echo "Done. $installed installed, $skipped skipped. Target: $TARGET_DIR"
