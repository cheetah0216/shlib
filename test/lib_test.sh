#!/bin/bash

function init() {
	cd ../lib
	source log.sh
	source cleartool.sh
	source file.sh
}

function test_log() {
	log_init "/u1/fliu/Auto_CheckIn/CBS0000001" "PR"
	log "test:log"
	log -p "test:log -p"
	log -m "test:log -m"
	log -e "test:log -e"
	log_FunStart
	log_FunEnd
	get_LogsDir
}

function test_cleartool() {
	get_CheckInListsByPRName "/usr1/arbor/" "DR-4-011-692"
}

function test_file() {
	currentDir=`pwd`
	create_DirIfNoExists $currentDir"/test_file"
	create_FileIfNoExists $currentDir"/test_file/test"
}

function main() {
	init
	test_log
	#test_cleartool
	#test_file
}

main
