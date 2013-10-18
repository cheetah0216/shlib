#!/bin/bash

function get_StrLength() {
    local str=$1
    echo ${#str}
}

function check_ContainSubstring() {
    local parent=$1
    local substring=$2
    if [[ $parent =~ $substring ]]; then
      echo "true"
    else
      echo "false"
    fi
}

#string="abcd"
#        | 
#       index
#       0,1,2,3 
function get_SubstringByIndex() {
    local str=$1
    local start=$2
    local end=$3
    local length=""
    length=$(( $end - $start ))
    length=$(( $length + 1 ))
    echo "${str:$start:$length}"
}

