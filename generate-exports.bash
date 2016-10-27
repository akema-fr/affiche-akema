#!/usr/bin/env bash

commonArgs=( --export-area-page --without-gui )

function exportPng() {
  mkdir -p png/
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-height=1488 --export-width=2105 --export-png=png/affiche.A3.png
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-height=744 --export-width=1052 --export-png=png/affiche.A4.png
  inkscape "${commonArgs[@]}" --file=affiche.A5.svg --export-height=372 --export-width=526 --export-png=png/affiche.A5.png
}

function exportPdf() {
  mkdir -p pdf/
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-pdf=pdf/affiche.pdf
  inkscape "${commonArgs[@]}" --file=affiche.A5.svg --export-pdf=pdf/.affiche.A5.pdf
}

function exportEps() {
  mkdir -p eps/
  inkscape "${commonArgs[@]}" --file=affiche.svg --export-eps=eps/affiche.eps
  inkscape "${commonArgs[@]}" --file=affiche.A5.svg --export-eps=eps/affiche.A5.eps
}

function resizePageTo() {
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
resizePageTo a5 pdf/.affiche.A5.pdf pdf/affiche.a5.pdf
rm pdf/.affiche.A5.pdf
exportEps
exportPng
