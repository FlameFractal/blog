---
layout: post
title: Squashing commits in git
subtitle: Are you guilty of bad commit messages and want to make things right? You've come to the right place!
category: Dev
tags: [git, github]
---
So you've been working on a branch, debugging and constantly pushing lots of commits. But with nasty unreadable commit messages like

> this might work

> try #2

> f*#k this

> oops, typo

_Right? **Right?!**_

But now it's time to push the commits to remote, or maybe you have pushed already. Do you really want everyone to see those nasty messages?

A way to clean up your commit history is to _**squash**_ multiple commits into one or lesser with a common, well explained, clean commit message.

+ **Do a git log and see how many (n) commits you wish to squash.**
+ **Rebase (interactive) would take you to vim, where you can choose to pick, drop or squash commits.**
+ **If you have already pushed to remote, then do a force push again.**		
+	```
		git log
		git rebase -i HEAD~n
		git push origin +mybranch
	```	

I like my code and commits how I like my vodka. Neat.