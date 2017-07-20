# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "shell", inline: <<-SHELL
    # useful for debugging
    yum -y install net-tools

    # install postgresql
    rpm -Uvh https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
    yum -y install postgresql96-server postgresql96-contrib
    sudo -i -upostgres /usr/pgsql-9.6/bin/initdb
    systemctl start postgresql-9.6
    systemctl enable postgresql-9.6

    # create initial database
    psql -Upostgres -f /vagrant/setup.sql

    # Load sample data file
    psql -Upostgres -f /vagrant/sample-data.sql

    # configure to allow connections and listen on known ip
    sed -i "s/#listen_addresses = 'localhost'/listen_addresses = 'localhost,192.168.33.10'/" /var/lib/pgsql/9.6/data/postgresql.conf
    echo "host    sample          dbuser     192.168.33.1/24         trust" >> /var/lib/pgsql/9.6/data/pg_hba.conf
    echo "host    sample          dbadmin     192.168.33.1/24         trust" >> /var/lib/pgsql/9.6/data/pg_hba.conf
    systemctl restart postgresql-9.6
  SHELL
end
