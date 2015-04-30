#
# Cookbook Name:: mackerel-agent
# Recipe:: plugins
#
# Copyright 2014, Hatena Co., Ltd.
#
# Apache License, Version 2.0
#

package "mackerel-agent-plugins" do
  action node['mackerel-agent']['plugins']['package-action'].to_sym
end
