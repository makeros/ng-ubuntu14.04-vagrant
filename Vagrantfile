# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant::Config.run do |config|

    # config.vm.box = "precise64"
    config.vm.box = "ubuntu_14.04"

    # config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
    #config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

    config.vm.network :hostonly, "33.33.33.166" # Host-Only networking required for nfs shares
    # config.vm.network :bridged#, "33.33.33.100" # Host-Only networking required for nfs shares
    config.vm.forward_port 8000, 3000
    # config.vm.network :forwarded_port, guest: 8000, host: 8080
    # config.vm.network :public_network, ip: "192.168.0.200"

    config.vm.share_folder("vagrant", "/vagrant", "./", :nfs => (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/), :mount_options => ['actimeo=2'])

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.options = ['--verbose']
	end

end