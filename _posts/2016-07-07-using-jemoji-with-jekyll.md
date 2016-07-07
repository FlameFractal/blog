---
layout: post
title: Using Emojis with Jekyll
---


Jekyll supports Github flavoured Markdown. To enable emojis similar to the ones you can use anywhere on Github, you need to do few things.

+ Add `gem 'jemoji'` to your Gemfile
+ Add to _config.yml 
  ```
  gems:
  - jemoji
  ```

And now you can happily :smile: use your :emoji\_format: :heavy\_check_mark: in your website :grey\_exclamation:

But, I encountered another problem with this. The search feature stopped working. It turns out that the colon(:) of the emoji was screwing up with the YAML format of the search.

```
"title": "{{ post.title | xml_escape }}",
"author": "{{ post.author | xml_escape }}",
"category": "{{ post.category | xml_escape }}",
"content": {{ post.content | strip\_html | strip_newlines | jsonify | **replace:':',' '**}},
"url": "{{ post.url | xml_escape }}"
```
This is where I extract all the searchable content from the posts and store it in JSON form.
In line 4, `"content": `, the colon (:) of the emoji was interfering with the format.
So I added another filter that would replace the colon (:) with a space `| replace:':',' '`.