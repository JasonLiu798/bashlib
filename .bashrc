#!/bin/bash
export LANG="zh_CN.UTF-8"
#import alias
#ln -sfv /d/yp/project/shell/share/bashrc/.bash_alias_linux .bash_alias
if [ -f "${HOME}/.bash_alias" ]; then
        . "${HOME}/.bash_alias"
fi
#import path setting
#ln -sfv /d/yp/project/shell/share/bashrc/.bash_path_win .bash_path
if [ -f "${HOME}/.bash_path" ]; then

        . "${HOME}/.bash_path"
fi
#import ssh server
#before:gen_bash_srv.sh
if [ -f "${HOME}/.bash_ssh" ]; then
    source ${HOME}/.bash_ssh
fi

#PHIP=`ipconfig|grep 以太网适配器 -A 4|grep IPv4|awk '{print $16}'`
#PHIP=`ifconfig |grep -A 2 Realtek |grep -a inet| awk '{print $2}'|awk -F: '{print $2}'`
PS1='\[\033]0;\h-$PWD\007\]
\[\033[36m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\]  \[\033[36m\]\w\[\033[0m\]
\[\033[36m\][\u.\h]\[\033[0m\]  '

# .bashrc
#vi
alias vi='vim'
alias lvi="vim -c \"normal '0\"" #latest used
alias c='clear'
alias wl='ll | wc -l'
alias typea='type -a'
alias hg='history|grep'
alias netp='netstat -tulanp'
alias tf='tail -f '
alias hl='grep -P --color -C 10000' #highlight

#system
alias psg='ps aux | grep -v grep | grep -i --color'
alias psj='ps -ef|grep -v grep | grep --color java'
alias k9='kill -9'
psid() {
  [[ ! -n ${1} ]] && return;   # bail if no argument
  pro="[${1:0:1}]${1:1}";      # process-name –> [p]rocess-name (makes grep better)
  ps axo pid,user,command | grep -v grep |grep -i --color ${pro};   # show matching processes
  pids="$(ps axo pid,user,command | grep -v grep | grep -i ${pro} | awk '{print $1}')";   # get pids
  complete -W "${pids}" kill9     # make a completion list for kk
}
alias gu='iconv -f gbk -t utf-8'

#file system
alias ls='ls -hF --color=tty'
alias ll='ls -lh --color'
alias la='ls -alh --color'
alias vdir='ls --color=auto --format=long'
alias p='pwd'
alias l='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
cdl() { cd "$@" && pwd ; ls -al; }
alias ..="cdl .."
alias ...="cd ../.."   # 快速进入上上层目录
alias .3="cd ../../.."
alias cd..='cdl ..'
mcd() { mkdir -p $1 && cd $1 && pwd ; } # mkdir -p + cd
alias df='df -h'
alias du='du -h'

#grep
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}



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
