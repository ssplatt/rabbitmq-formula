# vim: ft=sls
{% from "rabbitmq/map.jinja" import rabbitmq with context %}

{% if rabbitmq.enabled %}
include:
  - rabbitmq.install
  - rabbitmq.config
  - rabbitmq.service
{% else %}
'rabbitmq-formula disabled':
  test.succeed_without_changes
{% endif %}

