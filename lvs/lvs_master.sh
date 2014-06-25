#!/bin/bash
#echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/' /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
IPVSADM='/sbin/ipvsadm'
TELVIP=115.238.225.84
CNCVIP=101.64.177.12
#APP1=58.215.49.158
#APP2=58.215.49.159
TELWEB1=115.238.225.85
TELWEB2=115.238.225.86
TELGW=115.238.225.81
CNCWEB1=101.64.177.13
CNCWEB2=101.64.177.14
CNCGW=101.64.177.9
#route add -host $VIP dev em2
$IPVSADM -C
$IPVSADM -A -t $TELVIP:80 -s wrr -p 900
$IPVSADM -a -t $TELVIP:80 -r $TELWEB1:80 -g
$IPVSADM -a -t $TELVIP:80 -r $TELWEB2:80 -g
$IPVSADM -A -t $CNCVIP:80 -s wrr -p 900
$IPVSADM -a -t $CNCVIP:80 -r $CNCWEB1:80 -g
$IPVSADM -a -t $CNCVIP:80 -r $CNCWEB2:80 -g
$IPVSADM --set 65 10 10

