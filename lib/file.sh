#!/bin/bash

function create_FileIfNoExists() {
	if [[ ! -f $1 ]]; then
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

function check_TwoFilesSame() {
    if [[ $SHLIB_OS_TYPE == "AIX" ]]; then
      local MD5_1=`csum -h MD5 $1 | awk '{ print $1}'`
      local MD5_2=`csum -h MD5 $2 | awk '{ print $1}'` 
    else
      local MD5_1=`md5sum $1 | awk '{ print $1}'`
      local MD5_2=`md5sum $2 | awk '{ print $1}'` 
    fi

    if [[ $MD5_1 == $MD5_2 ]]; then
      echo "true"
    else
      echo "false"
    fi
}

function get_LineNumByContent() {
    local linenum=`sed -n "/$1/=" $2`
    echo $linenum
}
