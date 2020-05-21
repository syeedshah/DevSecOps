FROM gocd/gocd-agent-ubuntu-18.04:v20.1.0

#use root to install tools
USER root
RUN apt-get update && apt-get install -y \
	python-pip \
	python3-pip \
  unzip \
 	wget

#Install nikto
RUN wget https://github.com/sullo/nikto/archive/master.zip
RUN unzip master.zip -d ~/
RUN rm master.zip

#Install the git history checker for secrets
RUN pip3 install trufflehog
RUN pip install safety
RUN pip install bandit