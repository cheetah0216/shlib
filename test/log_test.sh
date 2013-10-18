#!/bin/bash
source $SHLIB/env.sh

function test_log() {
    cd $SHLIB/test/test_data

    touch test_log_screen.tmp
    log "test:log" >> test_log_screen.tmp
    log -p "test:log -p" >> test_log_screen.tmp
    log -m "test:log -m" >> test_log_screen.tmp
    log -e "test:log -e" >> test_log_screen.tmp
    log_FunStart >> test_log_screen.tmp 
    log_FunEnd >> test_log_screen.tmp 

    local logDir=$(get_LogsDir)
    local flag1=$(check_TwoFilesSame "$logDir" "test_log.log")
    local flag2=$(check_TwoFilesSame "test_log.screen" "test_log_screen.tmp")

    if [[ $flag1 == "true" && $flag2 == "true" ]]; then
      color_succeed "log() Successful."
    else
      color_failed "log() Failed."
    fi

    rm test_log_screen.tmp
}

function main() {
    color_init "purple"
    color "log_test.sh: \n"
    color_clear

    log_init "/var/shlibLogs/log_test" "test"
    test_log
}

main
