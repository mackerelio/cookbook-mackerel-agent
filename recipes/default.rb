#
# Cookbook Name:: mackerel-agent
# Recipe:: default
#
# Copyright 2014, Hatena Co., Ltd.
#
# Apache License, Version 2.0
#

gpgkey = 'https://mackerel.io/assets/files/GPG-KEY-mackerel'
if platform?('centos') or platform?('redhat') or platform?('amazon')
  include_recipe 'yum'
  yum_repository "mackerel" do
    description "mackerel-agent monitoring"
    baseurl "http://yum.mackerel.io/centos/$basearch"
    gpgkey gpgkey
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

template "/etc/mackerel-agent/mackerel-agent.conf" do
  source "mackerel-agent.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

service 'mackerel-agent' do
  supports :status => true, :restart => true
  action [:enable, :start]
end
