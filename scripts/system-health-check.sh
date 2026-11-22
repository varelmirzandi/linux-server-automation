#!/usr/bin/env bash
set -euo pipefail

echo "=== Hostname & Uptime ==="
hostnamectl --static 2>/dev/null || hostname
uptime -p

echo "=== Memory & Disk Usage ==="
free -h
df -h /

echo "=== Failed Systemd Units ==="
systemctl --failed --no-legend || true
