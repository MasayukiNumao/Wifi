#!/bin/bash --
sqlite3 /home/pi/wifi.db << "EOF"
.mode html
select strftime('%Y-%m-%d %H:%M:00',datetime(time,'unixepoch','localtime')) as lt, count(distinct mac1), group_concat(distinct mac1) 
from wifilog 
group by strftime('%Y%m%d%H%M',datetime(time,'unixepoch','localtime')) 
order by lt desc limit  20;
EOF
