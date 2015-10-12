###############################################
#########     create gamedb            ########
#########create by zhuxiaorong/20140902########
###############################################
#!/bin/bash

scriptpath=`dirname $0`
cd ${scriptpath}
scriptpath=`pwd`/
source ${scriptpath}sys.conf

rm -rf ${scriptpath}check_df
rm -rf ${scriptpath}mail_txt
rm -rf ${scriptpath}mysql_slave

#df
for ip in `$mysqlbin dba -u${dbuser} -p${dbpass} -N -e "select distinct slave_ip from dba.serverlist where status='1' union all select distinct IP from dba.serverlist where status='1';"`
do
    ssh -i ${scpkey} -o StrictHostKeyChecking=no ${ip} "df -lh|sed '1d'|sed 's/^/$ip /g'" >>${scriptpath}check_df && echo ${ip} &
done

wait

cat ${scriptpath}check_df|awk NF==6|awk '{print $1,$5,$6}'|sed s/%//g|awk '{if($2>80) print $1,$3,"used",$2"%"}'>>${scriptpath}mail_txt
cat ${scriptpath}check_df|awk NF==7|awk '{print $1,$6,$7}'|sed s/%//g|awk '{if($2>80) print $1,$3,"used",$2"%"}'>>${scriptpath}mail_txt

#mysql进程
$mysqlbin  -u${dbuser} -p${dbpass} dba -N -e "select distinct slave_ip,slave_port from dba.serverlist where status='1' union all select distinct IP,slave_port from dba.serverlist where status='1';" | while read ip port
do
    tt=`/opt/mysql/bin/mysqladmin -h$ip -u$dbuser -p$dbpass -P${port} ping|wc -l`
    if [ "$tt" = 0 ] ;then
        echo "ERROR:$ip $port mysql is not running!!!!!!">>${scriptpath}mail_txt
    fi
done

#mysql slave
for ip in `$mysqlbin  -u${dbuser} -p${dbpass} dba -N -e "select distinct slave_ip from dba.serverlist where status='1' union all select distinct IP from dba.serverlist where status='1';" `
do
    for port in `$mysqlbin  -u${dbuser} -p${dbpass} dba -N -e "select distinct slave_port from (select distinct slave_ip,slave_port from dba.serverlist where status='1' union all select distinct IP,slave_port from dba.serverlist where status='1') a where slave_ip='$ip'"`
    do
        ssh -i ${scpkey} -o StrictHostKeyChecking=no ${ip} "$mysqlbin -h$ip -u$dbuser -p$dbpass -P${port} -e 'show slave status\G'|grep \"Running:\|Seconds_Behind_Master\"|sed 's/^/$port /g'|sed 's/^/$ip /g'" >>${scriptpath}mysql_slave &
done
done

wait

cat ${scriptpath}mysql_slave|grep ": No" >> ${scriptpath}mail_txt
cat ${scriptpath}mysql_slave|grep ": Connecting" >> ${scriptpath}mail_txt
cat ${scriptpath}mysql_slave|grep ": NULL" >> ${scriptpath}mail_txt
cat mysql_slave|grep Seconds_Behind_Master|awk -F: '{if ($2 >= 360) { print $0 }}' >> ${scriptpath}mail_txt

errortxt=`cat ${scriptpath}mail_txt`
if [ "$errortxt" != '' ];then
      cd /opt/script/pushmail/ && ./push_mail.py "PVZ2 IOS ucloud ERROR" 'dwmonitor@163.com' 'biexa@popcap.com' "Error info: ${errortxt}"
fi


