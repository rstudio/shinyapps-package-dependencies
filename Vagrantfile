# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.3"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "shinyapps-package-dependencies"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "docker" do |d|
    d.image = "cbarraford/r3x:latest"
    d.vagrant_vagrantfile = 'host_Vagrantfile'
  end

end
