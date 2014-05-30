#
# Cookbook Name:: mackerel-agent
# Recipe:: default
#
# Copyright 2014, Hatena Co., Ltd.
#
# Apache License, Version 2.0
#

chef_gem "toml" do
  action :install
end
require "toml"

gpgkey = 'https://mackerel.io/assets/files/GPG-KEY-mackerel'

if platform?('centos') or platform?('redhat') or platform?('amazon')
  include_recipe 'yum'
  yum_key "RPM-GPG-KEY-mackerel" do
    url gpgkey
    action :add
  end
  yum_repository "mackerel" do
    description "mackerel-agent monitoring"
    url "http://yum.mackerel.io/centos/$basearch"
    action :add
  end
elsif platform?('debian') or platform?('ubuntu')
  include_recipe 'apt'
  apt_repository "mackerel" do
    uri 'http://apt.mackerel.io/debian/'
    key gpgkey
    distribution 'mackerel'
    components ['contrib']
    action :add
  end
end

package 'mackerel-agent' do
  action :install
end

file "/etc/mackerel-agent/mackerel-agent.conf" do
  owner "root"
  group "root"
  mode 0644
  content TOML::Generator.new(node['mackerel-agent']).body
  notifies :restart, 'service[mackerel-agent]'
end

service 'mackerel-agent' do
  supports :status => true, :restart => true
  action [:enable, :start]
end
