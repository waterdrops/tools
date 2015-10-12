#----------------
#db_update.sh
#----------------
#create by zhuxiaorong at 20140909
#for exec dbscript!!!!for update only for master
scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf

tmpfile=/home/mysql/db_update_tmp.sql

if [ "$1" = '' ] || [ "$2" = '' ] || [ "$3" = '' ] || [ "$4" = '' ] ;then
        echo "please exec 'bash db_update.sh [1]platid[1=IOS,2=ad] [2]zone_id[0:all] [3]master,slave [4]dbscriptfile"
        exit 1
fi

if [ -f $4 ] && [ -f '${scriptpath}$4' ]; then
    echo "error,no script!!!!"
        exit 1
fi

bash ${scriptpath}os_exec.sh $1 $2 $3 "rm -rf ${tmpfile}"

ret=$?
if [ $ret = 1 ]; then
    echo "scpbat.sh is error !!!!!!!!!"
        exit 1
fi

bash ${scriptpath}scpbat.sh $1 $2 $3 $4 ${tmpfile}

ret=$?
if [ $ret = 1 ]; then
    echo "scpbat.sh is error !!!!!!!!!"
        exit 1
fi


source ${scriptpath}serverlist

#UPDATE DATABASE
i=0
n=${#dblist[*]}
while [ $i -lt $n ]
do
        dbname=`echo ${dblist[$i]} | cut -d: -f1`
        sid=`echo ${dblist[$i]} | cut -d: -f2`
        if [ "$3" = 'master' ] ;then
        ip=`echo ${dblist[$i]} | cut -d: -f4`
            dbport=3306
        fi
        if [ "$3" = 'slave' ] ;then
        ip=`echo ${dblist[$i]} | cut -d: -f5`
            dbport=`echo ${dblist[$i]} | cut -d: -f6`
        fi

        echo "update group ${dbanme} $3"
        ssh -i ${scpkey} -o StrictHostKeyChecking=no ${scpuser}@${ip} "${mysqlbin} -f -u${dbuser} -p${dbpass} -h${ip} -P${dbport} -D$dbname<${tmpfile} &&  echo 'update ${ip}${dbname} OK!' || echo 'update ${ip}${dbname} error,please check!'" &
        i=`expr $i + 1`
done

wait

echo "all update finished!"

