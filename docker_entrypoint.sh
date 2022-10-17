#!/bin/sh

set -e

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
GW_TOR_ADDRESS=$(yq e '.gateway-tor-address' /data/ipfs/start9/config.yaml)
GW_LAN_ADDRESS=$(echo "$GW_TOR_ADDRESS" | sed -r 's/(.+)\.onion/\1.local/g')
LOCALHOST_ADDRESS=localhost:3000
LOCALHOST_ADDRESS_2=127.0.0.1:5001
WEBUI_HOSTED_ADDRESS=webui.ipfs.io
EMBASSY_ADDRESS=ipfs.embassy:5001
FILE_DOWNLOAD_ADDRESS=0.0.0.0:8080
HTTP="http://"
HTTPS="https://"

ACAO="[\"$HTTP$TOR_ADDRESS\",\"$HTTPS$LAN_ADDRESS\",\"$HTTP$LOCALHOST_ADDRESS\",\"$HTTP$LOCALHOST_ADDRESS_2\",\"$HTTPS$WEBUI_HOSTED_ADDRESS\",\"$HTTP$EMBASSY_ADDRESS\",\"$HTTP$GW_TOR_ADDRESS\",\"$HTTPS$GW_LAN_ADDRESS\",\"$HTTPS$FILE_DOWNLOAD_ADDRESS\"]"
PUBLIC_GATEWAYS="    {
    \"$GW_TOR_ADDRESS\": {
    \"Paths\": [\"/ipfs\", \"/ipns\"]
    },
    \"$GW_LAN_ADDRESS\": {
    \"Paths\": [\"/ipfs\", \"/ipns\"]
    },
    \"localhost\": null
}"

if ! [ -f /data/ipfs/config ]; then
  echo "Config not found, initizalizing..."
  ipfs init
fi
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin "$ACAO"
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "POST"]'
ipfs config --json Addresses.API '"/ip4/0.0.0.0/tcp/5001"'
# ipfs config --json Addresses.Gateway '"/dns4/ipfsgw.local/tcp/443/https"'
# ipfs config --json Addresses.Gateway '"/ip4/127.0.0.1/tcp/8080"'
ipfs config --json Addresses.Gateway '"/ip4/0.0.0.0/tcp/8080"'
# ipfs config --json Addresses.Gateway '["/ip4/172.18.0.1/tcp/8080", "/ip4/0.0.0.0/tcp/8080"]'
# ipfs config --json Addresses.Gateway '"/ip4/172.18.0.1/tcp/8080"'
# ipfs config --json Addresses.Gateway '["/dns4/ipfs.embassy/tcp/8080", "/ip4/0.0.0.0/tcp/8080"]'
ipfs config --json Gateway.PublicGateways "$PUBLIC_GATEWAYS"
# ipfs config --json Gateway.PublicGateways null
ipfs config --bool Experimental.Libp2pStreamMounting true
ipfs config --bool Swarm.RelayClient.Enabled true
ipfs config --bool Transports.Network.Relay true

exec /sbin/tini -- /usr/local/bin/start_ipfs daemon --migrate=true --agent-version-suffix=docker
