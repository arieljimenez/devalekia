# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 3306, host: 3306
  # config.vm.network "public_network"
  config.vm.network "public_network", ip: "192.168.1.225"
  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "Devalekia"
    vb.memory = "512"
    vb.cpus = 1
  end

  config.vm.provision "shell", path: "./scripts/config.sh"

end
