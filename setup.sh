#!/bin/bash
sudo apt-get update
sudo apt-get install acl -y
sudo apt install docker.io -y
sudo apt-get install -y docker-compose

#let non root user user docker
sudo usermod -aG docker $(whoami)

#change owner of godata folder to that of gocd server user which has uid 1000
sudo chown -R 1000 godata

#Populate gocd config with random ids
AGENT_VAR = $(openssl rand -hex 15)
#add agent auto reg to gocd server and to gocd agent
sed -i -e "s/<aark>/$AGENT_VAR/g" docker-compose.yml
sed -i -e "s/<aark>/$AGENT_VAR/g" godata/config/cruise-config.xml

sed -i -e "s/<whs>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml
sed -i -e "s/<sid>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml
sed -i -e "s/<tgk>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml

#build the gocd server and agent container
docker-compose up -d --build

sudo setfacl -m user:$(whoami):rw /var/run/docker.sock
