#!/bin/bash

function create_DirIfNoExists() {
	if [[ ! -d $1 ]]; then
		mkdir -p $1
	fi
}

function create_FileIfNoExists() {
	if [[ ! -d $1 ]]; then
		touch $1
	fi
}

function get_FileLineNum() {
	local lineNum=`cat $1 | wc -l`
	echo $lineNum
}

function get_FileContentByLineNum() {
	local content=`sed -n $1"p" $2`
	echo $content
}

function get_
