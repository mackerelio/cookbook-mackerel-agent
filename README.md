cookbook-mackerel-agent ![Build Status](https://circleci.com/gh/mackerelio/cookbook-mackerel-agent.svg?style=shield&circle-token=d1d6814ee3a6add935eca5549de378d58f75a59f)
=======================

This cookbook provides recipes to install and configure mackerel-agent.
mackerel-agent is a server monitoring agent for https://mackerel.io .

Requirements
============

- Chef 11 or higher
- Ruby 1.9

SYNPOSIS
========

```ruby
node.default['mackerel-agent']['conf']['apikey'] = 'Your API KEY' # required
node.default['mackerel-agent']['conf']['roles'] = ["My-Service:app", "Another-Service:db"] # optional

node.default['mackerel-agent']['conf']['plugin.metrics.vmstat'] = { # optional
  'command' => 'ruby /etc/sensu/plugins/system/vmstat-metrics.rb',
}

include_recipe 'mackerel-agent'
include_recipe 'mackerel-agent::plugins' # Option for installation of mackerel-agent-plugins package
```

Attributes
==========

The following attributes are set by default.
(CAUTION! node attribute namespace has changed since version 1.0.)

```ruby
default['mackerel-agent']['package-action'] = :upgrade
```

You can customize agent configuration via following attributes.
(These attributes are set to `nil` by default and agent uses their default configuration)

```ruby
default['mackerel-agent']['conf']['apikey']  = nil
default['mackerel-agent']['conf']['pidfile'] = nil # in Linux, agent's default: "/var/run/mackerel-agent.pid"
default['mackerel-agent']['conf']['root'] = nil # in Linux, agent's default: "/var/lib/mackerel-agent"
default['mackerel-agent']['conf']['verbose'] = nil # agent's default: false
default['mackerel-agent']['conf']['roles'] = nil
```

### Not to start mackerel-agent when you create a static image (like AMI)

```ruby
default['mackerel-agent']['start_on_setup'] = false
```

### Configure environment variable options
You can configure environment variable options via the following attributes.
(These all attributes are set to `nil` by default)

```ruby
default['mackerel-agent']['env_opts']['other_opts'] = nil
default['mackerel-agent']['env_opts']['auto_retirement'] = nil
default['mackerel-agent']['env_opts']['http_proxy'] = nil
default['mackerel-agent']['env_opts']['mackerel_agent_plugin_meta'] = nil
```

Development
===========

[Development Docuement](DEVELOPMENT.md)

LICENSE
=======

Copyright:: 2014 Hatena Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
