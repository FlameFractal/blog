---
layout: post
title: SSD Upgrade - Hackintosh
subtitle: Migrating OSX from HDD->SSD
category: 
tags: [hackintosh, ssd]
---

*EDIT*: Windows 10 Anniversary Edition (Aug '16) broke the clover installation on the ssd. Had to re-add "clover options to boot menu" using clover on external thumb drive.

It is the third day today. 

I've done the following so far to get my OSX from the internal hard disk (western digital blue hybrid 1tb) to my new solid state drive (samsung 850 evo 250gb):

- 1. Cloned OSX onto SSD (USB) from HDD (SATA)
  2. Re-installed Clover on SSD and copied EFI from hdd to ssd 
  3. SSD is bootable from SATA. (y)
  4. Problems in booting windows from HDD. 
  5. Fixed by auto-repair HDD (SATA).
  6. But this broke clover install on hdd.
  7. …
  8. ….
  9. Clone/Re-install/Chuck it. (Windows to SSD options that I have)
  10. (PLAN) Chuck it and see
      ​      after a month. Either clone or re-install then. But keep win10 on hdd
      ​      still in case. Forever.
      ​            (PLAN) Uninstall hackintosh from hdd. 
      ​            (PLAN) Uninstall microsoft efi from ssd. And remove delay in clover
      ​      boot.
      ​            (PLAN) Expand hdd storage.
  11. Backed up EFIs of both hdd and ssd in /Data/Documents/username/HACKINTOSH
  12. Reduced clover timeout to 0
  13. Expanded OSX partition on ssd to take full space
  14. (PLAN) Can I hotswap SSD and HDD in the SATA or will I have to fix boot everytime by wither running windows auto-repair with windows/hdd or clover bootable usb add options to bios with osx/ssd
  15. Deleted Recovery and OSX partitions from hdd.