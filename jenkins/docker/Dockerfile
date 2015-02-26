FROM dockerfile/java:oracle-java8
MAINTAINER Josiah Gore <josiahgore@gmail.com>

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get clean

# copy jenkins war file to the container
ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war

ENV JENKINS_HOME /jenkins
VOLUME /jenkins

RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins
RUN chown -R jenkins "$JENKINS_HOME"

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER root

ADD certs/nexus.subrosagames.com.pem /root/
RUN keytool -import -trustcacerts -alias nexus.subrosagames.com -keystore /usr/lib/jvm/java-8-oracle/jre/lib/security/cacerts -file /root/nexus.subrosagames.com.pem -storepass changeit -noprompt

USER jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
CMD [""]

