#!/bin/bash

PASSWORD_PATH=/config/custom/pass.pwd
ACCOUNTS_PATH=/config/custom/keys/Trustlines/

print_banner() {
    echo "#####################################################################################################"
    echo "## Trustlines not configured to start!                                                             ##"
    echo "#####################################################################################################"
}

## If the password is set we save it
if [ -n "${PASSWORD}" ]; then
    echo ${PASSWORD} > ${PASSWORD_PATH}
fi

if  [ "${ROLE}" != "" ] &&  [ "${ROLE}" != "observer" ] && [ "${ROLE}" != "participant" ] && [ "${ROLE}" != "validator" ];then
    print_banner
    echo "## You've selected an invalid role: ${ROLE}"
    echo "## The valid roles are: observer, participant and validator"
    echo "##"
    echo "## observer"
    echo "##     - Is the default role"
    echo "##     - Does only watch for propagated blocks."
    echo "##     - Non arguments required at all."
    echo "##"
    echo "## participant"
    echo "##     - Connects to an account to being able to create transactions."
    echo "##     - Requires the address argument."
    echo "##     - Needs the password file and the key-set."
    echo "##"
    echo "## validator"
    echo "##     - Connect as authority to the network for validating blocks."
    echo "##     - Requires the address argument."
    echo "##     - Needs the password file and the key-set."
    echo "#####################################################################################################"
    while true; do sleep 5; done

fi

# Obeserver is used in case it is set or is empty since it is the default role
# it doesn't need a password or an address
if [ ! -n "${ROLE}" ] || [ "${ROLE}" = "observer" ]; then
    /home/parity/parity_wrapper.sh --parity-args $PARITY_ARGS
elif [ ! -f "${PASSWORD_PATH}" ] || [ ! -n "${ADDRESS}" ];then
    print_banner
    echo "# You need to configure a password and an address to be able to start trustlines as a ${ROLE} "
    echo "#####################################################################################################"
    while true; do sleep 5; done
elif [ ! "$(find "$ACCOUNTS_PATH" -mindepth 1 -not -name "address_book.json" -print -quit 2>/dev/null)" ]; then
    print_banner
    echo "##"
    echo "# You must upload your keystore file to: ${ACCOUNTS_PATH}"
    echo "#####################################################################################################"
    while true; do sleep 5; done
else
    /home/parity/parity_wrapper.sh --role $ROLE --address $ADDRESS --parity-args $PARITY_ARGS
fi