FROM jenkins

USER root

ADD certs/hg.subrosagames.com.pem /root/
ADD certs/nexus.subrosagames.com.pem /root/
RUN keytool -import -trustcacerts -alias hg.subrosagames.com -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -file /root/hg.subrosagames.com.pem -storepass changeit -noprompt
RUN keytool -import -trustcacerts -alias nexus.subrosagames.com -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -file /root/nexus.subrosagames.com.pem -storepass changeit -noprompt

USER jenkins

