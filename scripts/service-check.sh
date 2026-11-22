#!/usr/bin/env bash
set -euo pipefail

SERVICES=("ssh" "docker")

echo "=== Service Status Check ==="
for svc in "${SERVICES[@]}"; do
  if systemctl is-active --quiet "$svc" 2>/dev/null; then
    echo "[OK] $svc is active"
  else
    echo "[WARN] $svc is inactive or not installed"
  fi
done
