#!/bin/bash

function get_FileReadlinkPath() {
    local source=$1
    while [[ -f "$source" ]]; do
      source=`readlink $source`
    done
    echo "$source"
}
