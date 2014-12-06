
IMAGE_MAPPING = {
  "ubuntu-14.04" => {
    :base => "chef/ubuntu-14.04",
    :dest => "mackerelio/cookbook-mackerel-agent-ubuntu-14.04",
  },
}

IMAGES = IMAGE_MAPPING.keys.map {|k| IMAGE_MAPPING[k][:dest] }

class Docker < Thor
  include Thor::Actions

  default_task :default

  desc 'default', 'build image and run spec'
  def default
    build
    spec
  end

  desc 'vendor', 'berks vendor'
  def vendor(dir="berks-cookbooks")
    run 'bundle install --quiet'
    run "rm -fr #{dir}"
    run "bundle exec berks vendor #{dir}"
  end

  desc 'build', 'build docker image provisioned by chef'
  def build
    IMAGE_MAPPING.each do |name, mapping|
      base, dest = mapping[:base], mapping[:dest]
      vendor "docker/#{name}/cookbooks"
       
      run "docker build -t #{dest} docker/#{name}"
    end
  end

  desc 'spec', 'run spec'
  def spec
    IMAGES.each do |image|
      ENV['DOCKER_IMAGE'] = image
      run("bundle exec rspec -r spec_helper")
    end
  end
end
