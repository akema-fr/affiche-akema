#!/usr/bin/env bash

commonArgs=( --export-area-page --without-gui )

function exportPng() {
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-height=1488 --export-width=2105 --export-png=affiche.A3.png
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-height=744 --export-width=1052 --export-png=affiche.A4.png
  inkscape "${commonArgs[@]}" --file=affiche.A5.svg --export-height=372 --export-width=526 --export-png=affiche.A5.png
}

function exportPdf() {
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-pdf=affiche.pdf
  inkscape "${commonArgs[@]}" --file=affiche.A5.svg --export-pdf=.affiche.A5.pdf
}

resizePageTo() {
  local paper_size="$1"
  local input="$2"
  local output="$3"

  gs \
     -o $output \
     -sDEVICE=pdfwrite \
     -sPAPERSIZE="$paper_size" \
     -dFIXEDMEDIA \
     -dPDFFitPage \
     -dCompatibilityLevel=1.4 \
      $input
}

exportPdf
resizePageTo a5 .affiche.A5.pdf affiche.a5.pdf
rm .affiche.A5.pdf
exportPng
