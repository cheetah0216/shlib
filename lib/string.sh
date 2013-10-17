#!/bin/bash

function get_StrLength() {
    local str=$1
    echo ${#str}
}

function check_Substring() {
    local parent=$1
    local substring=$2
    if [[ $parent =~ $substring ]]; then
      echo "true"
    else
      echo "false"
    fi
}

function () {
    
}

