#!/bin/sh
sudo tshark -S -I -i wlan1 -Y'wlan.fc.type_subtype eq 4' -T fields -E separator=',' -e frame.number -e frame.time_epoch -e wlan.sa_resolved -e wlan.sa -e wlan.seq -e radiotap.dbm_antsignal -e radiotap.antenna -e radiotap.channel.freq -e radiotap.datarate
