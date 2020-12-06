#!/bin/bash

if [ "${NETSTATS_ENABLE}" == "no" ]; then
    echo "#####################################################################################################"
    echo "## The use of netstat is disabled                                                                  ##"
    echo "#####################################################################################################"
    exit 0;
fi

if [ "${SHOW_VALIDATOR_STATUS}" == "yes" ];then
    HIDE_VALIDATOR_STATUS=false /src/start.sh
else
    HIDE_VALIDATOR_STATUS=true /src/start.sh
fi


