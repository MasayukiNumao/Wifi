#!/bin/sh
sudo ifconfig wap0 down
sudo iwconfig wap0 mode monitor
sudo ifconfig wap0 up
