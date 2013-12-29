#!/bin/bash
source $SHLIB/env.sh

function test_create_DirIfNoExists() {
    cd $SHLIB/test/test_data
    create_DirIfNoExists "test_dir"

    if [[ -d "test_dir" ]]; then
      color_succeed "create_DirIfNoExists() Successful."
    else
      color_failed "create_DirIfNoExists() Failed."
    fi
    
    rm -rf test_dir
}

function test_is_DirExists() {
    cd $SHLIB/test/test_data
    local flag1=""
    local flag2=""

    flag1=$(is_DirExists "test_dir")
    mkdir test_dir
    flag2=$(is_DirExists "test_dir")

    if [[ $flag1 == "false" && $flag2 == "true" ]]; then
      color_succeed "is_DirExists() Successful."
    else
      color_failed "is_DirExists() Failed."
    fi
    
    rm -rf test_dir
}

function main() {
    color_init "purple"
    color "directory_test.sh: \n"
    color_clear

    test_create_DirIfNoExists
    test_is_DirExists
}

main    
