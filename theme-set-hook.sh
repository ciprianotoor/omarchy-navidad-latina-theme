#!/usr/bin/env bash
set -euo pipefail

theme_slug="${1:-}"
border_script="$HOME/.config/omarchy/themes/navidad-latina/border-lights.sh"
pid_file="$HOME/.cache/navidad-latina-border.pid"
log_file="$HOME/.cache/navidad-latina-border.log"

stop_border_lights() {
  if [[ -r "$pid_file" ]]; then
    read -r pid < "$pid_file" || true
    if [[ "${pid:-}" =~ ^[0-9]+$ ]] &&
      [[ -r "/proc/$pid/cmdline" ]] &&
      grep -aFq -- "$border_script" "/proc/$pid/cmdline"; then
      kill "$pid"
    fi
    rm -f "$pid_file"
  fi
}

if [[ "$theme_slug" != "navidad-latina" ]]; then
  stop_border_lights
  exit 0
fi

if [[ -r "$pid_file" ]]; then
  read -r pid < "$pid_file" || true
  if [[ "${pid:-}" =~ ^[0-9]+$ ]] &&
    [[ -r "/proc/$pid/cmdline" ]] &&
    grep -aFq -- "$border_script" "/proc/$pid/cmdline"; then
    exit 0
  fi
fi

mkdir -p "$HOME/.cache"
nohup "$border_script" >> "$log_file" 2>&1 &
printf '%s\n' "$!" > "$pid_file"
