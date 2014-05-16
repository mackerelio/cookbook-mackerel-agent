# vim:set ft=ruby:

MACHINES = {
  'precise64' => {
    box: 'hashicorp/precise64'
  },
  'centos-6.5' => {
    box: 'chef/centos-6.5'
  },
}

apikey = File.read('.mackerel-api-key').chomp!

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest

  MACHINES.each do |name, machine|
    config.vm.box_check_update = false

    config.vm.define name do |config|
      config.vm.box = machine[:box]

      config.vm.hostname = [ 'mackerel-agent', name, 'vagrant', %x(uname -n).chomp ].join('.')

      config.vm.provision 'chef_solo' do |chef|
        chef.cookbooks_path = ['./berks-cookbooks']
        chef.add_recipe 'mackerel-agent'
        chef.json = {
          "mackerel-agent" => {
            apikey: apikey,
          }
        }
      end
    end
  end
end
