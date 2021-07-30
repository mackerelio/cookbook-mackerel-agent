FROM amazonlinux:1

ARG chefver
RUN rpm -i https://packages.chef.io/files/stable/chef/${chefver}/el/6/chef-${chefver}-1.el6.x86_64.rpm
RUN yum install -y net-tools

RUN install -d -m 755 /cookbooks /etc/chef /var/chef/node

RUN echo "local_mode      true" >> /etc/chef/client.rb;  \
    echo "cookbook_path  ['/cookbooks']" >> /etc/chef/client.rb; \
    echo "cache_path      '/var/chef/cache'" >> /etc/chef/client.rb; \
    echo "node_path       '/var/chef/node'" >> /etc/chef/client.rb; \
    echo "environment     '_default'" >> /etc/chef/client.rb; \
    echo "ssl_verify_mode :verify_peer" >> /etc/chef/client.rb;
RUN echo '{"run_list":["recipe[mackerel-agent]"], "mackerel-agent": {"start_on_setup": false}}' > /var/chef/node/localhost.json

COPY ./cookbooks /cookbooks

# Hack for Chef 14. yum_package fails with EOFError without redirecting stdio...
RUN chef-client --chef-license accept-silent -j /var/chef/node/localhost.json | cat
