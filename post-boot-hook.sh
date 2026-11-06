#!/usr/bin/env bash
set -euo pipefail

if [[ "$(omarchy theme current)" == "Navidad Latina" ]]; then
  omarchy hook theme-set navidad-latina
fi
