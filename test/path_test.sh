#!/bin/bash

function test_get_FileReadlinkPath() {
    cd $SHLIB/test/test_date
    mkdir dir1 dir2 dir3 > /dev/null 2>&1
    local oldDir=`pwd`
    cd dir3 && touch file3
    cd $oldDir/dir2 && ln -s $oldDir/dir3/file3 file2
    cd $oldDir/dir1 && ln -s $oldDir/dir2/file2 file1
    
    local real_path=$(get_FileReadlinkPath "$oldDir/dir1/file1")

    if [[ "$real_path" == "$oldDir/dir3/file3" ]]; then
      echo "path.sh: get_FileReadlinkPath() Successful."
    else
      echo "path.sh: get_FileReadlinkPath() Failed."
    fi
     
}

function main() {
    test_get_FileReadlinkPath          
}

main
