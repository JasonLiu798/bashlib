#use full scripts
this  repositoriy contain some useful bash scripts and functions

#bashrc
##.bash_alias*
contain some useful command alias
##.bash_path*
contain some variable of path
##.bashrc*
my bashrc setting
##cmdrc.bat
windows cmd auto run script
usage,change `D:\yp\project\shell\share\bashrc\cmdrc.bat` to your `cmdrc.bat` location,and run these command in your cmd.
```
reg add "HKLM\Software\Microsoft\Command Processor" /v "AutoRun" /t REG_SZ /d "D:\yp\project\shell\share\bashrc\cmdrc.bat" /f
```
#*.init.sh
environment init

#lib
##const.sh
some constant
##datafile.sh
functions for process config files.
use `~/bin/data/servers.dat` config for example:
servers.dat
```
serv123 192.168.1.100 22 user1 abc123
serv124 192.168.1.101 22 user1 abc123
serv125 192.168.1.102 22 user1 abc123
....
```
fields:
```
01 serv123: server name
02 192.168.1.100: server ip
03 22: server port
04 user1: server user
05 abc123: server user's password
```
filed 01 is the $1
todo:custom separate
##ftp.sh
ftp functions
##ip.sh
ip 2 location functions
##random.sh
random num,ip,md5 generator
##redis.sh
batch redis function
##str.sh
string funtions

#other file
##gen_bash_srv.sh
read server.dat,generate ssh login alias
##mklib.sh
`cat` all lib file into one file `~/bin/lib.sh`,then you can only import one file and use all functions,example:
`source ~/bin/lib.sh`
##bauth
batch ssh-copy-id of servers in `~/bin/data/servers.dat`
##scps
super ssh,first you have run bauth,complete no password login
download file: 
    `$ARG0 jmp:/data/home/file localfile`
download file: 
    `$ARG0 jmp:/data/home/file`
upload file:   
    `$ARG0 file jmp:/data/home`
upload file to default folder:  
    `$ARG0 file jmp`
##db.sh
mysql single sql execute tool.
##dbs.sh
mysql batch sql execute tool.


#dependency
lib
    mklib
        ~/bin/data/servers.dat
            bauth
                scps
    ~/bin/data/db.dat
        db.sh
        dbs.sh









