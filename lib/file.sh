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

function get_FileContentByLineRange() {
    local startline=$1
    local endline=$2
    local file=$3
    local content=`sed -n "${startline},${endline}p" $file`
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

function get_FileName() {
    local filename=$1
    local name=${filename%%.*}
    echo $name
}

function insert_ContentAfterLineNum() {
    local linenum=$1
    local content=$2
    local file=$3
    sed -i "$linenum a\\$content" $file
}

function insert_ContentBeforeLineNum() {
    local linenum=$1
    local content=$2
    local file=$3
    sed -i "$linenum i\\$content" $file
}

function insert_FileInLineNum() {
    local linenum=$1
    local contentfile=$2
    local file=$3
    sed -i "$linenum r $contentfile" $file
} 

function update_ReplaceFileContent() {
    local target="$1"
    local new="$2"
    local file="$3"
    sed -i "s/$1/$2/g" $file
}
