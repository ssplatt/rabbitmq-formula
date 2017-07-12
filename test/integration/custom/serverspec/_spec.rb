require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package("rabbitmq-server") do
  it { should be_installed }
end

describe service("rabbitmq-server") do
  it { should be_running }
end

describe file("/etc/default/rabbitmq-server") do
  it { should be_file }
  it { should exist }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /^ulimit -S -n 1024/ }
end

describe file("/etc/rabbitmq/rabbitmq.config") do
  it { should be_file }
  it { should exist }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /\{tcp_listeners/ }
  its(:content) { should match /\{"0.0.0.0", 5672\}/ }
  its(:content) { should match /\{ssl_listeners/ }
  its(:content) { should match /\{"0.0.0.0", 5671\}/ }
  its(:content) { should match /\{num_ssl_acceptors, 10\},/ }
  its(:content) { should match /\{ssl_options, \[/ }
  its(:content) { should match /\{cacertfile,           "\/etc\/pki\/test_ca\/test_ca_ca_cert.crt"\},/ }
  its(:content) { should match /\{certfile,             "\/etc\/pki\/test_ca\/certs\/rabbitmq.crt"\},/ }
  its(:content) { should match /\{keyfile,              "\/etc\/pki\/test_ca\/certs\/rabbitmq.key"\},/ }
  its(:content) { should match /\{verify,               verify_peer\},/ }
  its(:content) { should match /\{fail_if_no_peer_cert, false\}/ }
  its(:content) { should match /\{auth_mechanisms, \[/ }
  its(:content) { should match /'PLAIN',/ }
  its(:content) { should match /'AMQPLAIN'/ }
  its(:content) { should match /\{password_hashing_module, rabbit_password_hashing_sha256\}/ }
end

describe port(5672) do
  it { should be_listening }
end

describe port(5671) do
  it { should be_listening }
end
