FROM gocd/gocd-agent-ubuntu-18.04:v20.1.0

#use root to install tools
USER root
RUN apt-get update && apt-get install -y \
	python3-pip \
  	unzip \
 	wget \
	apt-transport-https \
	gnupg \
	lsb-release

#install docker to use dockerised security tools
RUN apt install -y docker.io
RUN usermod -aG docker go

#Install nikto
RUN wget https://github.com/sullo/nikto/archive/master.zip
RUN mkdir -p /opt/nikto
RUN unzip master.zip -d /opt/nikto/
RUN rm master.zip
RUN chown -R go /opt/nikto/

#Install trivy
RUN mkdir -p /opt/trivycache
RUN chown -R go /opt/trivycache
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add -
RUN echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list.d/trivy.list
RUN apt-get update
RUN apt-get install trivy -y

#Install the git history checker for secrets
RUN pip3 install trufflehog
RUN pip3 install safety
RUN pip3 install bandit

#downgrade back to go user per least privilege principle
USER go
