#!/usr/bin/env bash

set -ex

# Prevent from recursive copy of vendored cookbooks
rm -fr docker/*/cookbooks

bundle exec berks vendor docker/$DIST/cookbooks

image=mackerelio/cookbook-mackerel-agent-$DIST
docker build -t $image --build-arg chefver=$CHEFVER docker/$DIST

# service[] resources need a real systemd (PID 1) to check/enable units against,
# so run the container with systemd as its init instead of running chef-client
# inside a `docker build` layer.
container=$(docker run -d --privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw $image)
trap 'docker rm -f "$container" >/dev/null' EXIT

for _ in $(seq 1 30); do
  state=$(docker exec "$container" systemctl is-system-running 2>/dev/null || true)
  case "$state" in
    running|degraded) break ;;
  esac
  sleep 1
done

docker exec "$container" chef-client --chef-license accept-silent -j /var/chef/node/localhost.json

DOCKER_CONTAINER=$container bundle exec rspec -r spec_helper
