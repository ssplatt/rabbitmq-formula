# vim: ft=sls
{% from "rabbitmq/map.jinja" import rabbitmq with context %}

rabbitmq_etc_default_config:
  file.managed:
    - name: /etc/default/rabbitmq-server
    - source: salt://rabbitmq/files/default_rabbitmq-server.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default_config: {{ rabbitmq.default_config }}

rabbitmq_etc_rabbitmq_config:
  file.managed:
    - name: /etc/rabbitmq/rabbitmq.config
    - source: salt://rabbitmq/files/{{ rabbitmq.config.template }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - config: {{ rabbitmq.config }}
