#!/bin/bash

#directory exist
function isdir()
{
    #$1 dirpath
    if [ ! -d "$1" ]; then
        return 1
    else
        return 0
    fi
}

!<<aaa
isdir /home/mobaxterm/bin/li
if [ "$?" = "0" ]; then
    echo 'dir exist'
else
    echo 'not exist'
fi
aaa

#-x 文件存在，且可执行
function isfile()
{
    if [ ! -d "$1" ]; then
        return 0
    else
        return 1
    fi
}

!<<aaa
isfile "/home/mobaxterm/bin/lib/file.sh"
if [ "$?" = "0" ]; then
    echo 'file exist'
else
    echo 'not exist'
fi
aaa

!<<aaa
-a file exists.
-b file exists and is a block special file.
-c file exists and is a character special file.
-d file exists and is a directory.
-e file exists (just the same as -a).
-f file exists and is a regular file.
-g file exists and has its setgid(2) bit set.
-G file exists and has the same group ID as this process.
-k file exists and has its sticky bit set.
-L file exists and is a symbolic link.
-n string length is not zero.
-o Named option is set on.
-O file exists and is owned by the user ID of this process.
-p file exists and is a first in, first out (FIFO) special file or
named pipe.
-r file exists and is readable by the current process.
-s file exists and has a size greater than zero.
-S file exists and is a socket.
-t file descriptor number fildes is open and associated with a
terminal device.
-u file exists and has its setuid(2) bit set.
-w file exists and is writable by the current process.
-x file exists and is executable by the current process.
aaa


