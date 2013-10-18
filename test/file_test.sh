#!/bin/bash
source $SHLIB/env.sh

function test_create_FileIfNoExists() {
    cd $SHLIB/test/test_data
    create_FileIfNoExists "test_file"

    if [[ -f "test_file" ]]; then
      color_succeed "create_FileIfNoExists() Successful."
    else
      color_failed "create_FileIfNoExists() Failed."
    fi
    
    rm -f test_file
}

function test_get_FileLineNum() {
    cd $SHLIB/test/test_data
    echo "Hello!" > tmp
    echo "World!" >> tmp
    local realNum="2"
    
    local lineNum=$(get_FileLineNum "tmp")
    if [[ $lineNum == $realNum ]]; then
      color_succeed "get_FileLineNum() Successful."
    else
      color_failed "get_FileLineNum() Failed."
    fi

    rm -f tmp 
}

function test_get_FileContentByLineNum() {
    cd $SHLIB/test/test_data
    echo "Hello!" > tmp
    echo "World!" >> tmp
    
    local text=$(get_FileContentByLineNum "2" "tmp")
    if [[ $text == "World!" ]]; then
      color_succeed "get_FileContentByLineNum() Successful."
    else
      color_failed "get_FileContentByLineNum() Failed."
    fi
    
    rm -f tmp
}

function test_check_TwoFilesSame() {
    cd $SHLIB/test/test_data
    echo "Hello!" > file1
    echo "World!" > file2
    
    local flag=$(check_TwoFilesSame file1 file2) 
    if [[ $flag == "false" ]]; then
      color_succeed "check_TwoFilesSame() Successful."
    else
      color_failed "check_TwoFilesSame() Failed."
    fi 

    rm -f file1
    rm -f file2
}

function main() {
    color_init "purple"
    color "file_test.sh: \n"
    color_clear

    test_create_FileIfNoExists
    test_get_FileLineNum
    test_get_FileContentByLineNum    
    test_check_TwoFilesSame
}

main    
