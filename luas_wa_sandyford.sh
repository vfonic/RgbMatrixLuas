#!/bin/bash
# cat mock.html
curl --silent "http://www.luas.ie/luaspid.html?get=Windy%20Arbour" \
| grep Sandyford | sed -E 's/[^O]+//' | sed -E 's#[^S]+Sandyford</div><div class="time">([0-9]+|DUE)([^S]+Sandyford</div><div class="time">([0-9]+|DUE))?.*#\1 \3#' \
| sed -E 's/^ *| *$//'
