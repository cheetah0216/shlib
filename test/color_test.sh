#!/bin/bash
source $SHLIB/env.sh

function test_color() {
    #color_init "red;&green;bold;underline"
    color_init "green;bold;underline"
    color "✔ Hello! ✖\n" 
    color_clear
}

function main() {
    test_color
}

main
