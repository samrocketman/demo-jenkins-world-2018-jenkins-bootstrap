# -*- mode: ruby -*-
# vi: set ft=ruby :

# Execute shell script before running vagrant.  This script will run on every
# vagrant command.

Vagrant.configure("2") do |config|
  # https://docs.vagrantup.com.
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = 6
  end

  config.vm.provision "shell", inline: <<-SHELL
    set -ex


    # install EPEL repo
    rpm -qa | grep -- epel-release || (
      yum makecache fast
      yum install -y epel-release
    )


    # install IUS repo
    rpm -qa | grep ius-release || (
      [ -r /tmp/ius.asc ] || curl -fLo /tmp/ius.asc https://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY
      echo '688852e2dba88a3836392adfc5a69a1f46863b78bb6ba54774a50fdecee7e38e  /tmp/ius.asc' | sha256sum -c
      rpm --import /tmp/ius.asc
      [ -r /tmp/ius.rpm ] || curl -fLo /tmp/ius.rpm https://centos7.iuscommunity.org/ius-release.rpm
      rpm -K /tmp/ius.rpm
      yum localinstall -y /tmp/ius.rpm
    )


    # install Docker repo
    [ -f /etc/yum.repos.d/docker-ce.repo ] || yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


    # install packages
    rpm -qa | grep -- docker-ce || (
      yum makecache
      yum install -y yum-utils device-mapper-persistent-data lvm2 git2u docker-ce
      yum install -y vim bind-utils net-tools nc ntpdate
      systemctl start ntpdate
      systemctl enable ntpdate
      systemctl start docker.service
      systemctl enable docker.service
    )

    curl https://raw.githubusercontent.com/samrocketman/home/master/bin/install-docker-compose.sh | DESTINATION=/usr/local/bin/docker-compose bash

    (
      export PATH=/usr/local/bin:"$PATH"
      cd /vagrant
      set +x
      source secret-env.sh
      set -x
      [ -n "$(docker-compose ps -q)" ] || docker-compose up -d
      ./jenkins_bootstrap.sh
    )
  SHELL
end
