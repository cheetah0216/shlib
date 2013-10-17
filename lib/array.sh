#!/bin/bash

function spilt_StrToArray() {
    local str=$1
    echo "${str//$2/ }"
}

