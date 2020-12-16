---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---
## Preprints

{% include base_path %}

{% for post in site.preprints reversed %}
  {% include archive-single-preprints.html %}
{% endfor %}



## Journal Articles

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

