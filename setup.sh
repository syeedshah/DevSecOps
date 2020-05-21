#!/bin/bash
sudo apt-get update
sudo apt install docker.io -y
sudo apt-get install -y docker-compose

#let non root user user docker
sudo usermod -aG docker $(whoami)

#build the gocd server and agent container
docker-compose up -d --build
