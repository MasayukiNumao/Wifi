#!/bin/sh
#
# startWifiProcess.sh
#
# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi
date > s0.sav
#if [  -f wifi.db ]; then
#  mv wifi.db wifi.`date +%m%d%Y_%H%M%S`
#fi
#./sqlite_createdb.sh
sleep 2
#
sudo /root/wifi_mm_setup.sh
#
if [ ! -p /tmp/nmdpipe ]; then
  mkfifo /tmp/nmdpipe
  chmod a+wr /tmp/nmdpipe
fi
#
sudo /root/tshark_mm1.sh > /tmp/nmdpipe &
#
date > s1.sav
#sleep 1
#fluentd -c ./fluent/fluent.conf &
#
#date > s2.sav
exit 0
