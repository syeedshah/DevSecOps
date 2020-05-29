FROM gocd/gocd-agent-ubuntu-18.04:v20.1.0

#use root to install tools
USER root
RUN apt-get update && apt-get install -y \
	python-pip \
	python3-pip \
  	unzip \
 	wget

#install docker to use dockerised security tools
RUN apt install -y docker.io
RUN usermod -aG docker go

#Install nikto
RUN wget https://github.com/sullo/nikto/archive/master.zip
RUN mkdir -p ~/niktodast
RUN unzip master.zip -d ~/niktodast/
RUN rm master.zip
RUN chown -R go ~/niktodast/

#Install the git history checker for secrets
RUN pip3 install trufflehog
RUN pip3 install safety
RUN pip install bandit

#downgrade back to go user per least privilege principle
USER go
