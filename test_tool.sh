#!/bin/bash
fileName="$1"
fileDir="$SHLIB/test/""$fileName"

function create_test_file_head() {
cat << create_test_file_head > $fileDir
#!/bin/bash
source \$SHLIB/env.sh

create_test_file_head
}

function create_test_file_body() {
cat << create_test_file_body >> $fileDir
function test_case1() {
    echo "test_case1"
}

create_test_file_body
}

function create_test_file_main() {
cat << create_test_file_main >> $fileDir
function main() {
    color_init "purple"
    color "$fileName: \n"
    color_clear

    test_case1         
}

main    
create_test_file_main
}

function main() {
    create_test_file_head
    create_test_file_body
    create_test_file_main
    chmod 777 $fileDir
}

main
