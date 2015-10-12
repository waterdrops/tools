#create by zhuxiaorong at 20140909
#for exec some linux command for bat
#error code:3
scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf

if [ "$1" = '' ] || [ "$2" = '' ] || [ "$3" = '' ] || [ "$4" = '' ];then
        echo "please exec 'bash scpbat.sh [1]platid[1=IOS,2=ad] [2]zone_id[143=360,999=uc,998=baidu,0=all] [3]master,slave [4]os_command"
        exit 1
fi

bash ${scriptpath}bash_server.sh $1 $2 $3

ret=$?
if [ $ret = 1 ]; then
    echo "bash_server.sh is error !!!!!!!!!"
        exit 1
fi

for ip in `cat ${scriptpath}iplist|sort`
do
    ssh -i ${scpkey} -o StrictHostKeyChecking=no ${scpuser}@${ip} "$4 &&  echo 'exec ${ip} OK!' || echo 'exec  ${ip} error,please check!'" &
done

wait

echo "all '$4' exec over,please check!!!"

