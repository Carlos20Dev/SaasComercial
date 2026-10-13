#!/bin/sh
# Install this repository as an OpenCode global skill.
set -eu

usage() {
  printf '%s\n' "Usage: ./scripts/install.sh [--force]"
  printf '%s\n' "Creates ~/.config/opencode/skills/browser-validation/SKILL.md by default."
}

force=0
if [ "$#" -gt 1 ]; then
  usage >&2
  exit 2
fi

if [ "$#" -eq 1 ]; then
  case "$1" in
    --force) force=1 ;;
    -h|--help) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
fi

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
skills_dir="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills"
target="$skills_dir/browser-validation"

if [ ! -f "$repo_dir/SKILL.md" ]; then
  printf '%s\n' "SKILL.md was not found in $repo_dir." >&2
  exit 1
fi

mkdir -p "$skills_dir"

if [ -e "$target" ] || [ -L "$target" ]; then
  if [ "$force" -ne 1 ]; then
    printf '%s\n' "Refusing to replace existing skill at $target." >&2
    printf '%s\n' "Inspect it, then rerun with --force to replace it." >&2
    exit 1
  fi
  rm -rf "$target"
fi

mkdir -p "$target"
cp "$repo_dir/SKILL.md" "$target/SKILL.md"
printf '%s\n' "Copied SKILL.md to $target"

printf '%s\n' "Restart OpenCode to load the skill."
