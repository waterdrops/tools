#!/bin/bash

# Author: Urchin
# Date: 2014-06-10
# Version: 1.0.3
# Description: add ftp user
# Version: 1.0.4
# add some conditional
USER=$1
APPLICANT=$2
PASS=$(openssl rand -base64 10|tr -dc _A-Z-a-z-0-9)
DST=/data/ftproot/
OWN=ftpuser
GRP=ftpgroup
num=$#

RES=$(mysql -sN -uroot -pPopcap@2012 -e "select User from ftpusers.users where user = '$USER';")
add_user() {
if [ $num -lt 2 ]
then
        echo "Useage: ./add_ftp.sh <username> <applicant> "
else
        [ -d $DST$USER ] || mkdir -pv $DST$USER

        chown -R $OWN:$GRP $DST$USER
	[ -d /opt/pureftpd ] || mkdir -pv /opt/pureftpd
        #mysql -sN -uroot -pPopcap@2012 -e "select User from ftpusers.users where user = '$USER';" &>/dev/null || mysql  -uroot -pPopcap@2012 -e "insert into ftpusers.users values('$USER',md5('$PASS'),504,504,'/data/ftproot/$USER',-1,51200,2000,2000,'*','from $APPLICANT','1',0,0);"
	if [ "$RES" == "$USER" ];then
	   echo -e "$USER already exists."
	else
	   mysql  -uroot -pPopcap@2012 -e "insert into ftpusers.users values('$USER',md5('$PASS'),504,504,'/data/ftproot/$USER',-1,51200,2000,2000,'*','from $APPLICANT','1',0,0);"
           [ $? -ne 0 ] && echo -e "something goes wrong!" || echo -e "Account:$USER\nPassword:$PASS" >>/opt/pureftpd/ftpuser_info.txt 
	fi

fi
[ "$RES" == "$USER" ] || echo -e "Account:$USER\nPassword:$PASS"
}
add_user
