FROM jenkins/jenkins:lts
MAINTAINER abobwhite
USER root

RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common \
      python3-pip \
      python3-dev && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable" && \
    apt-get update -qq && \
    apt-get install docker.io -y && \
    apt-get clean && \
    usermod -aG docker jenkins && \
    curl -L "https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    pip install 'ansible==2.9.*'

USER jenkins

# Pre-loaded plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
