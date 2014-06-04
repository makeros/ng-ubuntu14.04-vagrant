# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant::Config.run do |config|

    config.vm.box = "test_box"

    #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

    config.vm.network :hostonly, "33.33.33.100" # Host-Only networking required for nfs shares

    config.vm.share_folder("symfony", "/vagrant", "./", :nfs => (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/))

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.options = ['--verbose']
	end

end