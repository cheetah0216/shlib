#!/bin/bash
source $SHLIB/env.sh

function test_get_FileReallinkPath() {
    #Init test data
    cd $SHLIB/test/test_data
    mkdir dir1 dir2 dir3 > /dev/null 2>&1
    local oldDir=`pwd`
    cd dir3 && touch file3
    cd $oldDir/dir2 && ln -s $oldDir/dir3/file3 file2
    cd $oldDir/dir1 && ln -s $oldDir/dir2/file2 file1
    
    local real_path=$(get_FileReallinkPath "$oldDir/dir1/file1")
    #check result
    if [[ "$real_path" == "$oldDir/dir3/file3" ]]; then
      color_succeed "get_FileReallinkPath() Successful."
    else
      color_failed "get_FileReallinkPath() Failed."
    fi

    #clear
    ###support AIX
    cd $SHLIB/test/test_data
    ###

    rm -rf $oldDir/dir1
    rm -rf $oldDir/dir2 
    rm -rf $oldDir/dir3 
}

function test_get_FileDirPath() {
    local dirPath="$(get_FileDirPath "${BASH_SOURCE[0]}")" 
    if [[ "$dirPath" == "$SHLIB/test" ]]; then
      color_succeed "get_FileDirPath() Successful."
    else
      color_failed "get_FileDirPath() Failed."
    fi
}

function main() {
    color_init "purple"
    color "path_test.sh: \n"
    color_clear

    test_get_FileDirPath
    test_get_FileReallinkPath          
}

main
