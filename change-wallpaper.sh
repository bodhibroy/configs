#! /bin/bash
WALLPAPERS="/usr/share/backgrounds"
ALIST=( `ls -w1 $WALLPAPERS` )
RANGE=${#ALIST[@]}
let "number = $RANDOM"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last
nitrogen --set-scaled --save $WALLPAPERS/${ALIST[$number]}

# add the following line to cronjob to change wallpaper every 5 mins
# */5 * * * * ~/.change-wallpaper.sh 
