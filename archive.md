---
layout: page
title: Archive
subtitle: History of all the posts
---


<section id="archive">
  <h3>This year's posts</h3>
  <table>
  {%for post in site.posts %}
    {% unless post.next %}
    {% else %}
      {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
        <h3>{{ post.date | date: '%Y' }}</h3>
      {% endif %}
    {% endunless %}
        <tr>
          <th>Post Date</th>
          <th>Post Title</th>
        </tr>
        <tr>
          <td><time>{{ post.date | date:"%d %b" }}</time></td>
          <td><a href="{{ post.url }}">{{ post.title }}</a></td>
        </tr>
      
  {% endfor %}
  </table>
</section>

