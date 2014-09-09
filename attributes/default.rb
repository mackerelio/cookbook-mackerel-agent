default['mackerel-agent']['apikey']  = nil
default['mackerel-agent']['pidfile'] = nil
default['mackerel-agent']['root'] = nil
default['mackerel-agent']['verbose'] = nil
default['mackerel-agent']['roles'] = nil    # eg. ["My-Service:app", "Another-Service:db"]
default['mackerel-agent']['chef-config']['package_action'] = :upgrade # chef-config namespace does not include mackerel-agent config file by toml generator
