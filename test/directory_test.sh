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

function main() {
    color_init "purple"
    color "directory_test.sh: \n"
    color_clear

    test_create_DirIfNoExists
}

main    
