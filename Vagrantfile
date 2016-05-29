# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. 
Vagrant.configure(2) do |config|

  config.ssh.forward_agent = true

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "puppetlabs/debian-8.2-64-nocm"

  # Create a public network.    
  config.vm.network "public_network"
  
  # Enable provisioning with a shell script.
  config.vm.provision "shell", path: "provision.sh"
  
end