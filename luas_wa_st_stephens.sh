#!/bin/bash
#curl --silent "http://www.luas.ie/luaspid.html?get=Windy%20Arbour" \
cat /home/pi/scripts/luas_times.html \
| grep Stephen | sed -E 's#[^S]+St. Stephen.s Green</div><div class="time">([0-9]+|DUE)([^S]+St. Stephen.s Green</div><div class="time">([0-9]+|DUE))?.*#\1 \3#' \
| sed -E 's/^ *| *$//'
