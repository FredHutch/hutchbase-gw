#
# Cookbook Name:: hutchbase-gw
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'nginx'

nginx_site 'hutchbase-gw' do
  enable true
  template 'hutchbase.conf.erb'
  variables(
    'server_name' => node['hutchbase-gw']['server_name'],
    'ssl_cert' => node['hutchbase-gw']['ssl_cert'],
    'ssl_cert_key' => node['hutchbase-gw']['ssl_cert_key'],
    'logdir' => node['hutchbase-gw']['logdir'],
    'uri' => "#{node['hutchbase-gw']['url']}:#{node['hutchbase-gw']['port']}"
  )
end
