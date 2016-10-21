#!/usr/bin/env bash

commonArgs=( --export-area-page --without-gui --file=affiche.svg )

function exportPng() {
  inkscape "${commonArgs[@]}" --export-height=1488 --export-width=2105 --export-png=affiche.A3.png
  inkscape "${commonArgs[@]}" --export-height=744 --export-width=1052 --export-png=affiche.A4.png
  inkscape "${commonArgs[@]}" --export-height=372 --export-width=526 --export-png=affiche.A5.png
}

function exportPdf() {
  inkscape "${commonArgs[@]}" --export-pdf=affiche.pdf
}

exportPdf
exportPng
