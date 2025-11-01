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
  [bg_highlight]="${color8}"
  [terminal_black]="${color8}"
  [fg]="${color15}"
  [fg_dark]="${color7}"
  [fg_gutter]="${color8}"
  [dark3]="${color8}"
  [comment]="${color8}"
  [dark5]="${color7}"
  [blue0]="${color0}"
  [blue]="${color4}"
  [cyan]="${color6}"
  [blue1]="${color12}"
  [blue2]="${color12}"
  [blue5]="${color14}"
  [blue6]="${color14}"
  [blue7]="${color0}"
  [magenta]="${color13}"
  [magenta2]="${color5}"
  [purple]="${color13}"
  [orange]="${color11}"
  [yellow]="${color11}"
  [green]="${color10}"
  [green1]="${color14}"
  [green2]="${color10}"
  [teal]="${color6}"
  [red]="${color9}"
  [red1]="${color1}"
  [white]="${color15}"
)

export PALLETE
