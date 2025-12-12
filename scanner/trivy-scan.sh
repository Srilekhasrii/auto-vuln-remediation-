#!/bin/bash
IMAGE="$1"

echo "🔍 Scanning image: $IMAGE"

trivy image --severity HIGH,CRITICAL --format json -o scan-report.json $IMAGE

if [ $? -ne 0 ]; then
  echo "❌ Trivy scan failed"
  exit 1
fi

CRITICAL=$(jq '.Results[].Vulnerabilities[] | select(.Severity=="CRITICAL") | .Severity' scan-report.json | wc -l)
HIGH=$(jq '.Results[].Vulnerabilities[] | select(.Severity=="HIGH") | .Severity' scan-report.json | wc -l)

echo "Critical: $CRITICAL | High: $HIGH"

if [ "$CRITICAL" -gt 0 ] || [ "$HIGH" -gt 0 ]; then
  echo "❗ Vulnerabilities found. Needs rebuild."
  exit 2
else
  echo "✔ Image is secure."
fi

