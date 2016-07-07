---
layout: post
title: Set up a fast way to Blog
subtitle: Blog like a dev, blazing fast, from the terminal.
category: Dev
tags: [terminal, git, blog]
---

## Preface

So a couple of days ago, I moved from wordpress to a Jekyll based blog. I didn't migrate all the data except a couple of posts. 

So my workflow would be like this when I had an idea that I wanted to write a post about:

+ Open the git directory on my local machine
+ Create a new file with data + title of the post
+ After writing up, do the usual git add/commit/push routine.

But this process hindered my creative juices and I wondered if i could automate this process. The idea was it should be as simple as 

1. open a blank file, write, & save.

No hassle, whatsoever.  
Let's get started.

---

## Setting up the bash script

The script should be able to handle the following:

+ Open my editor with a blank file named (today's date + blog title)
+ After I save the file, automatically do the git routine.
+ Error handling
+ Wish me a good day ;)

Also, one case where i might just quickly want to open my blog posts directory.

```shell
#!/bin/bash

# Variable that points to my blog directory
location=~/Desktop/git/flamefractal.github.io/

#Checking iff 1 argument is supplied
if [ "$#" -ne 1 ]; then
  echo "usage: blog [post-title]/[personal]/[open]"

# Case 1: Open my blog directory
elif [ "$1" == 'open' ]; then
  cd $location
  sublime $location
  clear
  echo "Don't forget to git it!"
  echo "Have a good day!"

# Case 2: Open file named in Jekyll format : date+title
else
  sublime $location/_posts/$(date +"%Y-%m-%d")-$1.md --wait
  post="$(date +"%Y-%m-%d")-$1"
  git=1
fi

# If git is required, then push to remote repository with appropriate commit message
if [ "$git" == 1 ]; then
  cd $location
  git add .
  git commit -am "updated $post"
  git push
  clear
  echo "Have a good day!"
fi  






```