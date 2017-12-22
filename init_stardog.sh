#!/bin/bash
if [ ! -f ${STARDOG_HOME}/stardog-license-key.bin ]; then
  cp ${STARDOG_INSTALL_DIR}/stardog-license-key.bin ${STARDOG_HOME}/stardog-license-key.bin
fi

echo "[INFO] Starting Stardog server"
${STARDOG_INSTALL_DIR}/bin/stardog-admin server start
echo "[INFO] Creating database <test>"
${STARDOG_INSTALL_DIR}/bin/stardog-admin db create -n test
echo "[INFO] Restarting Stardog"
${STARDOG_INSTALL_DIR}/bin/stardog-admin server stop
${STARDOG_INSTALL_DIR}/bin/stardog-admin server start --foreground
echo "[INFO] Stardog running..."