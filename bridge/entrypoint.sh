#!/bin/sh 

ACCOUNT_FILE=/config/keys/tlbc/account.json
if [ ! -f "$ACCOUNT_FILE" ]; then
    echo "#####################################################################################################"
    echo "## Not account found, exiting                                                                      ##"
    echo "#####################################################################################################"
    exit 0;
fi

exec /opt/bridge/bin/tlbc-bridge -c /bridge-config.toml