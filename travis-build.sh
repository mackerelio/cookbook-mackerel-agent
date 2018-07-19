#!/usr/bin/env bash

set -ex

# Prevent from recursive copy of vendored cookbooks
rm -fr docker/*/cookbooks

bundle exec berks vendor docker/$DIST/cookbooks

image=mackerelio/cookbook-mackerel-agent-$DIST
docker build -t $image --build-arg chefver=$CHEFVER docker/$DIST

DOCKER_IMAGE=$image bundle exec rspec -r spec_helper
