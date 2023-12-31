FROM jenkins/jenkins:2.414.2-jdk17
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ARG DOCKER_HOST_IP
USER root
RUN apt-get update && apt-get install -y lsb-release ansible
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY jenkins.model.JenkinsLocationConfiguration.xml /usr/share/jenkins/ref/
RUN sed -i "s/localhost/${DOCKER_HOST_IP}/g" /usr/share/jenkins/ref/jenkins.model.JenkinsLocationConfiguration.xml
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
