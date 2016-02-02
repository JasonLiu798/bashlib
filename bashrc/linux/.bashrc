#!/bin/bash
export LANG="zh_CN.UTF-8"

#ip
ETH0IP=`/sbin/ifconfig eth0 | sed -n '0,/^\s\+inet addr:\([0-9]\+[.][0-9]\+[.][0-9]\+[.][0-9]\+\).*$/s//\1/p'`
export PS1="\[\033]0;$ETH0IP\007\]
\[\033[32m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\]  \[\033[32m\]\w\[\033[0m\]
\[\033[31m\][\u@$ETH0IP]\[\033[0m\]  "

