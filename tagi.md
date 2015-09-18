---
layout: page
title: Tagi
group: sitemap
---
{% include JB/setup %}

<ul class="tag_box inline">
  {% assign tags_list = site.tags %}  
  {% include JB/tags_list %}
</ul>
<div class="clear"></div>

{% for tag in site.tags %} 
  <h2 id="{{ tag[0] }}-ref">{{ tag[0] | capitalize }}</h2>
  <ul>
    {% assign pages_list = tag[1] %}  
    {% include JB/pages_list %}
  </ul>
{% endfor %}
