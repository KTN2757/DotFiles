#!/usr/bin/env bash

if [ -f "${HOME}/.cache/wal/colors.sh" ]; then
    source "${HOME}/.cache/wal/colors.sh"
else
    source "$(dirname "$0")/night.sh"
    return
fi

declare -A PALLETE=(
  [none]="NONE"

  [bg]="${color0}"
  [bg_dark]="${color0}"
  [bg_highlight]="${color1}"
  [terminal_black]="${color0}"

  [fg]="${color15}"
  [fg_dark]="${color7}"
  [fg_gutter]="#ffffff"

  [comment]="${color8}"
  [dark3]="${color8}"
  [dark5]="${color7}"

  [blue0]="${color4}"
  [blue]="${color12}"
  [blue1]="${color12}"
  [blue2]="${color14}"
  [blue5]="${color14}"
  [blue6]="${color4}"
  [blue7]="${color4}"

  [cyan]="${color6}"
  [teal]="${color6}"

  [magenta]="${color13}"
  [magenta2]="${color5}"
  [purple]="${color13}"
  [orange]="${color11}"
  [yellow]="${color3}"

  [green]="${color10}"
  [green1]="${color14}"
  [green2]="${color2}"

  [red]="${color9}"
  [red1]="${color1}"

  [white]="#ffffff"
)

export PALLETE

