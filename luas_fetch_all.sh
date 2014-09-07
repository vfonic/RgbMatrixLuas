#!/bin/bash
/usr/bin/curl -s http://www.luas.ie/luaspid.html\?get\=Windy%20Arbour > /home/pi/scripts/luas_times_new.html
mv /home/pi/scripts/luas_times_new.html /home/pi/scripts/luas_times.html
