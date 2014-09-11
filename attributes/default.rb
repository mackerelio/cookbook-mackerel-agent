default['mackerel-agent']['conf']['apikey']  = nil
default['mackerel-agent']['conf']['pidfile'] = nil
default['mackerel-agent']['conf']['root'] = nil
default['mackerel-agent']['conf']['verbose'] = nil
default['mackerel-agent']['conf']['roles'] = nil    # eg. ["My-Service:app", "Another-Service:db"]

default['mackerel-agent']['package-action'] = :upgrade
