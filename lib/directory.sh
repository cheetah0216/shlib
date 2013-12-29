#!/bin/bash

function create_DirIfNoExists() {
	if [[ ! -d $1 ]]; then
		mkdir -p $1
	fi
}

function is_DirExists() {
    local flag="true"
	if [[ ! -d $1 ]]; then
		flag="false"
	fi
    echo $flag
}

