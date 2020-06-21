#!/bin/bash
sudo apt-get update
sudo apt-get install acl -y
sudo apt install docker.io -y
#sudo apt-get install -y docker-compose
#install latest docker compose version
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#let non root user user docker
sudo usermod -aG docker $(whoami)

# lets install trivy in ubuntu agent instead of docker
##############################################################
#add cache for container scanner tool trivy
#mkdir -p ~/trivycache
#go agent will to access this folder and has 1000 uid
#sudo chown -R 1000 ~/trivycache
#############################################################
# keeping above for reference

#Populate gocd config with random ids
AGENT_VAR=$(openssl rand -hex 15)
#add agent auto reg to gocd server and to gocd agent
sed -i -e "s/<aark>/$AGENT_VAR/g" docker-compose.yml
sed -i -e "s/<aark>/$AGENT_VAR/g" godata/config/cruise-config.xml

sed -i -e "s/<whs>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml
sed -i -e "s/<sid>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml
sed -i -e "s/<tgk>/$(openssl rand -hex 15)/g" godata/config/cruise-config.xml

#change owner of godata folder to that of gocd server user which has uid 1000
#change ownership after cruise-config is edited by the user running script
sudo chown -R 1000 godata/

#build the gocd server and agent container
sudo setfacl -m user:$(whoami):rw /var/run/docker.sock
#the user with uid 1000 in host
sudo setfacl -m user:$(id -nu 1000):rw /var/run/docker.sock

#p stands for projectname and also used for network which is gonna be gocdpipeline_default
#if we add container to network then we can refer to it by container name as its domain name
docker-compose -p "gocdpipeline" up -d --build

#install defect dojo and put it in same project/network as gocd
git clone https://github.com/DefectDojo/django-DefectDojo
cd django-DefectDojo
docker-compose -p "gocdpipeline" up -d --build

#printout gocd username and password
echo "gocd user: admin"
echo "gocd pass:"
docker-compose -p "gocdpipeline" logs initializer | grep "Admin password:"
