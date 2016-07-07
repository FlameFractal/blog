---
layout: post
title: Set up a fast way to Blog
subtitle: Blog like a dev, blazing fast, from the terminal.
category: Dev
tags: [terminal, git, blog]
---

## tl;dr
So, this is what I just did to publish this post.

+ Opened terminal
+ Typed `blog set-up-a-fast-way-to-blog`
+ Wrote. Saved. Got back to work.

---

## Preface

So a couple of days ago, I moved from WordPress to a _Jekyll_ based blog. I migrated none but 2 posts. 

So my workflow would be like this when I had an idea that I wanted to write a post about:

+ Open the git directory on my local machine
+ Create a new file with data + title of the post
+ After writing up, do the usual git add/commit/push routine.

But this process hindered my creative juices and I wondered if i could "automate" this process.

---

## Setting up the bash script

The script should be able to handle the following:

+ Open my editor with a blank file named with Jekyll format : `yyyy-mm-dd-blog-title`
+ Automatically do the git routine whence I'm done with the post.
+ Error handling
+ Wish me a good day ;)

Also, one more case to just quickly open my blog posts folder. So, here is my final script.

```shell
#!/bin/bash

# Variable that may change with time
location=/path/to/blog's/git/directory
editor=sublime
goodbyemessage="Have a good day!"


#Checking iff 1 argument is supplied
if [ "$#" -ne 1 ]; then
  echo "usage: blog [post-title]/[open]"


# Case 1: Open my blog directory with Sublime
elif [ "$1" == 'open' ]; then
  cd $location
  $editor $location
  clear
  echo "Don't forget to git it!"
  echo $goodbyemessage


# Case 2: Open file named in Jekyll format
else
  $editor $location/_posts/$(date +"%Y-%m-%d")-$1.md --wait
  post="$(date +"%Y-%m-%d")-$1"
  git=1   <!-- Indicate that automatic git routine might be necessary -->
fi


# If git is required, then push to remote repository with appropriate commit message
if [ "$git" == 1 ]; then
  cd $location
  git add .
  git commit -am "updated $post"
  git push
  clear
  echo $goodbyemessage
fi  
```

**Now, save this script as `~/bin/blog.sh`**

**And, to be able to run this script from anywhere in the terminal, add `~/bin` to `PATH`**

1. Open bash_profile with vim editor. <br>
  ```shell
  vim ~/.bash_profile
  ```
2. Press `i`, paste the following, press `Escape`, then `:wq` and press `Enter` to get out of it. <br>
  ```shell
  PATH=$PATH:$HOME/bin
  ```

---

## Setting up the bash_profile

So, in order to be able to type blog instead of blog.sh, we'll add an `alias` in bash_profile.  

Open the bash_profile again like in the code snippet `1` above.  

Then add this, save & restart terminal for it to load the new profile.

```shell
alias blog='blog.sh'
```

### And, you're good to go. Now I should get back to work ! :no_mouth: