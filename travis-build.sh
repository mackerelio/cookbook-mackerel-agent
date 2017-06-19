#!/usr/bin/env bash

set -ex

rm -fr docker/$DIST/cookbooks
bundle exec berks vendor docker/$DIST/cookbooks

image=mackerelio/cookbook-mackerel-agent-$DIST
docker build -t $image docker/$DIST

DOCKER_IMAGE=$image bundle exec rspec -r spec_helper
