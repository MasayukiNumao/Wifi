#!/bin/bash --
sqlite3 /home/pi/wifi.db << "EOF"
.mode html
select mac1, count(mac1) as cnt,max(rssi1), min(strftime('%Y-%m-%d %H:%M:00',datetime(time,'unixepoch','localtime'))),max(strftime('%Y-%m-%d %H:%M:00',datetime(time,'unixepoch','localtime')))  
from wifilog group by mac1 order by cnt desc
limit 20;
EOF
