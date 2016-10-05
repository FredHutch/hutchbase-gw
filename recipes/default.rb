#
# Cookbook Name:: hutchbase-gw
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

# Deploy ssl certs from vault

include_recipe 'chef-vault::default'

ssl_cert = chef_vault_item('hutchbase-gw', 'cert')['content']
ssl_cert_key = chef_vault_item('hutchbase-gw', 'key')['content']

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
