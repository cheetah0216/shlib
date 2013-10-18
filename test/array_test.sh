#!/bin/bash
source $SHLIB/env.sh

function test_spilt_StrToArray() {
   local str="one;two;three;"

   local arr=$(spilt_StrToArray $str ";")
   local result=""
   for value in ${arr[@]}
   do
     result="$result""$value"";"
   done
   
   if [[ $str == $result ]]; then
     color_succeed "spilt_StrToArray() Successful."
   else
     color_failed "spilt_StrToArray() Failed." 
   fi

}

function main() {
    color_init "purple"
    color "array_test.sh: \n"
    color_clear

    test_spilt_StrToArray        
}

main    
