#!/bin/bash

#windows drivers
cd /
ln -sfv /drives/c /c
ln -sfv /drives/d /d
ln -sfv /drives/e /e
ln -sfv /drives/f /f

#run gen_bash_srv > .bash_srv
#init bashrc
prj=/d/yp/project/
shp=$prj/shell
rcpath=$shp/share/bashrc
for rcfile in `ls -a $rcpath/moba|grep -v '/'`
do
    #filter ~
    echo $rcfile
    set -x
    ln -sfv $rcpath/$rcfile ~/$rcfile
    set +x
done
#vimrc
ln -sfv $rcpath/.vimrc ~/.vimrc
#bin
ln -sfv $shp/bin ~/bin
#lib
ln -sfv $shp/share/lib ~/bin/lib

source ~/.bashrc

#other softwares
ln -sfv /d/tools /opt/tools
ln -sfv /opt/tools/maven/apache-maven-3.3.3 /opt/maven
ln -sfv /opt/mysql /d/tools/MySQL/MySQL5.6

#software
apt-get install file
apt-get install tig

!<<aaa
#filter ~
    bidx=`expr index $rcfile "~"`
    if [ $bidx -gt 0 ];then
        rcfile=`expr substr "$rcfile" 1 $((bidx-1))`
    fi
aaa
