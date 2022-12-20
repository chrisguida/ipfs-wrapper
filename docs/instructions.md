# InterPlanetary File System (IPFS)

A peer-to-peer hypermedia protocol designed to preserve and grow humanity's
knowledge by making the web upgradeable, resilient, and more open.

## Initial Setup

It is **highly recommended** to use IPFS over LAN, especially when dealing with
large files or file sets. It will work fine over tor for basic use and
management. To use over tor, substitute your onion addresses for LAN addresses
in the steps below.

For setup, you need to access your node via LAN (`.local` address). If you have
not already,
[please set up LAN access](https://start9.com/latest/user-manual/connecting/connecting-lan/)
for your client device and browser.

1. After install, click "Configure," and then click "Save," as this service has
   no needed configurations at this time.
2. Click "Start" to launch your node. After the Health Check shows the UI is
   available (in green), use the following direction to setup the browser
   extension.

## IPFS Companion Browser Extension

The easiest way to interact with your IPFS node while you are on the web is via
the [IPFS Companion](https://docs.ipfs.io/install/ipfs-companion/) browser
extension.

1. Install the Companion to your browser using the link above and selecting your
   browser (Firefox or Chrome-based). You can click through any pop-up warnings.
2. Once installed, click on the extension's icon in your browser toolbar. It
   will look like a gray cube. Then click the gear icon to enter the Settings.

<!-- MD_PACKER_INLINE BEGIN -->

![IPFS Companion Settings](./assets/img/ipfs-companion0.png)

<!-- MD_PACKER_INLINE END -->

3. Under API > edit the IPFS API URL to be your API LAN address. You can find this value in your Embassy IPFS Service inside the "Interfaces" page. **Note**: no port is needed.
4. Under Gateways > edit *both* Default Public Gateway *and* Local Gateway to be your Gateway LAN. This address is also inside the "Interfaces" page.
5. Uncheck the option for "Use Local Gateway".

<!-- MD_PACKER_INLINE BEGIN -->

![Companion Setup](./assets/img/ipfs-setup0.png)

<!-- MD_PACKER_INLINE END -->

6. Go back to the Companion Extension and click "My Node".

<!-- MD_PACKER_INLINE BEGIN -->

![My Node](./assets/img/ipfs-companion1.png)

<!-- MD_PACKER_INLINE END -->

7. Click "Settings" on the bottom of the left-hand menu.

8. Similar to above, copy-paste in the API and Gateway LAN addresses from your
  Embassy's IPFS Service Interfaces page into the appropriate fields.

<!-- MD_PACKER_INLINE BEGIN -->

![Node Settings](./assets/img/ipfs-setup1.png)

<!-- MD_PACKER_INLINE END -->

9. That's it! You will notice that your browser extension has turned teal in
   color, and is displaying a number of connected peers. Click "Status" at the
   top of the left-hand menu for details on your node.

## Basic Use

### Add and Pin a File

1. Click "Files" in the left-hand menu, and then "+Import" in the top-right of
   the Files tab.

<!-- MD_PACKER_INLINE BEGIN -->

![Files](./assets/img/ipfs-pin0.png)

<!-- MD_PACKER_INLINE END -->

2. In this example, we'll just add a single file, so click "File," then select a
   file from your local device.

<!-- MD_PACKER_INLINE BEGIN -->

![Import File](./assets/img/ipfs-pin1.png)

<!-- MD_PACKER_INLINE END -->

3. Your file will be added, giving it a CID (Content Identifier). This is now
   hash-addressed content, suitable for use on IPFS.

4. Next we want to actually host the file on the network, so we will "pin" it,
   by clicking the kebab menu to the right of the file. Click "Set pinning."

<!-- MD_PACKER_INLINE BEGIN -->

![Set Pinning](./assets/img/ipfs-pin2.png)

<!-- MD_PACKER_INLINE END -->

5. Check the box to pin to your "Local node" (your Embassy IPFS node), and
   you're done. Others can now access your file by its CID.

<!-- MD_PACKER_INLINE BEGIN -->

![Pin File](./assets/img/ipfs-pin3.png)

<!-- MD_PACKER_INLINE END -->

### Search for Data by CID

1. Paste a CID into the search box at the top of your node's WebUI.

<!-- MD_PACKER_INLINE BEGIN -->

![Search](./assets/img/ipfs-search0.png)

<!-- MD_PACKER_INLINE END -->

2. If not previewed, click "public gateway". Don't worry, because of our initial settings, the "public gateway" in this case is actually your Embassy.

<!-- MD_PACKER_INLINE BEGIN -->

![Search](./assets/img/ipfs-search1.png)

<!-- MD_PACKER_INLINE END -->

### Add a Peer

In certain cases, you may want to manually add a peer, like another Embassy user!

1. Click "Peers" in the left-hand menu.

<!-- MD_PACKER_INLINE BEGIN -->

![Add Connection](./assets/img/ipfs-add-peer0.png)

<!-- MD_PACKER_INLINE END -->

2. Click "Add Connection" in the top left

<!-- MD_PACKER_INLINE BEGIN -->

![Bootstrap Address](./assets/img/ipfs-add-peer1.png)

<!-- MD_PACKER_INLINE END -->

3. In the resulting window, you can add your Peer if you have its full location,
   or if you only have the peer id, copy paste a bootstrap node address and
   delete the peer id from the end (everything after `/p2p/`).

<!-- MD_PACKER_INLINE BEGIN -->

![Adding a Peer via Bootstrap](./assets/img/ipfs-add-peer2.png)

<!-- MD_PACKER_INLINE END -->

4. Finally, paste in the Peer ID and hit "Add"

<!-- MD_PACKER_INLINE BEGIN -->

![Add Peer ID](./assets/img/ipfs-add-peer3.png)

<!-- MD_PACKER_INLINE END -->

5. You will get a success message at the very bottom of the page as shown above.
