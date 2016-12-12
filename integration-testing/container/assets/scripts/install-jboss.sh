#!/bin/bash

echo "Download JBoss"


echo "Packages required for JBoss installation"
echo "initscripts - for running service"
cd /tmp
wget http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz

echo "Create new jboss user"

echo "Add user jboss"
adduser -d $USER_HOME $USER_JBOSS

echo "Create JBoss folders structure"

mkdir -p $ROOT_JBOSS_HOME

echo "Unzip JBoss"
tar -zxvf wildfly-8.2.0.Final.tar.gz -C $JBOSS_DESTINATION_DIRECTORY

chown -R $USER_JBOSS:$USER_JBOSS $ROOT_JBOSS_HOME

echo "Clean JBoss ZIP and extracted JBoss"
rm -f /tmp/wildfly-8.2.0.Final.tar.gz

echo "Create deployment dir"
mkdir $JBOSS_DESTINATION_DIRECTORY/wildfly-8.2.0.Final/standalone/deployments-from-out







