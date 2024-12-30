---
layout: archive
author_profile: true
title: Publications
---
{% assign years = (2015..2025) | reverse %}
{% for year in years %}
  {% capture refs %}{% bibliography --query @*[year={{year}}] %}{% endcapture %}
  {% assign trimmed_refs = refs | strip %}
  {% if trimmed_refs contains "archive__item" %}
<div class="year-section">
  <h2>{{ year }}</h2>
  <div class="bibliography grid__wrapper">
    {{ refs }}
  </div>
</div>
  {% endif %}
{% endfor %}