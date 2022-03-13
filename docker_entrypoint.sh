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

ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["https://jdj6eugechmeawczxltlqacywb74lk2zprjacl4aysxj4o7apepwwmyd.local", "http://localhost:3000", "http://127.0.0.1:5001", "https://webui.ipfs.io"]'
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "POST"]'

exec /sbin/tini -- /usr/local/bin/start_ipfs daemon --migrate=true --agent-version-suffix=docker
