#!/bin/bash
while true
do
  bridesglen=`/home/pi/scripts/luas_wa_bridesglen.sh`
  ststephens=`/home/pi/scripts/luas_wa_st_stephens.sh`
  regex="[0-9A-Z]{1,3} [0-9]{1,2}"
  if [[ "$ststephens" =~ ($regex) ]]
  then
    if [[ "$bridesglen" =~ ($regex) ]]
    then
      sudo /home/pi/display16x32/luas/luas 2 $ststephens 2 $bridesglen
    elif [[ $bridesglen ]]; then
      sudo /home/pi/display16x32/luas/luas 2 $ststephens 1 $bridesglen
    else
      sudo /home/pi/display16x32/luas/luas 2 $ststephens 0
    fi
  elif [[ $ststephens ]]; then
    if [[ "$bridesglen" =~ ($regex) ]]
    then
      sudo /home/pi/display16x32/luas/luas 1 $ststephens 2 $bridesglen
    elif [[ $bridesglen ]]; then
      sudo /home/pi/display16x32/luas/luas 1 $ststephens 1 $bridesglen
    else
      sudo /home/pi/display16x32/luas/luas 1 $ststephens 0
    fi
  else
    if [[ "$bridesglen" =~ ($regex) ]]
    then
      sudo /home/pi/display16x32/luas/luas 0 2 $bridesglen
    elif [[ $bridesglen ]]; then
      sudo /home/pi/display16x32/luas/luas 0 1 $bridesglen
    else
      sudo /home/pi/display16x32/luas/luas 0 0
    fi
  fi
 # sleep 5
done
