---
layout: page
title : Rakstu arhīvs
group: sitemap
---
{% include JB/setup %}

<ul>
{% for post in site.posts %}
  <li>
    <span>{{ post.date | date: "%B %e, %Y" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
  </li>
{% endfor %}
</ul>
