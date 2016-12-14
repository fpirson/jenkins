FROM centos:7
MAINTAINER Frédéric Pirson

ARG PROXY_HOST
ARG PROXY_PORT

# Define environment variables for proxies
ENV PROXY_HOST_VALUE ${PROXY_HOST}
ENV PROXY_PORT_VALUE ${PROXY_PORT:-3128}

ENV http_proxy http://${PROXY_HOST_VALUE}:${PROXY_PORT_VALUE}/
ENV https_proxy https://${PROXY_HOST_VALUE}:${PROXY_PORT_VALUE}/
ENV NO_PROXY localhost,127.0.0.0/8
ENV no_proxy localhost,127.0.0.0/8

# Define environment variables for user
ENV USER_JBOSS wildfly
ENV USER_HOME /home/$USER_JBOSS

# Define environment variables for Java
ENV JAVA_VERSION 7

# Define environment variables for Jboss
ENV JBOSS_SHORT_VERSION 8.2.0
ENV JBOSS_VERSION 8.2.0.Final
ENV JBOSS_DESTINATION_DIRECTORY /usr/interop
ENV ROOT_JBOSS_HOME $JBOSS_DESTINATION_DIRECTORY/wildfly-8.2.0.Final

# Set the JAVA_HOME variable to make it clear where Java is located 
ENV JAVA_OPTS "-server -Xms256m -Xmx2048m -XX:MaxPermSize=1024m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true -Djboss.remoting.pooled-buffers=false"
RUN mkdir /project

ADD ./assets /tmp/assets/
RUN chmod +x /tmp/assets/scripts/*

# Install of tools 
RUN /tmp/assets/scripts/install-common.sh
RUN dos2unix /tmp/assets/scripts/*

#Install of java
RUN /tmp/assets/scripts/install-java.sh

#Installation of JBOSS
ADD ./wildfly-8.2.0.Final.tar.gz /tmp/
RUN /tmp/assets/scripts/install-jboss.sh

# Copy configuration files
RUN /usr/bin/cp -rf /tmp/assets/config /

#Enable entrypoint execution
RUN chmod +x /usr/interop/wildfly-8.2.0.Final/jboss-entrypoint.sh

#Cleaning
RUN rm -rf /tmp/*

EXPOSE 8080 9990 8787
ENTRYPOINT ["/bin/bash", "/usr/interop/wildfly-8.2.0.Final/jboss-entrypoint.sh"]


