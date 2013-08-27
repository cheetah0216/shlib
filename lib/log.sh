#!/bin/bash

#global variable:log
DATE=`date "+%Y-%m-%d-%H%M%S"`
#OutputDir="$LOG_OUTPUT_DIR""$LOG_FILE_HEAD""_""$PROGRESS_NAME""_""$DATE"
#LogsDir="$OutputDir""/""$LOG_FILE_HEAD""_""$PROGRESS_NAME""_""$DATE"".log"
OutputDir=""
LogsDir=""

function log_init() {
	set_LogsDir $1 $2
	create_LogsDir
}

function log() {
	#usage: log -p "welcome..."
	#log   : only write to logs.
	#log -p: print to screen and write to logs.
	#log -m: more log write to logs don't print to screen.
	#log -e: error output to screen and logs.

     if [[ $1 == "-p" ]]; then
       echo "log: $2" && [[ -f $LogsDir ]] && echo "log: $2" >> $LogsDir
     elif [[ $1 == "-e" ]]; then
       echo "log:ERROR: ${2:-"Unknown Error!"}" 1>&2 && [[ -f $LogsDir ]] && echo "log:ERROR: ${2:-"Unknown Error!"}" >> $LogsDir
     elif [[ $1 == "-m" && $MORE_LOG == 1 ]]; then
       [[ -f $LogsDir ]] && echo "log: $2" >> $LogsDir
     elif [[ $# == 1 ]]; then
       [[ -f $LogsDir ]] && echo "log: $1" >> $LogsDir
     fi
}

function get_LogsDir() {
	echo $LogsDir
}

function log_FunStart() {
	local temp="====================================FUNCTION: "${FUNCNAME[1]}"() Start--<<"
	log "$temp"
}

function log_FunEnd() {
	local temp="====================================FUNCTION: "${FUNCNAME[1]}"() End-->>"
	log "$temp"
}

#============================= Private ==========================
function set_LogsDir() {
	OutputDir=$1
	LogsDir=$OutputDir"/"$2"_"$DATE".log"
}

function create_DirIfNoExists() {
    if [[  ! -d $1 ]]; then
      mkdir -p $1
    fi
}

function create_FileIfNoExists() {
    if [[  ! -d $1 ]]; then
      touch $1
    fi
}

function create_LogsDir() {
	create_DirIfNoExists $OutputDir
	create_FileIfNoExists $LogsDir
}
