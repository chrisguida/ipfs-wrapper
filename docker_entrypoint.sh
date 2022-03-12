#!/bin/sh

user=ipfs
repo="$IPFS_PATH"

if [ `id -u` -eq 0 ]; then
  echo "Changing user to $user"
  # ensure folder is writable
  su-exec "$user" test -w "$repo" || chown -R -- "$user" "$repo"
  # restart script with new privileges
  exec su-exec "$user" "$0" "$@"
fi

TOR_ADDRESS=$(yq e '.tor-address' /data/ipfs/start9/config.yaml)
LAN_ADDRESS=$(echo "$TOR_ADDRESS" | sed -r 's/(.+)\.onion/\1.local/g')
# GW_TOR_ADDRESS=$(yq e '.gateway-tor-address' /data/ipfs/start9/config.yaml)
# GW_LAN_ADDRESS=$(echo "$GW_TOR_ADDRESS" | sed -r 's/(.+)\.onion/\1.local/g')
LOCALHOST_ADDRESS=localhost:3000
LOCALHOST_ADDRESS_2=127.0.0.1:5001
WEBUI_HOSTED_ADDRESS=webui.ipfs.io
HTTP="http://"
HTTPS="https://"

ACAO="[\"$HTTP$TOR_ADDRESS\",\"$HTTPS$LAN_ADDRESS\",\"$HTTP$LOCALHOST_ADDRESS\",\"$HTTP$LOCALHOST_ADDRESS_2\",\"$HTTPS$WEBUI_HOSTED_ADDRESS\"]"
# PUBLIC_GATEWAYS="    {
#     \"$GW_TOR_ADDRESS\": {
#     \"Paths\": [\"/ipfs\", \"/ipns\"]
#     },
#     \"$GW_LAN_ADDRESS\": {
#     \"Paths\": [\"/ipfs\", \"/ipns\"]
#     },
#     { \"localhost\": null }
# }"

ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin "$ACAO"
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "POST"]'
# ipfs config --json Gateway.PublicGateways "$PUBLIC_GATEWAYS"
ipfs config --bool Experimental.Libp2pStreamMounting true
ipfs config --bool Swarm.RelayClient.Enabled true
ipfs config --bool Transports.Network.Relay true

exec /sbin/tini -- /usr/local/bin/start_ipfs daemon --migrate=true --agent-version-suffix=docker
