TELVIP=115.238.225.84
CNCVIP=101.64.177.12
. /etc/rc.d/init.d/functions
case "$1" in
start)
       ifconfig lo:0 $TELVIP netmask 255.255.255.255 broadcast $TELVIP
       ifconfig lo:1 $CNCVIP netmask 255.255.255.255 broadcast $CNCVIP
       /sbin/route add -host $TELVIP dev lo:0
       /sbin/route add -host $TELVIP dev lo:1
       echo "1" >/proc/sys/net/ipv4/conf/lo/arp_ignore
       echo "2" >/proc/sys/net/ipv4/conf/lo/arp_announce
       echo "1" >/proc/sys/net/ipv4/conf/all/arp_ignore
       echo "2" >/proc/sys/net/ipv4/conf/all/arp_announce
       sysctl -p >/dev/null 2>&1
       echo "RealServer Start OK"
       ;;
stop)
       ifconfig lo:0 down
       ifconfig lo:1 down
       route del $TELVIP >/dev/null 2>&1
       route del $CNCVIP >/dev/null 2>&1
       echo "0" >/proc/sys/net/ipv4/conf/lo/arp_ignore
       echo "0" >/proc/sys/net/ipv4/conf/lo/arp_announce
       echo "0" >/proc/sys/net/ipv4/conf/all/arp_ignore
       echo "0" >/proc/sys/net/ipv4/conf/all/arp_announce
       echo "RealServer Stoped"
       ;;
*)
       echo "Usage: $0 {start|stop}"
       exit 1
esac
exit 0

