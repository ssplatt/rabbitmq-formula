# vim: ft=sls
{% from "rabbitmq/map.jinja" import rabbitmq with context %}

rabbitmq_service:
 service.{{ rabbitmq.service.state }}:
   - name: {{ rabbitmq.service.name }}
   - enable: {{ rabbitmq.service.enable }}
   - watch:
     - file: rabbitmq_etc_default_config
     - file: rabbitmq_etc_rabbitmq_config
