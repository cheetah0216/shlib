#!/bin/bash
source $SHLIB/env.sh

function test_shlib_add() {
    local num1="5"
    local num2="-1"
    local realRlt="4"
    local result=$(shlib_add "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_add() Successful."
    else
      color_failed "shlib_add() Failed."
    fi 
}
    
function test_shlib_sub() {
    local num1="5"
    local num2="-1"
    local realRlt="6"
    local result=$(shlib_sub "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_sub() Successful."
    else
      color_failed "shlib_sub() Failed."
    fi 
}

function test_shlib_mul() {
    local num1="5"
    local num2="-2"
    local realRlt="-10"
    local result=$(shlib_mul "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_mul() Successful."
    else
      color_failed "shlib_mul() Failed."
    fi 
}

function test_shlib_div() {
    local num1="6"
    local num2="-2"
    local realRlt="-3"
    local result=$(shlib_div "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_div() Successful."
    else
      color_failed "shlib_div() Failed."
    fi 
}

function test_shlib_mod() {
    local num1="6"
    local num2="-4"
    local realRlt="2"
    local result=$(shlib_mod "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_mod() Successful."
    else
      color_failed "shlib_mod() Failed."
    fi 
}

function test_shlib_pow() {
    local num1="3"
    local num2="4"
    local realRlt="81"
    local result=$(shlib_pow "$num1" "$num2")

    if [[ "$realRlt" == "$result" ]]; then
      color_succeed "shlib_pow() Successful."
    else
      color_failed "shlib_pow() Failed."
    fi 
}

function main() {
    color_init "purple"
    color "arithmetic_test.sh: \n"
    color_clear

    test_shlib_add
    test_shlib_sub
    test_shlib_mul
    test_shlib_div
    test_shlib_mod
    test_shlib_pow    
}

main    
