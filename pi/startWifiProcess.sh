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
if [  -f wifi.db ]; then
  mv wifi.db wifi.`date +%m%d%Y_%H%M%S`
fi
bash /home/pi/sqlite_createdb.sh
#
#./wifi_mm_setup.sh
#
if [ ! -p /tmp/nmdpipe ]; then
  mkfifo /tmp/nmdpipe
fi
#
#./tshark_mm1.sh > /tmp/nmdpipe &
#
date > s1.sav
#sleep 1
/home/pi/.rbenv/shims/fluentd -c /home/pi/fluent/fluent.conf -o /home/pi/fluent/fluent.log &
#
date > s2.sav
exit 0
