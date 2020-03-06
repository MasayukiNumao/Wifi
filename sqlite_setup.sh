#!/bin/bash --
sqlite3 /home/pi/Save/wifi.db << "EOF"
CREATE TABLE wifilog (
no integer,
time timestamp,
mac1 text,
mac2 text,
seq integer,
rssi1 integer,
freq integer,
rate integer);
EOF
