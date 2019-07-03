#!/usr/bin/env bash

set -eo &> /dev/null

function banner(){
  printf " _  ______                   ____  ____  _  __     _                  ___                   ____                           _             \n"
  printf "| |/ / __ )  __ _ ___  ___  / ___||  _ \| |/ /    / \   _ __  _ __   |_ _|___ ___  _ __    / ___| ___ _ __   ___ _ __ __ _| |_ ___  _ __ \n"
  printf "| ' /|  _ \ / _  / __|/ _ \ \___ \| | | | ' /    / _ \ | '_ \| '_ \   | |/ __/ _ \| '_ \  | |  _ / _ \ '_ \ / _ \ '__/ _  | __/ _ \| '__|\n"
  printf "| . \| |_) | (_| \__ \  __/  ___) | |_| | . \   / ___ \| |_) | |_) |  | | (_| (_) | | | | | |_| |  __/ | | |  __/ | | (_| | || (_) | |   \n"
  printf "|_|\_\____/ \__,_|___/\___| |____/|____/|_|\_\ /_/   \_\ .__/| .__/  |___\___\___/|_| |_|  \____|\___|_| |_|\___|_|  \__,_|\__\___/|_|   \n"
  printf "                                                       |_|   |_|                                                                         \n"
}

# if length of banner greater than window size then don't show it
if [[ "$(echo $COLUMNS)" -gt 136 ]]; then 
  banner | lolcat
fi

printf "\nKBase SDK App Icon Generator - v1.0 - author: Sean Jungbluth (jungbluth.sean@gmail.com)\n"

printf "\nEnter text to show on the icon (case-sensitive): "
read icon_text

if [ -z "${icon_text}" ]
  then
    echo "Could not detect icon text entry - using 'TEST' as input text"
fi

printf "\nColor the icon (choices: blue, pink, purple, green, yellow, red, orange, teal, aqua)\n"
printf "\nRecommendations, based on category:"
printf "\n  -Read Processing: pink"
printf "\n  -Genome Assembly: blue"
printf "\n  -Genome Annotation: red"
printf "\n  -Sequence Analysis: teal"
printf "\n  -Comparative Genomics: purple"
printf "\n  -Metabolic Modeling: aqua"
printf "\n  -Expression/RNA-Related: yellow"
printf "\n  -Metagenome-Related: green"
printf "\n  -Utilities: orange"

printf "\n\nChoose a color: "
read icon_color

if [ -z "${icon_color}" ]
  then
    echo "Could not detect input color - defaulting to orange."
    icon_color = "orange"
    icon_color_input = "#ED8C3C"
fi

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
elif [ ${icon_color} = "orange" ]; then
  icon_color_input="#ED8C3C"
elif [ ${icon_color} = "teal" ]; then
  icon_color_input="#74B8DC"
elif [ ${icon_color} = "aqua" ]; then
  icon_color_input="#23877D"
fi

printf "\nEnter font text size for font (default: 72): "
read icon_text_size


if [ -z "${icon_text_size}" ]
  then
    echo "Could not detect icon text size entry - using 72."
fi

convert -size 200x200 -pointsize ${icon_text_size} -gravity center -background ${icon_color_input} -font FuturaBTMediumCondensed -fill white label:"${icon_text}" temp.png
convert temp.png \
  \( +clone -crop 41x41+0+0  -fill white -colorize 100% \
     -draw 'fill black circle 40,40 40,0' \
     -background ${icon_color_input}  -alpha shape \
     \( +clone -flip \) \( +clone -flop \) \( +clone -flip \) \
   \) -flatten  /tmp/$(echo "${icon_text}" | tr '[:upper:]' '[:lower:]')_${icon_text_size}pt-$(echo "${icon_color}" | tr '[:upper:]' '[:lower:]').png && rm temp.png

printf "\nSuccess! Ideally the icon text should be uncropped and use most of the background space.\n"

printf "\nExiting.\n\n"
