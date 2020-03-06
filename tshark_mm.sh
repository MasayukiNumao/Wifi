#!/bin/sh
sudo tshark -S -I -i wlan1 -Y'wlan.fc.type_subtype eq 4'


