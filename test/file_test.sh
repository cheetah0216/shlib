#!/bin/bash
source $SHLIB/env.sh

function test_case1() {
    echo "test_case1"
}

function main() {
    color_init "purple"
    color "file_test.sh: \n"
    color_clear

    test_case1         
}

main    
