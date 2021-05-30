#hard disk
export C=/c
export D=/d
export E=/e
export F=/f
export G=/g


#common
#export YP=$D/yp

export TL=$D/tools

#export CYGWIN=$TOOLS/cygwin
#ubin & serverfile config
#export UBIN=~/bin
#export BLIB=$UBIN/lib
#export DDIR=$UBIN/data
#export SETUP=/opt/setups
#export TL=/opt/tools
#export GPG=$TL/GnuPG
#export BAK=$YP/BACKUP
#export OPT=/opt

#win
export WIN=$C/Windows
export S32=$WIN/System32
export USR=$C/Users/$UNAME
export HOST=$S32/drivers/etc

#project
export PRJ=$D/project
export DOC=$PRJ/KnowledgeBase

export PRJJ=$PRJ/java
export PRJSH=$PRJ/bashlib
export PRPY=$PRJ/python

export PRLT=$PRJ/leetcode
export PRPH=$PRJ/php

# export WWW=$TOOLS/xampp/htdocs
#other bin
export THIRDBIN=$PRJ/useful-scripts

#export SHAREBIN=$SHP/share


#java
JAVA_HOME=$TL/jdk1.8.0_251
M2_HOME=$TL/maven/apache-maven-3.3.3
#HADOOP_HOME=/opt/hadoop
#CATALINA_HOME=/opt/server/tomcat
export REPO=$D/repo
#TOMCAT=$CATALINA_HOME
CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib:.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
export JAVA_HOME M2_HOME CLASSPATH


#Tools
#export PHANTOMJS=$TL/phantomjs-2.0.0-windows/bin
#export CASPER_PATH=$TL/casperjs
#export CASPER_BIN=$CASPER_PATH/bin

#export NODEJSBASE=$TL/nodejs
#export NODEJS=$NODEJSBASE/nodejs54
#export MYSQLBIN=$TL/MySQL/MySQL5.6/bin
#vm
#export VAGRANT=$TL/vagrant
#export VM=$E/vm
#export UB=$VM/ubuntu64
#export SH=$VM/share
#export VBOX=$TL/VirtualBox
#export DOCKER=$TL/DockerToolbox
#db
#export MYSQL=/opt/mysql
#export NODE_PATH='D:\\tools\\nodejs\\node_modules'

#export PATH=$PATH:$JAVA_HOME/bin:$C/HashiCorp/Vagrant/bin:$M2_HOME/bin:$CXF_HOME/bin:$UBIN:$CATALINA_HOME/bin:$GPG/pub:$PHANTOMJS:$CASPER_BIN:$NODEJS:$MYSQL/bin
#export PATH=$PATH:$JAVA_HOME/bin:$VAGRANT/bin:$M2_HOME/bin:$CXF_HOME/bin:$UBIN:$CATALINA_HOME/bin:$GPG/pub:$PHANTOMJS:$CASPER_BIN:$NODEJS:$NODEJSBASE:$MYSQLBIN:$VBOX:$DOCKER:$THIRDBIN:$SHAREBIN
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$UBIN
