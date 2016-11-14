---
layout: post
title: Tunnel VPN traffic through SSH
subtitle: Playing with the network vulnerabilities - Part 2
category: Dev
tags: [college, wifi]
---

### Complete setup to access the VPN running on phone, on your laptop, without usb tethering.
---

1. Phone

		1. Opera VPN
		2. SimpleSSHD 
				- store public key as authorized_keys in /sdcard/ssh/ 
				- chmod mode 600.
				- port 2222

2. Laptop

			1. putty
				1. remote host set up IP of phone (see in simplesshd) - 10.6.*. *
				2. ssh auth -> private key stored as ppk in any folder
				3. ssh tunnel -> dynamic port add 2222

			2. windows/browser proxy settings
				1. advanced menu socks proxy
				2. localhost : 2222


Done.