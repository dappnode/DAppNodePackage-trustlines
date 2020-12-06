FROM trustlines/bridge:release20955

COPY bridge-config.toml /bridge-config.toml

ENTRYPOINT [ "/opt/bridge/bin/tlbc-bridge", "-c", "/bridge-config.toml" ]