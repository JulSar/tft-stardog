#!/bin/bash
if [ ! -f /data/stardog/stardog-license-key.bin ]; then
  cp /opt/stardog/stardog-license-key.bin /data/stardog/stardog-license-key.bin
fi

echo "[INFO] Starting Stardog server"
/opt/stardog/bin/stardog-admin server start --disable-security
echo "[INFO] Creating database <test>"
/opt/stardog/bin/stardog-admin db create -n test
echo "[INFO] Restarting Stardog"
#/opt/stardog/bin/stardog-admin server stop
#/opt/stardog/bin/stardog-admin server start --foreground  --disable-security
echo "[INFO] Stardog running..."