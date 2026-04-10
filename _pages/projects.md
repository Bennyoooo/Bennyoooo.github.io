---
layout: page
title: projects
permalink: /_projects/
description:
nav: true
display_categories: [work]
---

<!-- pages/projects.md -->
<div class="projects">
{%- assign sorted_projects = site.projects | sort: "importance" -%}
<ul class="project-list">
  {%- for project in sorted_projects -%}
    {% include projects_list.html %}
  {%- endfor %}
</ul>
</div>
