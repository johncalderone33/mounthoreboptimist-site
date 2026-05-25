#!/usr/bin/env bash
# Render meet-an-optimist-asked.md (a markdown table) into a styled HTML page.
# Usage: bash docs/render-asked-table.sh

set -euo pipefail
cd "$(dirname "$0")"

SRC="meet-an-optimist-asked.md"
OUT="meet-an-optimist-asked.html"

[ -f "$SRC" ] || { echo "Error: $SRC not found in $(pwd)" >&2; exit 1; }

{
cat <<'HEAD'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Meet an Optimist — Asked questions</title>
  <style>
    :root {
      --blue: #1f4f8b;
      --gold: #f4b400;
      --beige: #faf6ef;
      --slate: #5b6571;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
      color: var(--blue);
      background: var(--beige);
      line-height: 1.5;
    }
    main {
      max-width: 64rem;
      margin: 0 auto;
      padding: 3rem 1.5rem;
    }
    .eyebrow {
      font-size: 0.75rem;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      color: var(--slate);
      margin: 0 0 0.5rem;
    }
    h1 { font-size: 2rem; margin: 0 0 0.5rem; }
    p.note { color: var(--slate); margin: 0 0 2rem; font-size: 0.9rem; }
    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      box-shadow: 0 1px 3px rgba(31, 79, 139, 0.08);
    }
    th, td {
      padding: 0.75rem 1rem;
      text-align: left;
      vertical-align: top;
      border-bottom: 1px solid #e6dfd2;
    }
    th {
      background: var(--blue);
      color: #fff;
      font-weight: 600;
      font-size: 0.75rem;
      letter-spacing: 0.15em;
      text-transform: uppercase;
    }
    tr:last-child td { border-bottom: none; }
    tr:nth-child(even) td { background: #fcfaf5; }
  </style>
</head>
<body>
  <main>
    <p class="eyebrow">Mount Horeb Optimist Club</p>
    <h1>Meet an Optimist &mdash; Asked questions</h1>
    <p class="note">Generated from meet-an-optimist-asked.md by render-asked-table.sh.</p>
    <table>
HEAD

awk '
  /^\|/ {
    row++
    if (row == 2) next
    line = $0
    sub(/^\|/, "", line)
    sub(/\|[[:space:]]*$/, "", line)
    n = split(line, cells, /\|/)
    tag = (row == 1) ? "th" : "td"
    printf("      <tr>")
    for (i = 1; i <= n; i++) {
      cell = cells[i]
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", cell)
      gsub(/&/, "\\&amp;", cell)
      gsub(/</, "\\&lt;", cell)
      gsub(/>/, "\\&gt;", cell)
      printf("<%s>%s</%s>", tag, cell, tag)
    }
    print "</tr>"
  }
' "$SRC"

cat <<'TAIL'
    </table>
  </main>
</body>
</html>
TAIL
} > "$OUT"

echo "Wrote $OUT"
