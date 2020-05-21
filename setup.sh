#!/bin/bash
sudo apt-get update
sudo apt-get install acl -y
sudo apt install docker.io -y
sudo apt-get install -y docker-compose

#let non root user user docker
sudo usermod -aG docker $(whoami)
sudo setfacl -m user:$(whoami):rw /var/run/docker.sock

#change owner of godata folder to that of gocd server user which has uid 1000
sudo chown -R 1000 godata

#build the gocd server and agent container
docker-compose up -d --build
