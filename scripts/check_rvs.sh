#!/bin/sh
source /etc/profile

check(){
        HOST=127.0.0.1
        URL=http://$HOST:8089/health
        CHECK=`/usr/bin/curl -s --connect-timeout 2 $URL`
        DATE=`date`

        if [[ $CHECK == "PAGE OK" ]]
                then
                RESULT=1
        else
                RESULT=0
                check_java
                STAT2=`cat /tmp/rvs_restart`
                if [[ $STAT2 == "0" ]]
                        then
                        restart
                else
                        exit 0
                fi
        fi
        echo $DATE $RESULT >> /data/log/mule/rvs_check.log
}

restart(){
        echo 1 > /tmp/rvs_run
        /opt/scripts/mule_restart.sh
        echo 0 > /tmp/rvs_run
}

judge(){
        STAT=`cat /tmp/rvs_run`
        if [[ $STAT == "1" ]]
                then
                exit 0
        else
                check
        fi

}

check_java(){
        STAT3=`netstat -ntlp | grep 32000 | awk '{print $1}'`
        STAT4=`netstat -ntlp | grep 8089 | awk '{print $1}'`
        if [[ $STAT3 == "tcp" ]]
                then
                if [[ $STAT4 == "tcp" ]]
                        then
                        echo 0 > /tmp/rvs_restart
                else
                        echo 1 > /tmp/rvs_restart
                fi
        else
                echo 0 > /tmp/rvs_restart
        fi
}

main(){
        judge
}

main

