#
# Cookbook Name:: mackerel-agent
# Recipe:: default
#
# Copyright 2014, Hatena Co., Ltd.
#
# Apache License, Version 2.0
#

whyrun_config = Chef::Config[:why_run]
begin
  Chef::Config[:why_run] = false
  chef_gem "toml" do
    action :install
  end
ensure
  Chef::Config[:why_run] = whyrun_config
end

require "toml"

gpgkey_url = 'https://mackerel.io/assets/files/GPG-KEY-mackerel'
package_options = ""

if platform?('centos') or platform?('redhat') or platform?('amazon')
  include_recipe 'yum'
  yum_cookbook_ver = Gem::Version.new(run_context.cookbook_collection['yum'].version)
  if yum_cookbook_ver < Gem::Version.new('3.0.0')
    yum_key "RPM-GPG-KEY-mackerel" do
      url gpgkey_url
      action :add
    end
  end
  yum_repository "mackerel" do
    gpgkey gpgkey_url if yum_cookbook_ver >= Gem::Version.new('3.0.0')
    description "mackerel-agent monitoring"
    url "http://yum.mackerel.io/centos/$basearch"
    action :add
  end
elsif platform?('debian') or platform?('ubuntu')
  package_options = '--force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

  include_recipe 'apt'
  apt_repository "mackerel" do
    uri 'http://apt.mackerel.io/debian/'
    key gpgkey_url
    distribution 'mackerel'
    components ['contrib']
    action :add
  end
end

package 'mackerel-agent' do
  action :install
  options package_options
end

file "/etc/mackerel-agent/mackerel-agent.conf" do
  owner "root"
  group "root"
  mode 0644
  content lazy { TOML::Generator.new(node['mackerel-agent']).body }
  notifies :restart, 'service[mackerel-agent]'
end

service 'mackerel-agent' do
  supports :status => true, :restart => true
  action [:enable, :start]
end
