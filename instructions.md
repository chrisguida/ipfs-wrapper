# InterPlanetary File System (IPFS)

A peer-to-peer hypermedia protocol designed to preserve and grow humanity's
knowledge by making the web upgradeable, resilient, and more open.

## Initial Setup

For setup, you need to access your node via LAN (`.local` address). If you have
not already,
[please set up LAN access](https://start9.com/latest/user-manual/connecting/connecting-lan/lan-os/index)
for your client device and
[browser](https://start9.com/latest/user-manual/connecting/connecting-lan/lan-browser/index).

1. After install, click "Configure," and then click "Save," as this service has
   no needed configurations at this time.
1. Click "Start" to launch your node. After the Health Check shows the UI is
   available (in green), use the following direction to setup the browser
   extension.

## IPFS Companion Browser Extension

The easiest way to interact with your IPFS node while you are on the web is via
the [IPFS Companion](https://docs.ipfs.io/install/ipfs-companion/) browser
extenion.

1. Install the Companion to your browser using the link above and selecting your
   browser (Firefox or Chrome-based). You can click through any pop-up warnings.
1. Once installed, click on the extension's icon in your browser toolbar. It
   will look like a gray cube. Then click the gear icon to enter the Settings.
   - On the resulting page, scroll to the second section, and under API > IPFS
     API URL, add your WebUI LAN address from your Embassy UI's IPFS service
     page > Interfaces > WebUI (copy icon). You will replace everything on that
     line and your address will begin with `https://`. No port is needed
   - Under Gateways > Default Public Gateway, you will add your IPFS Gateway LAN
     address from the "Interfaces" section of your IPFS service page.
   - Finally, uncheck the option for "Use Local Gateway."
1. That's it! You will notice that your browser extension has turned teal in
   color, and display a number of connected peers. Click on it for details.
   - Click on "My Node" to enter your IPFS node's WebUI. You will see a screen
     similar to the one below:
