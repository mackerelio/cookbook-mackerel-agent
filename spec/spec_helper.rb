require 'serverspec'

set :backend, :docker

set :docker_url, ENV['DOCKER_HOST']
set :docker_image, ENV['DOCKER_IMAGE']

# monkey-patch to prevent specinfra from trying to delete container
# https://circleci.com/docs/1.0/docker-btrfs-error/
class Specinfra::Backend::Docker
  def cleanup_container
    @container.stop
  end
end
