---
layout: post
title: Mirror Repository on Github
subtitle: Better workflow to code/host a website than ftp
category: Dev
tags: [college, wifi]
---

After I push my code, it updates on my hosting server and then on Github.


---
Link laptop -> hosting server

- Set up repo on server
- Set up repo on my machine [set its remote=server]
- generate key pair on my machine.
- add public key to server.

---

Link hosting server -> github

- set up repo on github
- set up bare repo on server ~ [remote --mirror = github]
- generate key pair on server.
- add public key to github.
- set up post-receive hook
	- push to github quiet
	- push to ~/public_html
	- reset permissions of dierctories to 0755 and files to 0644

---

Hook code, save as `post-receive` in `.git/hooks/`

```bash

#!/usr/bin/env bash

git --work-tree=/home/vishg/public_html --git-dir=/home/vishg/.git checkout -f
git --work-tree=/home/vishg/public_html --git-dir=/home/vishg/.git push --quiet github &

# reset permissions for php files and folders, just in case
find ~/public_html -type f -name "*.php" -exec chmod 0644 {} \;
find ~/public_html -type d -exec chmod 755 {} \;

```