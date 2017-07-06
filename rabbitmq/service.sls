# vim: ft=sls
{% from "rabbitmq/map.jinja" import rabbitmq with context %}

rabbitmq_service:
 service.{{ rabbitmq.service.state }}:
   - name: {{ rabbitmq.service.name }}
   - enable: {{ rabbitmq.service.enable }}
