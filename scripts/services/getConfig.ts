import { types as T, compat } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "tor-address": {
    "name": "Tor Address",
    "description": "The Tor address for the web ui.",
    "type": "pointer",
    "subtype": "package",
    "package-id": "ipfs",
    "target": "tor-address",
    "interface": "main"
  },
  // "local-mode": {
  //   "name": "Local Mode",
  //   "description": "Toggle this on to change UI links and the SSH domain to the .local domain. Toggle it off to switch back to .onion. This option is convenient if you are using Gitea locally and don't care about remote access.",
  //   "type": "boolean",
  //   "default": false,
  // },
  // "disable-registration": {
  //   "name": "Disable Registration",
  //   "description": "Prevent new users from signing themselves up. Once registrations are disabled, only an admin can sign up new users. It is recommended that you activate this option after creating your first user, since anyone with your Gitea URL can sign up and create an account, which represents a security risk.",
  //   "type": "boolean",
  //   "default": false,
  // },
})
