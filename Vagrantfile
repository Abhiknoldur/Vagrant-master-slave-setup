# -*- mode: ruby -*-
# vi: set ft=ruby

# The servers this vagrantfile creates will be managed by Ansible after they are created.
# Copy the public SSH key from the Ansible server to the vagrant host for deployment.

# Specify a custom Vagrant box for the demo
#BOX_NAME = ENV['BOX_NAME'] || "centos/7"
BOX_NAME = ENV['BOX_NAME'] || "debian/stretch64"

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

SSH_PUB_KEY="id_rsa.pub"
INTERNAL_NET="10.1.42."
DOMAIN=""
servers=[
  {
    :hostname => "Leader" + DOMAIN,
    :ip => INTERNAL_NET + "11",
    :ssh_port => "22011",
    :ram => 512
  },
  {
    :hostname => "Slave1" + DOMAIN,
    :ip => INTERNAL_NET + "12",
    :ssh_port => "22012",
    :ram => 512
  },
  {
    :hostname => "Slave2" + DOMAIN,
    :ip => INTERNAL_NET + "13",
    :ssh_port => "22013",
    :ram => 512
  },
  {
    :hostname => "Slave3" + DOMAIN,
    :ip => INTERNAL_NET + "14",
    :ssh_port => "22014",
    :ram => 512
  }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = BOX_NAME
      node.vm.hostname = machine[:hostname]
      node.vm.network "private_network", ip: machine[:ip]
      node.vm.network :forwarded_port, guest: 22, host: machine[:ssh_port], id: 'ssh'
      node.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
        vb.name = machine[:hostname]
      end
      node.vm.provision "file", source: SSH_PUB_KEY, destination: "~/.ssh/authorized_keys"
    end
  end
end

