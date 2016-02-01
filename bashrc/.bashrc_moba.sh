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
if [ -f "${HOME}/.bash_srv" ]; then
    #

    source ${HOME}/.bash_srv
fi

#PHIP=`ipconfig|grep 以太网适配器 -A 4|grep IPv4|awk '{print $16}'`
#PHIP=`ifconfig |grep -A 2 Realtek |grep -a inet| awk '{print $2}'|awk -F: '{print $2}'`
PS1='\[\033]0;\h-$PWD\007\]
\[\033[36m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\]  \[\033[36m\]\w\[\033[0m\]
\[\033[36m\][\u.\h]\[\033[0m\]  '

