#!/bin/bash
source $SHLIB/env.sh

function test_get_StrLength() {
    local str="abcd"
    local defaultLen="4"
    local length=$(get_StrLength $str)

    if [[ $length == $defaultLen ]]; then
      color_succeed "get_StrLength() Successful."
    else
      color_failed "get_StrLength() Failed."
    fi 
}

function test_check_ContainSubstring() {
    local parent="Hello World!"
    local substring="or"
    local flag=$(check_ContainSubstring "$parent" "$substring")

    if [[ $flag == "true" ]]; then
      color_succeed "check_ContainSubstring() Successful."
    else
      color_failed "check_ContainSubstring() Failed."
    fi 
}

function test_get_SubstringByIndex() {
    #  "shlib"
    #   |
    #  index
    #  0,1,2,3,4
    local str="shlib"
    #get "l" 
    local result1=$(get_SubstringByIndex "$str" "2" "2")
    #get "lib"
    local result2=$(get_SubstringByIndex "$str" "2" "4")

    if [[ $result1 == "l" && $result2 == "lib" ]]; then
      color_succeed "get_SubstringByIndex() Successful."
    else
      color_failed "get_SubstringByIndex() Failed."
    fi
}

function test_get_Lowercase(){
    local str="This is a Bash Shell script."
    local result=$(get_Lowercase "$str")
    local flag="false"
    if [[ $result == "this is a bash shell script." ]]; then
        flag="true"
    fi

    str="this is a bash shell script."
    local result=$(get_Lowercase "$str")
    if [[ $result == "this is a bash shell script." ]]; then
        flag="true"
    fi

    if [[ $flag == "true" ]]; then
      color_succeed "check_Lowercase() Successful."
    else
      color_failed "check_Lowercase() Failed."
    fi 
}

function test_get_Uppercase(){
    local str="This is a Bash Shell script."
    local result=$(get_Uppercase "$str")

    if [[ $result == "THIS IS A BASH SHELL SCRIPT." ]]; then
      color_succeed "check_Uppercase() Successful."
    else
      color_failed "check_Uppercase() Failed."
    fi 
}

function main() {
    color_init "purple"
    color "string_test.sh: \n"
    color_clear

    test_get_StrLength
    test_check_ContainSubstring
    test_get_SubstringByIndex    
    test_get_Lowercase
    test_get_Uppercase
}

main    
