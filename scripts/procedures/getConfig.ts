import { types as T, compat } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "tor-address": {
    "name": "Tor Address",
    "description": "The Tor address for the IPFS WebUI",
    "type": "pointer",
    "subtype": "package",
    "package-id": "ipfs",
    "target": "tor-address",
    "interface": "main"
  },
  "gateway-tor-address": {
    "name": "Tor Address",
    "description": "The Tor address for the IPFS Gateway",
    "type": "pointer",
    "subtype": "package",
    "package-id": "ipfs",
    "target": "tor-address",
    "interface": "gateway"
  },
  "lan-address": {
    "name": "Tor Address",
    "description": "The LAN address for the IPFS WebUI",
    "type": "pointer",
    "subtype": "package",
    "package-id": "ipfs",
    "target": "lan-address",
    "interface": "main"
  },
  "gateway-lan-address": {
    "name": "Tor Address",
    "description": "The LAN address for the IPFS Gateway",
    "type": "pointer",
    "subtype": "package",
    "package-id": "ipfs",
    "target": "lan-address",
    "interface": "gateway"
  },
})
