#!/bin/bash
source $SHLIB/env.sh

function test_create_FileIfNoExists() {
    cd $SHLIB/test/test_data
    create_FileIfNoExists "test_file"

    if [[ -f "test_file" ]]; then
      color_succeed "create_FileIfNoExists() Successful."
    else
      color_failed "create_FileIfNoExists() Failed."
    fi
    
    rm -f test_file
}

function test_get_FileLineNum() {
    cd $SHLIB/test/test_data
    echo "Hello!" > tmp
    echo "World!" >> tmp
    local realNum="2"
    
    local lineNum=$(get_FileLineNum "tmp")
    if [[ $lineNum == $realNum ]]; then
      color_succeed "get_FileLineNum() Successful."
    else
      color_failed "get_FileLineNum() Failed."
    fi

    rm -f tmp 
}

function test_get_FileContentByLineNum() {
    cd $SHLIB/test/test_data
    echo "Hello!" > tmp
    echo "World!" >> tmp
    
    local text=$(get_FileContentByLineNum "2" "tmp")
    if [[ $text == "World!" ]]; then
      color_succeed "get_FileContentByLineNum() Successful."
    else
      color_failed "get_FileContentByLineNum() Failed."
    fi
    
    rm -f tmp
}

function test_check_TwoFilesSame() {
    cd $SHLIB/test/test_data
    echo "Hello!" > file1
    echo "World!" > file2
    
    local flag=$(check_TwoFilesSame file1 file2) 
    if [[ $flag == "false" ]]; then
      color_succeed "check_TwoFilesSame() Successful."
    else
      color_failed "check_TwoFilesSame() Failed."
    fi 

    rm -f file1
    rm -f file2
}

function test_get_LineNumByContent() {
    cd $SHLIB/test/test_data
    echo "Hello!" > file1
    echo "World!" >> file1
    
    local linenum=$(get_LineNumByContent "Hello" "$SHLIB/test/test_data/file1") 

    if [[ $linenum == "1" ]]; then
      color_succeed "get_LineNumByContent() Successful."
    else
      color_failed "get_LineNumByContent Failed."
    fi 

    rm -f file1
}

function test_get_FileName() {
   local filename1="test.cpp"
   local name1="test"
   local filename2="/etc/test/test.cpp"
   local name2="/etc/test/test"
    
   local result1=$(get_FileName $filename1)
   local result2=$(get_FileName $filename2)

   if [[ $result1 == $name1 ]] && [[ $result2 == $name2 ]]; then
       color_succeed "get_FileName() Successful."
   else
       color_failed "get_FileName() Failed."
   fi 

}

function test_insert_ContentAfterLineNum() {
    cd $SHLIB/test/test_data

    echo "Hello!" > test_file
    echo "World!" >> test_file

    echo "Hello!" > result_file
    echo "Test!" >> result_file
    echo "World!" >> result_file

    insert_ContentAfterLineNum "1" "Test!" test_file 

    local flag=$(check_TwoFilesSame test_file result_file) 
    if [[ $flag == "true" ]]; then
      color_succeed "insert_ContentAfterLineNum Successful."
    else
      color_failed "insert_ContentAfterLineNum Failed."
    fi 
    
    rm -f test_file
    rm -f result_file
}

function test_insert_ContentBeforeLineNum() {
    cd $SHLIB/test/test_data

    echo "Hello!" > test_file
    echo "World!" >> test_file

    echo "Hello!" > result_file
    echo "Test!" >> result_file
    echo "World!" >> result_file

    insert_ContentBeforeLineNum "2" "Test!" test_file 
    
    local flag=$(check_TwoFilesSame test_file result_file) 
    if [[ $flag == "true" ]]; then
      color_succeed "insert_ContentBeforeLineNum Successful."
    else
      color_failed "insert_ContentBeforeLineNum Failed."
    fi 
    
    rm -f test_file
    rm -f result_file
}

function test_insert_FileInLineNum() {
    cd $SHLIB/test/test_data

    echo "Hello!" > test_file
    echo "World!" >> test_file

    echo "insert!" > insert_file
    echo "file!" >> insert_file

    create_FileIfNoExists "result_file"
    echo "Hello!" > result_file
    echo "insert!" >> result_file
    echo "file!" >> result_file
    echo "World!" >> result_file

    insert_FileInLineNum "1" insert_file test_file 
    
    local flag=$(check_TwoFilesSame test_file result_file) 
    if [[ $flag == "true" ]]; then
      color_succeed "insert_FileInLineNum Successful."
    else
      color_failed "insert_FileInLineNum Failed."
    fi 
    
    rm -f test_file
    rm -f insert_file
    rm -f result_file
}

function main() {
    color_init "purple"
    color "file_test.sh: \n"
    color_clear

    test_create_FileIfNoExists
    test_get_FileLineNum
    test_get_FileContentByLineNum    
    test_check_TwoFilesSame
    test_get_LineNumByContent
    test_get_FileName
    test_insert_ContentAfterLineNum
    test_insert_ContentBeforeLineNum
    test_insert_FileInLineNum
}

main    
