#!/bin/bash

BASHLIB_ATTRIBUTES_ALL="regular;bold;dark;italic;underline;reverse;strike"
BASHLIB_ATTRIBUTES_regular="0"
BASHLIB_ATTRIBUTES_bold="01"
BASHLIB_ATTRIBUTES_dark="02"
BASHLIB_ATTRIBUTES_italic="02"
BASHLIB_ATTRIBUTES_underline="04"
BASHLIB_ATTRIBUTES_reverse="07"
BASHLIB_ATTRIBUTES_strike="09"

BASHLIB_COLOR_ALL="black;red;green;yellow;blue;purple;cyan;white"
BASHLIB_COLOR_black="30"
BASHLIB_COLOR_red="31"
BASHLIB_COLOR_green="32"
BASHLIB_COLOR_yellow="33"
BASHLIB_COLOR_blue="34"
BASHLIB_COLOR_purple="35"
BASHLIB_COLOR_cyan="36"
BASHLIB_COLOR_white="37"

BASHLIB_BACKGROUND_ALL="&black;&red;&green;&yellow;&blue;&purple;&cyan;&white"
BASHLIB_BACKGROUND_black="40"
BASHLIB_BACKGROUND_red="41"
BASHLIB_BACKGROUND_green="42"
BASHLIB_BACKGROUND_yellow="43"
BASHLIB_BACKGROUND_blue="44"
BASHLIB_BACKGROUND_purple="45"
BASHLIB_BACKGROUND_cyan="46"
BASHLIB_BACKGROUND_white="47"

#color_init "red;&black;bold;underline"
function color_init() {
    local colorInit=$1
    local arrInit=${colorInit//;/ }
    local tmp=""
    local ret="\033["

    for value in ${arrInit[@]}
    do
      tmp=""
      if [[ $BASHLIB_ATTRIBUTES_ALL =~ $value ]]; then
        tmp="BASHLIB_ATTRIBUTES_""$value"
        eval "colorAttributes=\$$tmp"
        ret="$ret"";""$colorAttributes"
      elif [[ $BASHLIB_COLOR_ALL =~ $value ]]; then
        tmp="BASHLIB_COLOR_""$value"
        eval "colorAll=\$$tmp"
        ret="$ret"";""$colorAll"
      elif [[ $BASHLIB_BACKGROUND_ALL =~ $value ]]; then
        value=${value:1}
        tmp="BASHLIB_BACKGROUND_""$value"
        eval "colorBkg=\$$tmp"
        ret="$ret"";""$colorBkg"
      else
        echo "color_init: Unknown param $value."
      fi
    done

    ret="$ret""m"
    echo -en "$ret"
}

function color() {
    echo -en $1
}

function color_clear() {
    tput sgr0
}

function color_succeed() {
    local tmp="[✔ ]"" ""$1""\n"
    color_init "green;bold"
    color "$tmp"
    color_clear
}

function color_failed() {
    local tmp="[✖]"" ""$1""\n"
    color_init "red;bold"
    color "$tmp"
    color_clear
}


