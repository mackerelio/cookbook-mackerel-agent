FROM ubuntu:18.04

ARG chefver
RUN apt-get update && apt-get install -y curl gpg && \
    curl -fsL -o /tmp/chef.deb \
        https://packages.chef.io/files/stable/chef/${chefver}/ubuntu/18.04/chef_${chefver}-1_amd64.deb && \
    dpkg -i /tmp/chef.deb

RUN install -d -m 755 /cookbooks /etc/chef /var/chef/node

RUN echo "local_mode      true" >> /etc/chef/client.rb;  \
    echo "cookbook_path  ['/cookbooks']" >> /etc/chef/client.rb; \
    echo "cache_path      '/var/chef/cache'" >> /etc/chef/client.rb; \
    echo "node_path       '/var/chef/node'" >> /etc/chef/client.rb; \
    echo "environment     '_default'" >> /etc/chef/client.rb; \
    echo "ssl_verify_mode :verify_peer" >> /etc/chef/client.rb;
RUN echo '{"run_list":["recipe[mackerel-agent]"], "mackerel-agent": {"start_on_setup": false}}' > /var/chef/node/localhost.json

COPY ./cookbooks /cookbooks

RUN chef-client --chef-license accept-silent -j /var/chef/node/localhost.json
