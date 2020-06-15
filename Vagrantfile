# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "testbox01" do |testbox01|
    testbox01.vm.box = "bento/centos-7.2"
    testbox01.vm.network "private_network", ip: "192.168.10.21"
    testbox01.vm.hostname = "Testbox01"
    testbox01.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
    testbox01.vm.provision "shell", inline: <<-SHELL
      sudo echo "192.168.10.22 testbox02" | sudo tee -a /etc/hosts
      sudo echo "192.168.10.23 testbox03" | sudo tee -a /etc/hosts
      sudo systemctl enable firewalld
      sudo systemctl start firewalld
      sudo firewall-cmd --permanent --zone=public --add-port=8140/tcp
      sudo yum -y install ntp
      sudo timedatectl set-timezone America/New_York
      sudo systemctl start ntpd
      sudo firewall-cmd --add-service=ntp --permanent
      sudo firewall-cmd --reload
    SHELL
  end

  config.vm.define "testbox02" do |testbox02|
    testbox02.vm.box = "bento/centos-7.2"
    testbox02.vm.network "private_network", ip: "192.168.10.22"
    testbox02.vm.hostname = "Testbox02"
    testbox02.vm.provision "shell", inline: <<-SHELL
       sudo echo "192.168.10.21 testbox01" | sudo tee -a /etc/hosts
       sudo timedatectl set-timezone America/New_York
    SHELL
    end

    config.vm.define "testbox03" do |testbox03|
      testbox03.vm.box = "bento/centos-7.2"
      testbox03.vm.network "private_network", ip: "192.168.10.23"
      testbox03.vm.hostname = "Testbox03"
      testbox03.vm.provision "shell", inline: <<-SHELL
       sudo echo "192.168.10.21 testbox01" | sudo tee -a /etc/hosts
       sudo timedatectl set-timezone America/New_York
    SHELL
  end
end

