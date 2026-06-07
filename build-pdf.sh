#!/bin/zsh
set -e
cd "REPLACE_WITH_REPO_ROOT/design"

COMBINED=/tmp/projectI-combined.md

cat > "$COMBINED" <<EOF
<div class="cover">

# Project I

## Master Design Plan

**Pre-production planning — June 2026**

*Unity desktop idle gacha turn-based hero collector RPG*

<div class="legend">

**Reading guide.** Yellow highlighted blocks (<mark>like this</mark>) mark every change, addition, or clarification vs. the source PDF.

For a one-page index of every change, see the Changelog section.

</div>

</div>

EOF

for f in CHANGELOG-from-source-PDF.md project-i-master-plan.md; do
  echo "" >> "$COMBINED"; echo "" >> "$COMBINED"; cat "$f" >> "$COMBINED"
done

for f in gdd/*.md; do
  echo "" >> "$COMBINED"; echo "" >> "$COMBINED"; cat "$f" >> "$COMBINED"
done

echo "" >> "$COMBINED"; echo "" >> "$COMBINED"; echo "# Hero Sheets" >> "$COMBINED"; echo "" >> "$COMBINED"
cat heroes/README.md >> "$COMBINED"

for h in heroes/valdrik.md heroes/emberia.md heroes/kaida.md \
         heroes/glacier.md heroes/marina.md heroes/neria.md \
         heroes/lyria.md heroes/sylphie.md heroes/kael.md \
         heroes/auron.md \
         heroes/ragnar.md heroes/akari.md heroes/seraphina.md heroes/mei-lin.md heroes/ayame.md \
         heroes/4-stars-TBD.md; do
  echo "" >> "$COMBINED"; echo "" >> "$COMBINED"; cat "$h" >> "$COMBINED"
done

# Production & business + Unity setup
echo "" >> "$COMBINED"; echo "" >> "$COMBINED"
cat production-and-business.md >> "$COMBINED"

echo "" >> "$COMBINED"; echo "" >> "$COMBINED"
cat unity-setup-guide.md >> "$COMBINED"

echo "" >> "$COMBINED"; echo "" >> "$COMBINED"
cat BACKLOG.md >> "$COMBINED"

pandoc "$COMBINED" \
  --pdf-engine=weasyprint \
  --css="REPLACE_WITH_REPO_ROOT/design/.render-style.css" \
  --metadata title="Project I — Master Design Plan" \
  -o "REPLACE_WITH_REPO_ROOT/design/Project-I-Master-Plan.pdf"

echo "Combined MD lines: $(wc -l < $COMBINED)"
echo "Highlights: $(grep -c '<mark>' $COMBINED)"
echo "PDF: $(ls -lh 'REPLACE_WITH_REPO_ROOT/design/Project-I-Master-Plan.pdf' | awk '{print $5}')"
echo "Pages: $(pdfinfo 'REPLACE_WITH_REPO_ROOT/design/Project-I-Master-Plan.pdf' | grep Pages)"
