#!/usr/bin/env bash
# Builds release artifacts for claude.ai / Claude Desktop install:
#   dist/skills/<skill>.zip       — one zip per skill (22 total)
#   dist/discovery-phase-all.zip  — bundle of all per-skill zips
#
# Each per-skill zip contains a single top-level folder with SKILL.md inside,
# which is the layout claude.ai's "Upload skill" UI expects.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$REPO_DIR/plugins/discovery-phase/skills"
DIST_DIR="$REPO_DIR/dist"

echo "==> Validating skills"
"$REPO_DIR/scripts/validate-skills.sh"

echo "==> Cleaning $DIST_DIR"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR/skills"

echo "==> Packaging individual skills"
count=0
for skill_path in "$SOURCE_DIR"/*/; do
  name="$(basename "$skill_path")"
  zip_path="$DIST_DIR/skills/$name.zip"
  ( cd "$SOURCE_DIR" && zip -qr "$zip_path" "$name" )
  echo "  packed: $name.zip"
  count=$((count + 1))
done

echo "==> Packaging discovery-phase-all.zip"
( cd "$DIST_DIR" && zip -qr discovery-phase-all.zip skills )

echo ""
echo "Done. $count individual zips + 1 bundle."
echo ""
ls -lh "$DIST_DIR" "$DIST_DIR/skills" | head -40
