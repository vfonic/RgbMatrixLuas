#!/bin/bash
curl --silent "http://www.luas.ie/luaspid.html?get=Windy%20Arbour" \
| grep Brides | sed -E 's#[^B]+Brides Glen</div><div class="time">([0-9]+|DUE)([^B]+Brides Glen</div><div class="time">([0-9]+|DUE))?.*#\1 \3#' \
| sed -E 's/^ *| *$//'
