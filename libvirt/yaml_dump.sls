# -*- coding: utf-8 -*-
# vim: ft=sls
---
{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import libvirt_settings as map with context %}

{%- set output_file = '.../{0}-formula/.kitchen/yaml_dump/{1}-{2}-py{3}.yaml'.format(
  tplroot,
  grains.osfinger,
  grains.saltversion,
  grains.pythonversion[0],
) %}
{%- do salt.log.debug('Grains: {0}\n'.format(output_file) ~ grains.items()|sort|yaml(False)) %}
{%- do salt.log.debug('Map   : {0}\n'.format(output_file) ~ map|yaml(False)) %}
