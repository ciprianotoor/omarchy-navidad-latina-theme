#!/usr/bin/env bash
set -euo pipefail

theme_dir="$HOME/.config/omarchy/themes/navidad-latina"

if [[ ! -x "$theme_dir/border-lights.sh" ]]; then
  printf 'No encuentro el tema en %s. Instala primero el tema con omarchy theme install.\n' "$theme_dir" >&2
  exit 1
fi

omarchy hook install theme-set "$theme_dir/theme-set-hook.sh"
omarchy hook install post-boot "$theme_dir/post-boot-hook.sh"
omarchy hook theme-set navidad-latina
