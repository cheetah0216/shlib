#!/bin/bash

function shlib_add() {
    echo "$(( $1 + $2 ))"
}

function shlib_sub() {
    echo "$(( $1 - $2 ))"
}

function shlib_mul() {
    echo "$(( $1 * $2 ))"
}


function shlib_div() {
    echo "$(( $1 / $2 ))"
}

function shlib_mod() {
    echo "$(( $1 % $2 ))"
}

function shlib_pow() {
    echo "$(( $1 ** $2 ))"
}
