FROM trustlines/netstats-client:release51

ENV RPC_HOST=trustlines.dappnode
ENV RPC_PORT=8545 
ENV WS_HOST=netstats.tlbc.trustlines.foundation

ADD entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]