# vim: ft=sls
{% from "rabbitmq/map.jinja" import rabbitmq with context %}

rabbitmq_pkg:
  pkg.installed:
    - name: {{ rabbitmq.pkg }}
