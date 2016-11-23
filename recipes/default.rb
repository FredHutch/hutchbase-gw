#
# Cookbook Name:: hutchbase-gw
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

# Deploy ssl certs from vault

include_recipe 'chef-vault::default'

ssl_cert = chef_vault_item('hutchbase-gw', 'tls')['cert']
ssl_cert_key = chef_vault_item('hutchbase-gw', 'tls')['key']

etcdir = '/etc/hutchbase-gw'
certfile = "#{etcdir}/#{node['hutchbase-gw']['ssl_cert']}"
keyfile = "#{etcdir}/#{node['hutchbase-gw']['ssl_cert_key']}"

directory node.default['hutchbase-gw']['logdir'] do
  owner 'root'
  group 'root'
  mode '0755'
end

directory etcdir do
  owner 'root'
  group 'root'
  mode '0755'
end

file certfile do
  content ssl_cert
  owner 'root'
  group 'root'
  mode '0644'
end

file keyfile do
  content ssl_cert_key
  owner 'root'
  group 'root'
  mode '0644'
end

include_recipe 'nginx'

nginx_site 'hutchbase-gw' do
  enable true
  template 'hutchbase.conf.erb'
  variables(
    'server_name' => node['hutchbase-gw']['server_name'],
    'ssl_cert' => certfile,
    'ssl_cert_key' => keyfile,
    'logdir' => node['hutchbase-gw']['logdir'],
    'uri' => "#{node['hutchbase-gw']['url']}:#{node['hutchbase-gw']['port']}"
  )
end

include_recipe 'java_se'

# Install tomcat
#
tomcat_install 'hutchbase-min' do
  version '8.0.37'
end

tomcat_service 'hutchbase-min' do
  action :start
end

remote_file '/opt/tomcat_hutchbase-min/webapps/hutchbaseExternal.war' do
  owner 'tomcat_hutchbase-min'
  group 'tomcat_hutchbase-min'
  mode '0644'
  source node['hutchbase-gw']['source']['url']
  checksum node['hutchbase-gw']['source']['checksum']
  notifies :restart, 'tomcat_service[hutchbase-min]'
end
node.default['hutchbase-gw']['source'] = {
  'url' => 'http://octopus.fhcrc.org/misc/hutchbaseExternal.war',
  'checksum' => 'd35aaff5aceca47345c148ec7390de3f'\
                '1ff81b8fa27839165867788170bc2b7c'
}
