scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf
serverlist=${scriptpath}serverlist

rm -rf ${serverlist}
rm -rf ${scriptpath}iplist

if [ "$1" = '' ] || [ "$2" = '' ] ;then
    echo "!!!please exec 'bash bash_server.sh [1]plat_id[0] [2]zone_id[0] [3]master,slave!!!"
    exit 1
fi

if [ "$1" = "0" ] && [ "$2" -ne "0" ]; then
    echo "!!!please exec 'bash server.sh [1]plat_id[1:IOS,2:ad,0:all] [2]zone_id[143,998,999] [3]master,slave!!!
    can't to this server_id!!!"
    exit 1
fi

if [ "$3" != 'master' ] && [ "$3" != 'slave' ] ;then
        echo "[3] mast be master or slave"
                exit 1
fi

if [ "$1" = "0" ] && [ "$2" = "0" ]; then
    echo "dblist=(">${serverlist}
    $mysqlbin -h$dwhost -u$dbuser -p$dbpass -D $dwname -N -e "select concat('\"',dbname,':',SerID,':',depict,':',ip,':',ifnull(slave_ip,''),':',ifnull(slave_port,''),'\"') from serverlist a where a.status=1" >>${serverlist}
        echo ")">>${serverlist}
fi

if [ "$1" -ne "0" ] && [ "$2" = "0" ]; then
    echo "dblist=(">${serverlist}
    $mysqlbin -h$dwhost -u$dbuser -p$dbpass -D $dwname -N -e "select concat('\"',dbname,':',SerID,':',depict,':',ip,':',ifnull(slave_ip,''),':',ifnull(slave_port,''),'\"') from serverlist a where a.status=1 and plat_id=$1" >>${serverlist}
        echo ")">>${serverlist}
fi

if [ "$1" -ne "0" ] && [ "$2" != "0" ]; then
    echo "dblist=(">${serverlist}
    $mysqlbin -h$dwhost -u$dbuser -p$dbpass -D $dwname -N -e "select concat('\"',dbname,':',SerID,':',depict,':',ip,':',ifnull(slave_ip,''),':',ifnull(slave_port,''),'\"') from serverlist a where a.status=1 and plat_id=$1 and zone_id=$2" >>${serverlist}
        echo ")">>${serverlist}
fi

if [ "$3" = 'master' ] ;then
        cat ${serverlist} |grep -v "("|grep -v ")"|cut -d: -f4|cut -d'"' -f1|sort|uniq >${scriptpath}iplist
fi

if [ "$3" = 'slave' ] ;then
        cat ${serverlist} |grep -v "("|grep -v ")"|cut -d: -f5|cut -d'"' -f1|sort|uniq >${scriptpath}iplist
fi

