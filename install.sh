#!/usr/bin/env bash
# Fallback installer — copies skills into ~/.claude/skills/ (or <project>/.claude/skills/).
# Preferred install path is the Claude plugin marketplace; see README.md.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$REPO_DIR/skills"

TARGET_DIR="$HOME/.claude/skills"
TRACK="all"              # all | core
FORCE=0
DRY_RUN=0
MODE="copy"              # copy | link

usage() {
  cat <<EOF
Usage: ./install.sh [options]

  core                  Install only track=core skills (skip tech-poc phases)
  all                   Install every skill (default)
  --project <path>      Install to <path>/.claude/skills/ instead of ~/.claude/skills/
  --link                Symlink instead of copy (live edits reflect immediately)
  --force               Overwrite existing skill folders
  --dry-run             List actions without touching the filesystem
  -h, --help            Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    core|all) TRACK="$1"; shift ;;
    --project) TARGET_DIR="$2/.claude/skills"; shift 2 ;;
    --link) MODE="link"; shift ;;
    --force) FORCE=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 1 ;;
  esac
done

skill_track() {
  local skill_md="$1"
  awk '/^---$/{n++;next} n==1 && /^track:/{print $2; exit}' "$skill_md"
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

  t="$(skill_track "$skill_md" || true)"
  if [[ "$TRACK" == "core" && "$t" == "tech-poc" ]]; then
    echo "skip (tech-poc, --core): $name"; ((skipped++)) || true; continue
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
