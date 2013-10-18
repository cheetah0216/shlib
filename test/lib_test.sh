#!/bin/bash

function main() {
    find $SHLIB/test -maxdepth 1 -type f -iname "*.sh" -not -iname "lib_test.sh"  -exec {} \;
}

main
