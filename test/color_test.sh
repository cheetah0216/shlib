#!/bin/bash
source $SHLIB/env.sh

function create_color_string() {
    color_init "red;&green;bold;underline" 
    echo "Hello!" 
    color_clear 
}

function test_color() {
    cd $SHLIB/test/test_data
    create_color_string > test_color.tmp
    sed '2d' test_color.tmp > tmp.$$
    mv tmp.$$ test_color.tmp

    if [[ $(check_TwoFilesSame "test_color.tmp" "test_color.file") == true ]]; then
      color_succeed "color() Successful."
    else
      color_failed "color() Failed." 
    fi

    rm test_color.tmp
}

function main() {
    echo -en "\033[35m"
    echo "color_test.sh"
    tput sgr0

    test_color
}

main
