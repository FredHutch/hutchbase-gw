
node.default['hutchbase-gw']['server_name'] = node['fqdn']
node.default['hutchbase-gw']['logdir'] = '/var/log/hutchbase'
node.default['hutchbase-gw']['url'] = 'http://localhost'
node.default['hutchbase-gw']['port'] = '8080'
node.default['hutchbase-gw']['ssl_cert'] = 'ssl.cert'
node.default['hutchbase-gw']['ssl_cert_key'] = 'ssl.cert.key'
