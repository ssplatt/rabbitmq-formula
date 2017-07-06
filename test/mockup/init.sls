mockup_rabbitmq_repo:
  pkgrepo.managed:
    - humanname: rabbitmq-repo
    - name: deb http://www.rabbitmq.com/debian/ testing main
    - file: /etc/apt/sources.list.d/rabbitmq.list
    - key_url: https://www.rabbitmq.com/rabbitmq-release-signing-key.asc

mockup_rabbitmq_pki_dir:
  file.directory:
    - name: /etc/pki
    - makedirs: True

mockup_rabbitmq_tls_config:
  file.managed:
    - name: /etc/salt/minion.d/ca.conf
    - contents:
      - "ca.cert_base_path: /etc/pki"

mockup_rabbitmq_ssl_create_ca:
  module.run:
    - name: tls.create_ca
    - ca_name: test_ca
    - days: 5
    - CN: MyTestCA
    - C: US
    - ST: MyState
    - L: MyCity
    - O: MyOrgUnit
    - emailAddress: test@example.com
    - unless: test -f /etc/pki/test_ca/test_ca_ca_cert.crt

mockup_rabbitmq_ssl_create_csr:
  module.run:
    - name: tls.create_csr
    - ca_name: test_ca
    - CN: rabbitmq
    - unless: test -f /etc/pki/test_ca/certs/rabbitmq.key

mockup_rabbitmq_ssl_sign_csr:
  module.run:
    - name: tls.create_ca_signed_cert
    - ca_name: test_ca
    - CN: rabbitmq
    - unless: test -f /etc/pki/test_ca/certs/rabbitmq.crt
