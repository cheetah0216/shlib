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

#string="AbZ" --> "abc"
#string="abc" --> "abc"
function get_Lowercase(){
    #need high bash version
    #local lowercase="lower"
    #declare -l lowercase=$1
    #echo "$lowercase"
    local lowercase=`tr '[A-Z]' '[a-z]' <<<"$1"`

    if [[ $lowercase == "" ]]; then
        lowercase=$1
    fi

    echo "$lowercase"
}

#string="aBc" --> "ABC"
function get_Uppercase(){
    #need high bash version
    #local uppercase="upper"
    #declare -u uppercase=$1
    #echo "$uppercase"
    local uppercase=`tr '[a-z]' '[A-Z]' <<<"$1"`
    echo "$uppercase"
}

