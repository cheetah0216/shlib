#!/bin/bash


function test_file() {
	currentDir=`pwd`
	create_DirIfNoExists $currentDir"/test_file"
	create_FileIfNoExists $currentDir"/test_file/test"
}

function main() {
    cd $SHLIB/test
    ./color_test.sh
    ./log_test.sh
    ./path_test.sh
}

main
