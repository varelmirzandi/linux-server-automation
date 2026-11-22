#!/usr/bin/env bash
set -euo pipefail

echo "=== LOCAL LAB HEALTHCHECK ($(date '+%Y-%m-%d %H:%M:%S %Z')) ==="

echo "[1/4] Systemd & Backend Process"
systemctl is-active --quiet nginx && echo "  - nginx.service : ACTIVE" || echo "  - nginx.service : INACTIVE"
pgrep -f "server.py" >/dev/null && echo "  - iot backend   : RUNNING (server.py)" || echo "  - iot backend   : NOT RUNNING"

echo "[2/4] HTTP/HTTPS Endpoints"
for url in "https://portfolio.local" "https://iot.local" "https://iot.local/api/telemetry"; do
  code=$(curl -s -o /dev/null -w "%{http_code}" "$url" || true)
  echo "  - $url -> HTTP $code"
done

echo "[3/4] TLS Certificate Expiry"
if [ -f /etc/nginx/ssl/local-lab.crt ]; then
  end_date=$(openssl x509 -enddate -noout -in /etc/nginx/ssl/local-lab.crt | cut -d= -f2)
  echo "  - Valid until   : $end_date"
else
  echo "  - Certificate   : NOT FOUND"
fi

echo "[4/4] System Load & Memory"
uptime -p
free -h | awk '/^Mem:/ {print "  - Memory        : " $3 " used / " $2 " total"}'
