---
layout: post
title: Tunnel VPN traffic through SSH
subtitle: Playing with the network vulnerabilities - Part 2
category: Dev
tags: [college, wifi]
---

### Complete setup to access VPN running on a phone, on your laptop sans usb tethering.

---

Downloads:

- Opera VPN, or any other VPN app for that matter.

- SimpleSSHD, available on the Play Store. 

- **Putty** and **Puttygen**, available [here](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) in the *Alternative Binary Files* section.

  ​

1.   Phone setup

     1. Install SimpleSSHD.
     2. SimpleSSHD Settings -> Port number -> 2222
     3. Store the public key (generated in `2.1`) as `authorized_keys` (*no extension*) in `/sdcard/ssh/` through Bluetooth or USB file transfer.
        1. If (Permission problem), run `chmod mode 600 authorized_keys`.

2.   Laptop setup

     1. Run puttygen and generate public/private key pair.
     2. Save private key (`whatever-name.ppk`) somewhere.
     3. Install putty
     4. Putty settings
          1. Host name - phone's IP (`10.6.*. *`, check in SimpleSSHD)
          2. Port - `2222`
          3. SSH -> Auth -> point to location of the private key saved in `2.2`
          4. SSH -> Tunnel 
               1. Enter`2222` in Destination Port
               2. Check Dynamic checkbox. Add.
          5. Windows/Browser proxy settings (Search in start menu `configure proxy server`)
               1. Advanced Menu -> Socks Proxy -> `localhost : 2222
          6. Save the session in `Session` menu.

     *Profit.*

