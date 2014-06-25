#!/bin/sh
while true
        do
        netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
        lsof -i:34346 | grep ESTABLISHED | wc -l
        sleep 10
done


