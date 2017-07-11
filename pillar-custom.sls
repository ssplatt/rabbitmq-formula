# vim: ft=yaml
# Custom Pillar Data for rabbitmq

rabbitmq:
  enabled: true
  service:
    enable: true
    state: running
  default_config:
    ulimit: 1024
  config:
    template: rabbitmq.config_basicssl.j2
    rabbit:
      tcp_listeners:
        '0.0.0.0': 5672
      ssl_listeners:
        '0.0.0.0': 5671
      num_ssl_acceptors: 10
      ssl_options:
        cacertfile: /etc/pki/test_ca/test_ca_ca_cert.crt
        certfile: /etc/pki/test_ca/certs/rabbitmq.crt
        keyfile: /etc/pki/test_ca/certs/rabbitmq.key
        verify: verify_peer
        fail_if_no_peer_cert: "false"
      auth_mechanisms:
        - PLAIN
        - AMQPLAIN
      ssl_cert_login_from: common_name
      password_hashing_module: rabbit_password_hashing_sha256
