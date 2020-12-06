#!/bin/bash

PASSWORD_PATH=/config/custom/pass.pwd
ACCOUNTS_PATH=/config/custom/keys/tlbc/

print_banner() {
    echo "#####################################################################################################"
    echo "## Trustlines not configured to start!                                                             ##"
    echo "#####################################################################################################"
}

## If the password is set we save it
if [ -n "${PASSWORD}" ]; then
    echo ${PASSWORD} > ${PASSWORD_PATH}
fi

if [ "$ROLE" == "validator" ]; then
    if [ ! -f "${PASSWORD_PATH}" ] || [ ! -n "${ADDRESS}" ];then
        print_banner
        echo "# You need to configure a password and an address to be able to start trustlines"
        echo "#####################################################################################################"
        while true; do sleep 5; done
    elif [ ! "$(find "$ACCOUNTS_PATH" -mindepth 1 -not -name "address_book.json" -print -quit 2>/dev/null)" ]; then
        print_banner
        echo "# You must upload your keystore file to: ${ACCOUNTS_PATH}"
        echo "#####################################################################################################"
        while true; do sleep 5; done
    else
        /home/parity/parity_wrapper.sh --role $ROLE --address $ADDRESS --parity-args $PARITY_ARGS
    fi
else
    /home/parity/parity_wrapper.sh --role $ROLE --parity-args $PARITY_ARGS
fi