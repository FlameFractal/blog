---
layout: post
title: Using Emojis with Jekyll
---


Jekyll supports Github flavoured Markdown. To enable emojis similar to the ones you can use anywhere on Github, you need to do few things.

+ Add to your Gemfile

        gem 'jemoji'
+ Add to your _config.yml

        gems:
          - jemoji  

And now you can happily :smile: use emojis in your website :exclamation:

But, I encountered another problem with this. 

The search feature stopped working. 

It turns out that the colon `:` of the `:emoji:` was screwing up with the YAML format of the search.

<pre>
{%raw%}
"title": "{{ post.title | xml_escape }}",
"author": "{{ post.author | xml_escape }}",
"category": "{{ post.category | xml_escape }}",
"content": {{ post.content | strip_html | strip_newlines | jsonify | <b> replace:':',' '</b> }},
"url": "{{ post.url | xml_escape }}"
{%endraw%}
</pre>

This is where I extract all the searchable content from the posts and store it in JSON form.

In line 4, `"content": `, the colon was interfering with the format.

So I added another Liquid filter that would replace the colon with a space as - `replace:':',' '`.