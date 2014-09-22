require 'fileutils'

ALL_MACHINES = 'precise64 centos-6.5'
task :default => [:init, 'vagrant:make']

task :init do
  sh 'vagrant', 'plugin', 'install', 'vagrant-omnibus'
end

task :setup do
  sh 'bundle', 'install', '--quiet'
  rm_rf 'berks-cookbooks'
  sh 'bundle', 'exec', 'berks', 'vendor'
end

namespace :vagrant do
  task :make, [:machine, :target] => [:up, :provision]
  task :remake, [:machine, :target] => [:clean, :up, :provision]

  task :up, [:machine] => [:setup] do |t,args|
    prepare_args! args
    args.machines.each do |machine|
      sh 'vagrant', 'up', machine
    end
  end

  task :provision, [:machine] => [:setup] do |t,args|
    prepare_args! args
    args.machines.each do |machine|
      sh 'vagrant', 'provision', machine
    end
  end

  task :clean, [:machine] => [:setup] do |t,args|
    prepare_args! args
    args.machines.each do |machine|
      sh 'vagrant', 'destroy', '-f', machine
    end
  end

  def prepare_args!(args)
    args.with_defaults(
      :target => ENV['TARGET'],
      :machines => ENV.reject { |k,v| v.empty? }.fetch('MACHINE', ALL_MACHINES).split(/[, ]+/)
    )
  end
end
