### Deploy
percona: ubuntu-deb


### Vault
vault-encrypt:
	ansible-vault encrypt vars/vault.yml

vault-decrypt:
	ansible-vault decrypt vars/vault.yml


### Percona debian
apt: distribution-apt
percona-debian: debian-deb tools
percona-ubuntu: ubuntu-deb tools


### Apt get distribution
distribution-apt: install-distribution-apt configure configure-security configure-user

install-distribution-apt:
	# Install percona apt get distribution
	ansible-playbook main.yml -i localhost -t percona_install_distribution_apt_get


### Official sources deb
debian-deb: deb-debian install configure configure-security configure-user
ubuntu-deb: deb-ubuntu install configure configure-security configure-user

### Apt key old method
debian-apt: apt-key debian-repository install configure configure-security configure-user
ubuntu-apt: apt-key ubuntu-repository install configure configure-security configure-user


### Tags
deb-debian:
	# Install percona release deb
	ansible-playbook main.yml -i localhost -t percona_deb_debian

deb-ubuntu:
	# Install percona release deb
	ansible-playbook main.yml -i localhost -t percona_deb_ubuntu

apt-key:
	# Install percona apt key
	ansible-playbook main.yml -i localhost -t percona_install_apt_key

debian-repository:
	# Install percona debian repository
	ansible-playbook main.yml -i localhost -t percona_debian_repository

ubuntu-repository:
	# Install percona ubuntu repository
	ansible-playbook main.yml -i localhost -t percona_ubuntu_repository

install:
	# Install percona
	ansible-playbook main.yml -i localhost -t percona_install

configure:
	# Configure percona
	ansible-playbook main.yml -i localhost -t percona_configure

configure-security:
	# Configure percona security
	ansible-playbook main.yml -i localhost -t percona_configure_security

configure-user:
	# Configure percona user
	ansible-playbook main.yml -i localhost -t percona_configure_user

source:
	# Install percona from source
	ansible-playbook main.yml -i localhost -t percona_source


### Tools
tools: toolkit xtrabackup mysql-optimization-scripts

toolkit:
	# Percona toolkit
	ansible-playbook main.yml -i localhost -t percona_toolkit

xtrabackup:
	# Percona xtrabackup
	ansible-playbook main.yml -i localhost -t percona_xtrabackup

mysql-optimization-scripts:
	# Percona xtrabackup
	ansible-playbook main.yml -i localhost -t mysql_optimization_scripts
