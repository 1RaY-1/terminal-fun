#!/usr/bin/bash

default="\e[49m"
black="\e[40m"
white="\e[107m"
red="\e[41m"
green="\e[42m"
yellow="\e[43m"
blue="\e[44m"
purple="\e[45m"
cyan="\e[46m"
dark_gray="\e[100m"
light_gray="\e[47m"
light_red="\e[101m"
light_green="\e[102m"
light_yellow="\e[103m"
light_blue="\e[104m"
light_pink="\e[105m"
light_cyan="\e[106m"


all_colors=( $red $black $green $yellow $blue $purple 
$cyan $dark_gray $light_gray $light_red $light_green 
$light_yellow $light_blue $light_pink $light_cyan
 )

size=${#all_colors[@]}

setterm -cursor off

trap ctrl_c INT

ctrl_c() {
        echo -e "${default}"
        clear
        setterm -cursor on
        exit
}

main(){
    while true
    do
        for each_color in ${all_colors[@]}
        do
            # pick colors in order
            #echo -e $each_color
            #pick in random order
            x=$(($RANDOM % $size))
            echo -e ${all_colors[$x]}
            clear 
            sleep 0.6s
        done
    done
}

main
