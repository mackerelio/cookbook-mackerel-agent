FROM rockylinux/rockylinux:10

ARG chefver
RUN dnf install -y systemd && \
    rpm -i "https://packages.chef.io/files/stable/chef/${chefver}/el/10/chef-${chefver}-1.el10.x86_64.rpm" && \
    install -d -m 755 /cookbooks /etc/chef /var/chef/node && \
    dnf clean all

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
