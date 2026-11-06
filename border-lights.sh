#!/usr/bin/env bash
set -euo pipefail

colors=(E63946 3A86FF FFFFFF)
index=0

while true; do
  next=$(((index + 1) % ${#colors[@]}))
  next_next=$(((index + 2) % ${#colors[@]}))
  next_next_next=$(((index + 3) % ${#colors[@]}))
  hyprctl eval "hl.config({ general = { col = { active_border = { colors = { \"rgba(${colors[index]}ff)\", \"rgba(${colors[next]}ff)\", \"rgba(${colors[next_next]}ff)\", \"rgba(${colors[next_next_next]}ff)\" }, angle = 45 } } } })" >/dev/null
  index=$next
  sleep 0.8
done
