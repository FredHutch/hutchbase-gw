
node.default['hutchbase-gw']['server_name'] = node['fqdn']
node.default['hutchbase-gw']['logdir'] = '/var/log/hutchbase'
node.default['hutchbase-gw']['url'] = 'http://localhost'
node.default['hutchbase-gw']['port'] = '8080'
node.default['hutchbase-gw']['ssl_cert'] = 'ssl.cert'
node.default['hutchbase-gw']['ssl_cert_key'] = 'ssl.cert.key'
node.default['hutchbase-gw']['source'] = {
  'url' => 'http://octopus.fhcrc.org/misc/hutchbaseExternal.war',
  'checksum' => 'd35aaff5aceca47345c148ec7390de3f'\
                '1ff81b8fa27839165867788170bc2b7c'
}
