# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 3001, host: 8089
  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
  end
end
