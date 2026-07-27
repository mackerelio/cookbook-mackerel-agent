# frozen_string_literal: true

require 'serverspec'

set :backend, :docker

set :docker_url, ENV.fetch('DOCKER_HOST', nil)
set :docker_container, ENV.fetch('DOCKER_CONTAINER', nil)
