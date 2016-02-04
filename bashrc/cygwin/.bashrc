# .bashrc
export APPDATA="$D/node"
#env
export LANG="zh_CN.UTF-8"
#import alias
if [ -f "${HOME}/.bash_alias" ]; then
  source "${HOME}/.bash_alias"
fi
#import path setting
if [ -f "${HOME}/.bash_path" ]; then
        . "${HOME}/.bash_path"
fi
#import ssh server
if [ -f "${HOME}/.bash_srv" ]; then
        . "${HOME}/.bash_srv"
fi
#import redis
if [ -f "${HOME}/.bash_redis" ]; then
        . "${HOME}/.bash_redis"
fi

#ssh server
declare -i sshdcnt=`ps -ef|grep sshd|wc -l`
declare -i sshdstartcnt=1
if [ $sshdcnt -lt $sshdstartcnt ]; then
	net start sshd|iconv -f gbk -t utf-8
fi

# gbk -> utf-8
alias gu='iconv -f gbk -t utf-8'
alias ifconfig='ipconfig|gu'
alias c='echo -e "\E[2J"'

#settings
# Don't use ^D to exit
set -o ignoreeof

#export PS1="\[\033]0;$PWD\007\]
PHIP=`ipconfig|gu|grep '以太网适配器 本地连接:' -A 4|grep IPv4|awk '{print $16}'`
#PHIP=`ipconfig|gu|grep 本地连接 -A 4|grep IPv4|awk '{print $14}'`
export PS1="\[\033]0;$PHIP\007\]
\[\033[32m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\]  \[\033[32m\]\w\[\033[0m\]
\[\033[32m\][\u.$PHIP]\[\033[0m\]"
#\[\033[32m\][\u@`/sbin/ifconfig eth0 | sed -n '0,/^\s\+inet addr:\([0-9]\+[.][0-9]\+[.][0-9]\    +[.][0-9]\+\).*$/s//\1/p'`]\[\033[0m\]  "
#export PS1="\[\e]2;\u@\H \w\a\e[32;1m\]>\[\e[0m\]"

#[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Default to human readable figures
#
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func
