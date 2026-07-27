FROM debian:stable

ARG chefver
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends curl gnupg systemd systemd-sysv && \
    curl -fsL https://omnitruck.chef.io/install.sh | bash -s -- -v "${chefver}" && \
    rm -rf /var/lib/apt/lists/*

RUN install -d -m 755 /cookbooks /etc/chef /var/chef/node

RUN { \
      echo "local_mode      true"; \
      echo "cookbook_path  ['/cookbooks']"; \
      echo "cache_path      '/var/chef/cache'"; \
      echo "node_path       '/var/chef/node'"; \
      echo "environment     '_default'"; \
      echo "ssl_verify_mode :verify_peer"; \
    } >> /etc/chef/client.rb
RUN echo '{"run_list":["recipe[mackerel-agent]"], "mackerel-agent": {"start_on_setup": false}}' > /var/chef/node/localhost.json

COPY ./cookbooks /cookbooks

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
