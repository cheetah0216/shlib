#!/bin/bash

function get_FileReadlinkPath() {
    local src=$1
    while [[ -h "$src" ]]; do
      src=`readlink $src`
    done
    echo "$src"
}

function get_FileDirPath() {
    local file=$1
    local dirPath="$( cd "$(dirname "$file")" && pwd )"
    echo "$dirPath"
}

