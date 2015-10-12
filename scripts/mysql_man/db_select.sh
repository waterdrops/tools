#db_select_master脚本：
#create by zhuxiaorong at 20140909
#for exec dbscript!!!!for update only for master
scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf
scppath=/home/mysql/

tmpfile=${scppath}db_select_tmp.sql
outfile=/home/mysql/output

rm -rf ${outfile}
rm -rf /home/mysql/Game*

if [ "$1" = '' ] || [ "$2" = '' ] || [ "$3" = '' ] || [ "$4" = '' ] ;then
        echo "please exec 'bash db_select.sh [1]platid[1=IOS,2=ad] [2]zone_id[0:all] [3]master,slave [4]dbscriptfile"
        exit 1
fi

if [ -f $4 ] && [ -f '${scriptpath}$4' ]; then
    echo "error,no script!!!!"
        exit 1
fi

bash ${scriptpath}os_exec.sh $1 $2 $3 "rm -rf ${tmpfile}"

ret=$?
if [ $ret = 1 ]; then
    echo "os_exec.sh is error !!!!!!!!!"
        exit 1
fi

bash ${scriptpath}scpbat.sh $1 $2 $3 $4 ${tmpfile}

ret=$?
if [ $ret = 1 ]; then
    echo "scpbat.sh is error !!!!!!!!!"
        exit 1
fi

source ${scriptpath}serverlist

#select DATABASE
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

    ssh -i ${scpkey} -o StrictHostKeyChecking=no ${scpuser}@${ip} "rm -rf ${scppath}${dbname}.tmp && ${mysqlbin} -u${dbuser} -p${dbpass} -D$dbname -h${ip} -P${dbport} -N -e\"\`cat ${tmpfile}\`\" >${scppath}${sid}.tmp && scp -i ${scpkey} -o StrictHostKeyChecking=no ${scppath}${sid}.tmp ${scpuser}@${dwhost}:${scppath} ;echo 'select ${dbname} OK!' || echo 'select ${dbname} error,please check'" &
        i=`expr $i + 1`
done

wait


i=0
n=${#dblist[*]}
while [ $i -lt $n ]
do
        sid=`echo ${dblist[$i]} | cut -d: -f2`
        sed -i -e s/^/${sid}\\\t/g ${scppath}${sid}.tmp
        cat ${scppath}${sid}.tmp >> ${outfile} 2>/dev/null
#        rm -rf ${scppath}${sid}.tmp
        i=`expr $i + 1`
done

echo "all select finished!,please check ${outfile}"


