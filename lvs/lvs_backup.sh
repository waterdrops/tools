#/bin/bash
#echo 0 > /proc/sys/net/ipv4/ip_forward
sed -i 's/net.ipv4.ip_forward = 1/net.ipv4.ip_forward = 0/' /etc/sysctl.conf
sysctl -p
/sbin/ipvsadm -C

