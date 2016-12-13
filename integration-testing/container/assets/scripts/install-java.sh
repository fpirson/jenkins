#!/bin/bash

echo "Download Java"
yum clean metadata
echo "minrate=1\n" >> /etc/yum.conf
echo "timeout=100\n" >> /etc/yum.conf

yum install -y java-1.7.0-openjdk

#wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz