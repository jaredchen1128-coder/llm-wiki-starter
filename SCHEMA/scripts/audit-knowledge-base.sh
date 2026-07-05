#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

echo "# Knowledge Base Audit"
echo

if [[ ! -d RAW || ! -d WIKI || ! -d SCHEMA ]]; then
  echo "ERROR: run this from the knowledge-base root, or pass the root path as the first argument."
  exit 1
fi

has_rg=0
if command -v rg >/dev/null 2>&1; then
  has_rg=1
fi

contains_fixed() {
  local needle="$1"
  local target="$2"
  if [[ "$has_rg" -eq 1 ]]; then
    rg -F --quiet "$needle" "$target" 2>/dev/null
  else
    grep -R -F -q "$needle" "$target" 2>/dev/null
  fi
}

contains_regex() {
  local pattern="$1"
  local target="$2"
  if [[ "$has_rg" -eq 1 ]]; then
    rg --quiet "$pattern" "$target" 2>/dev/null
  else
    grep -E -q "$pattern" "$target" 2>/dev/null
  fi
}

raw_files=()
while IFS= read -r file; do
  name="$(basename "$file")"
  case "$name" in
    .DS_Store|Thumbs.db|README.md|.gitkeep)
      continue
      ;;
  esac
  raw_files+=("$file")
done < <(find RAW -type f | sort)

echo "## RAW files not listed in WIKI/ingest-register.md"
missing_register=0
if ((${#raw_files[@]} > 0)); then
  for file in "${raw_files[@]}"; do
    if ! contains_fixed "$file" WIKI/ingest-register.md; then
      echo "- $file"
      missing_register=1
    fi
  done
fi
if [[ "$missing_register" -eq 0 ]]; then
  echo "- None"
fi
echo

echo "## RAW files not referenced from WIKI pages"
missing_wiki=0
if ((${#raw_files[@]} > 0)); then
  for file in "${raw_files[@]}"; do
    if ! contains_fixed "$file" WIKI; then
      echo "- $file"
      missing_wiki=1
    fi
  done
fi
if [[ "$missing_wiki" -eq 0 ]]; then
  echo "- None"
fi
echo

echo "## Source pages missing from WIKI/index.md"
missing_index=0
while IFS= read -r source_file; do
  page="$(basename "$source_file" .md)"
  if [[ "$page" == "README" ]]; then
    continue
  fi
  if ! contains_fixed "[[$page]]" WIKI/index.md; then
    echo "- $source_file"
    missing_index=1
  fi
done < <(find WIKI/sources -type f -name '*.md' | sort)
if [[ "$missing_index" -eq 0 ]]; then
  echo "- None"
fi
echo

echo "## Active WIKI pages without a source_count field"
missing_source_count=0
while IFS= read -r wiki_file; do
  if ! contains_regex '^source_count:' "$wiki_file"; then
    echo "- $wiki_file"
    missing_source_count=1
  fi
done < <(find WIKI -type f -name '*.md' | sort)
if [[ "$missing_source_count" -eq 0 ]]; then
  echo "- None"
fi
echo

echo "## Related-page links without relationship notes"
missing_relation=0
while IFS= read -r wiki_file; do
  while IFS= read -r line; do
    if [[ -n "$line" ]]; then
      echo "- $wiki_file:$line"
      missing_relation=1
    fi
  done < <(awk '
    /^## 相关页面/ { in_section=1; next }
    /^## / && in_section { in_section=0 }
    in_section && /^- \[\[/ && $0 !~ /：/ && $0 !~ /: / { print NR ":" $0 }
  ' "$wiki_file")
done < <(find WIKI -type f -name '*.md' | sort)
if [[ "$missing_relation" -eq 0 ]]; then
  echo "- None"
fi
echo

echo "Done."
