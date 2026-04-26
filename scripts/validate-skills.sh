#!/usr/bin/env bash
# Validate every skill has SKILL.md with required frontmatter.
# Usage: ./scripts/validate-skills.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_DIR/plugins/discovery-phase/skills"

failures=0
warnings=0

check_skill() {
  local dir="$1"
  local name; name="$(basename "$dir")"
  local md="$dir/SKILL.md"

  if [[ ! -f "$md" ]]; then
    echo "FAIL  $name: missing SKILL.md"; ((failures++)) || true; return
  fi

  # Must start with YAML frontmatter
  if [[ "$(head -n1 "$md")" != "---" ]]; then
    echo "FAIL  $name: SKILL.md does not start with '---'"; ((failures++)) || true; return
  fi

  # Extract frontmatter block
  local fm
  fm="$(awk '/^---$/{n++; next} n==1 {print} n==2 {exit}' "$md")"

  # Required keys
  for key in name description; do
    if ! grep -qE "^${key}:" <<<"$fm"; then
      echo "FAIL  $name: missing frontmatter key '$key'"; ((failures++)) || true
    fi
  done

  # Non-foundation/conductor skills should declare group + produces
  if [[ "$name" != "profile-builder" && "$name" != "discovery-conductor" ]]; then
    for key in group produces; do
      if ! grep -qE "^${key}:" <<<"$fm"; then
        echo "WARN  $name: missing recommended key '$key'"; ((warnings++)) || true
      fi
    done
  fi

  # Description length guard (single-line assumption)
  local desc
  desc="$(grep -E '^description:' <<<"$fm" | sed -E 's/^description:[[:space:]]*//')"
  if [[ ${#desc} -gt 500 ]]; then
    echo "WARN  $name: description is ${#desc} chars (>500 may be truncated)"; ((warnings++)) || true
  fi
}

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "FAIL  no skills/ directory found at $SKILLS_DIR"; exit 1
fi

count=0
for d in "$SKILLS_DIR"/*/; do
  check_skill "$d"
  ((count++)) || true
done

echo ""
echo "Checked $count skills. $failures failure(s), $warnings warning(s)."
exit $failures
