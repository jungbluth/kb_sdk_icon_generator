#!/usr/bin/env bash

set -eo &> /dev/null

function banner(){
  printf " _  ______                   ____  ____  _  __     _                  ___                  ____                           _             \n"
  printf "| |/ / __ )  __ _ ___  ___  / ___||  _ \| |/ /    / \   _ __  _ __   |_ _|___ ___  _ __   / ___| ___ _ __   ___ _ __ __ _| |_ ___  _ __ \n"
  printf "| ' /|  _ \ / _  / __|/ _ \ \___ \| | | | ' /    / _ \ | '_ \| '_ \   | |/ __/ _ \| '_ \ | |  _ / _ \ '_ \ / _ \ '__/ _  | __/ _ \| '__|\n"
  printf "| . \| |_) | (_| \__ \  __/  ___) | |_| | . \   / ___ \| |_) | |_) |  | | (_| (_) | | | || |_| |  __/ | | |  __/ | | (_| | || (_) | |   \n"
  printf "|_|\_\____/ \__,_|___/\___| |____/|____/|_|\_\ /_/   \_\ .__/| .__/  |___\___\___/|_| |_| \____|\___|_| |_|\___|_|  \__,_|\__\___/|_|   \n"
  printf "                                                       |_|   |_|                                                                        \n"
}


banner | lolcat

printf "\nKBase App Icon Generator - v1.0 - author: Sean Jungbluth\n"

printf "\nEnter text to show on the icon: "
read icon_text

printf "\nEnter color for the icon (choices: blue, pink, purple, green, yellow, red, light-blue, aqua): "
read icon_color


if [ ${icon_color} = "pink" ]; then
  icon_color_input="#D16197"
elif [ ${icon_color} = "blue" ]; then
  icon_color_input="#0A71A7"
elif [ ${icon_color} = "purple" ]; then
  icon_color_input="	#6239B3"
elif [ ${icon_color} = "green" ]; then
  icon_color_input="#328031"
elif [ ${icon_color} = "yellow" ]; then
  icon_color_input="#E6B74D"
elif [ ${icon_color} = "red" ]; then
  icon_color_input="#9C1D22"
elif [ ${icon_color} = "light-blue" ]; then
  icon_color_input="#74B8DC"
elif [ ${icon_color} = "aqua" ]; then
  icon_color_input="#23877D"
else
  echo "Could not detect input color - defaulting to blue."
  icon_color_input="#0A71A7"
fi



for pointsize in {48,54,60,62,64,66,68,70,72,74,76,78,80}; do
  convert -size 200x200 -pointsize ${pointsize} -gravity center -background ${icon_color_input} -font FuturaBTMediumCondensed -fill white label:"${icon_text}" temp.png
  convert temp.png \
    \( +clone -crop 41x41+0+0  -fill white -colorize 100% \
       -draw 'fill black circle 40,40 40,0' \
       -background ${icon_color_input}  -alpha shape \
       \( +clone -flip \) \( +clone -flop \) \( +clone -flip \) \
     \) -flatten  $(echo "${icon_text}" | tr '[:upper:]' '[:lower:]')_${pointsize}pt-$(echo "${icon_color}" | tr '[:upper:]' '[:lower:]').png
done && rm temp.png

printf "\nSuccess! Use the icon with text that best uses the image space and remove the others."
