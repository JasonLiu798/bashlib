#!/bin/bash

cd /
ln -sfv /drives/c /c
ln -sfv /drives/d /d
ln -sfv /drives/e /e
ln -sfv /drives/f /f

#run gen_bash_srv > .bash_srv

#bin
ln -sfv /d/yp/project/shell/bin ~/bin
#lib
ln -sfv /d/yp/project/shell/share/lib ~/bin/lib

source ~/.bashrc
ln -sfv /d/tools /opt/tools
ln -sfv /opt/tools/maven/apache-maven-3.3.3 /opt/maven
ln -sfv /opt/mysql /d/tools/MySQL/MySQL5.6

ln -sfv /d/yp/documents/Scripts/ubin/lib ~/bin/lib





