#create by zhuxiaorong at 20140909
#for scp
#error code:2
scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf
rm -rf ${scriptpath}log

if [ "$1" = '' ] || [ "$2" = '' ] || [ "$3" = '' ] || [ "$4" = '' ] || [ "$5" = '' ] ;then
        echo "please exec 'bash scpbat.sh [1]platid[1=IOS,2=ad] [2]zone_id[143=360,999=uc,998=baidu,0=all] [3]master,slave [4]sourcefile [5]mudipath and filename ] "
        exit 1
fi

if [ -f $4 ] && [ -f '${scriptpath}$4' ]; then
    echo "error,no sourefile!!!!"
        exit 1
fi

bash ${scriptpath}bash_server.sh $1 $2 $3

ret=$?
if [ $ret = 1 ]; then
    echo "bash_server.sh is error !!!!!!!!!"
        exit 1
fi

for ip in `cat ${scriptpath}iplist`
do
        c1=0
        while [ $c1 -lt 3 ]
        do
echo $ip
            scp -i ${scpkey} -o StrictHostKeyChecking=no $4 ${scpuser}@${ip}:$5
                md5_l=`md5sum ${4} | cut -d' ' -f1`
                md5_r=`ssh -i ${scpkey} -o StrictHostKeyChecking=no ${scpuser}@${ip} "md5sum $5 | cut -d' ' -f1"`
                if [ "$md5_l" != "$md5_r" ];then
                        scp -i ${scpkey} -o StrictHostKeyChecking=no $4 ${scpuser}@${ip}:$5
                else
                        c1=10
                fi
                c1=`expr $c1 + 1`
        done

        if [ $c1 -lt 10 ] ; then
                echo 'check sqlfile md5 false at ${ip},script stoped,please check!'  && echo "scp at ${ip} error" >>${scriptpath}log
                exit 1
        fi
done

