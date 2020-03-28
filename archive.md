---
layout: page
title: Archive
subtitle: History of all the posts
---

<style type="text/css">
  #archive{
    text-align: center !important;
  }
  table{
    table-layout: fixed;
    width: 100%;
  }
  td, th{
    text-align: center !important;
  }
</style>

<section id="archive">
  
  {% comment %}
  <h3>This year's posts</h3>
  {% endcomment %}
  
  <table class="table">
    <tr>
      <th>Post Date</th>
      <th>Post Title</th>
    </tr>
    {%for post in site.posts %}
    {% unless post.next %}
    {% else %}
    {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
    {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
    {% if year != nyear %}
    
    {% comment %}
    <h3>{{ post.date | date: '%Y' }}</h3>
    <h2>{{ nyear }} </h2>
    {% endcomment %}
    
    {% endif %}
    {% endunless %}
    <tr>
      <td><time>{{ post.date | date:"%d %b, %Y" }}</time></td>
      <td><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></td>
    </tr>

    {% endfor %}
  </table>
</section>




