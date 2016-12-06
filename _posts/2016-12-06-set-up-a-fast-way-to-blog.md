---
layout: post
title: Set up a fast way to Blog
subtitle: Blog like a dev, blazing fast, from the terminal.
category: Dev
tags: [terminal, git, blog]
---


## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}


## tldr;
So, this is what I just did to publish this post.

- Opened terminal
- Typed `blog set-up-a-fast-way-to-blog`
- Wrote. Saved. Got back to work.

------

## Preface

So a couple of days ago, I moved from WordPress to a _Jekyll_ based blog. I migrated none but 2 posts. 

So my workflow would be like this when I had an idea that I wanted to write a post about:

- Open the git directory on my local machine
- Create a new file with data + title of the post
- After writing up, do the usual git add/commit/push routine.

But this process hindered my creative juices and I wondered if i could "automate" this process.

------

## Setting up the bash script

So the script should be able to handle the following things on its own:

- Open my editor with a blank file named with Jekyll format : `yyyy-mm-dd-blog-title`
- Automatically add the YAML front matter required including the categories and tags part
- Automatically do the git routine whence I'm done with the post.
- Error handling
- Wish me a good day :wink:
- Extra: Open blog posts folder.

So, here is my final script.

```shell
#!/bin/bash

# Variables that may change with time
location=/d/Documents/Code/git/blog/
editor=subl
goodbyemessage="Have a good day!"


#Checking iff 1 argument is supplied
if [ "$#" -ne 1 ]; then
  echo "usage: blog [post-title] / [personal] / [open] / [git]"



# Case 1: Open my blog directory
elif [ "$1" == 'open' ]; then
  cd $location   
  $editor $location
  #clear
  echo "Don't forget to git it!"
  echo $goodbyemessage


# Case 2: Open personal post file
elif [ "$1" == 'personal' ]; then
  $editor $location/personal.md --wait
  post="personal"
  git=1


# Case 3: Git
elif [ "$1" == 'git' ]; then
  git=1


# Case 4: Open file named in Jekyll format : date+title
else 
  yamlfront="---
layout: post
title: 
subtitle: 
category: 
tags: []
---"
  echo "$yamlfront" > $location/_posts/$(date +"%Y-%m-%d")-$1.md
  $editor $location/_posts/$(date +"%Y-%m-%d")-$1.md --wait
  post="$(date +"%Y-%m-%d")-$1"
  git=1
fi



# If git is required, then push to remote repository with appropriate commit message
if [ "$git" == 1 ]; then
  cd $location
  if git pull; then
    git add .
    git commit -am "updated $post"
    if git push; then
      clear
      echo $goodbyemessage
    fi
  fi
fi  
```

**Now, save this script as `~/bin/blog.sh`**

## Add script to path and set up alias

And, to be able to run this script from anywhere in the terminal, let's add `~/bin` to our `PATH`

1. Open bash_profile with vim editor. <br>

```
    vim ~/.bash_profile
```

2. Press `i`, paste the following, press `Escape`, then `:wq` and press `Enter` to get out of it. <br>

```
    PATH=$PATH:$HOME/bin
```

In order to be able to type blog instead of blog.sh, we'll add an `alias` in bash_profile.  

3. Open the bash_profile again like in the code snippet `1` above.  

4. Then add this, save & restart terminal for it to load the new profile.

```shell
alias blog='blog.sh'
```

**And, you're good to go. Now I should get back to work ! :open_mouth:**





------

## Edits

- 2016-12-06
  - Auto add YAML front matter when creating a new blog post
- 2016-07-07
  - Original post