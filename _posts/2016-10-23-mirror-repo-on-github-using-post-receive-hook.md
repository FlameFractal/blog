set up repo on server
set up repo on my machine [remote=server]

generate key pair on my machine.
add public key to server.

-----------------------------

set up repo on github
set up bare repo on server ~ [remote --mirror = github]

generate key pair on server.
add public key to github.

set up post-receive hook
	push to github quiet
	push to ~/public_html
	reset permissions of dierctories to 0755 and files to 0644

hook
```
	#!/usr/bin/env bash

git --work-tree=/home/vishg/public_html --git-dir=/home/vishg/.git checkout -f
git --work-tree=/home/vishg/public_html --git-dir=/home/vishg/.git push --quiet github &


chmod 0644 ~/public_html/index.php
chmod 0644 ~/public_html/Home/index.php

#cd ~/public_html
#find . -type d -exec chmod 755 {} \;
#find . -type d -exec chmod 644 {} \;
```