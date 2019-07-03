#!/usr/bin/env bash

set -eo &> /dev/null

icon_color="DarkOliveGreen"
icon_file_name="test"

printf "\nEnter text to show on the icon: "
read icon_text

printf "\nEnter color for the icon (choices: DarkOliveGreen): "
read icon_color


for pointsize in {48,54,60,62,64,66,68,70,72, 74, 76, 78, 80}; do
  convert -size 200x200 -pointsize ${pointsize} -gravity center -background ${icon_color} -font FuturaBTMediumCondensed -fill white label:"${icon_text}" temp.png
  convert temp.png \
    \( +clone -crop 41x41+0+0  -fill white -colorize 100% \
       -draw 'fill black circle 40,40 40,0' \
       -background ${icon_color}  -alpha shape \
       \( +clone -flip \) \( +clone -flop \) \( +clone -flip \) \
     \) -flatten  $(echo "${icon_text}" | tr '[:upper:]' '[:lower:]')_${pointsize}pt-$(echo "${icon_color}" | tr '[:upper:]' '[:lower:]').png
done && rm temp.png
