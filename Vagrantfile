# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  {
   :hostname => "master",
   :ip => "10"
  },
  {
   :hostname => "slave",
   :ip => "11"
  }
]

Vagrant.configure("2") do |config|

   # VirtualBox
   config.vm.box = "trusty64"
   config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

   nodes.each do |temp|
	config.vm.define temp[:hostname] do |box|
	   box.vm.hostname = temp[:hostname]
           box.vm.network :private_network, ip: "192.168.236.#{temp[:ip]}", :netmask => "255.255.255.0"
	   box.vm.network :private_network, ip: "172.10.100.#{temp[:ip]}", :netmask => "255.255.255.0"
	   
	   box.vm.provision :shell, :path => "#{temp[:hostname]}.sh"
           box.vm.provider :virtualbox do |config|
             config.customize ["modifyvm", :id, "--memory", 4096]
             config.customize ["modifyvm", :id, "--cpus",2 ]
	   end
        end
   end
end
