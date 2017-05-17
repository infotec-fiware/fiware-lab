#!/bin/bash

printf "\n" >> /home/vagrant/.bashrc
echo 'export PS1="\[\e[01;34m\]orion-context-broker\[\e[0m\]\[\e[01;37m\]:\w\[\e[0m\]\[\e[00;37m\]\n\\$ \[\e[0m\]"' >> /home/vagrant/.bashrc
printf "\n" >> /home/vagrant/.bashrc

sudo yum -y check-update
sudo yum -y install vim
curl -fsSL https://get.docker.com/ | sh
curl https://gist.githubusercontent.com/danimaniarqsoft/177b6c8cb579f0cac87b8d13d74e886c/raw/cdbdd584defb996b570ec068388405ec2f017741/docker-compose.yml > docker-compose.yml
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker vagrant

# install dockers-composed

sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install --upgrade pip
sudo pip install backports.ssl_match_hostname --upgrade
sudo pip install docker-compose
sudo yum -y upgrade python*
