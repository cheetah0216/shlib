#!/bin/bash

function get_FileMoreInfo() {
	local temp=`cleartool ls $1`
	echo "$temp"
}

function get_CheckInListsByPRName() {
	cleartool find $1 -version 'attr_sub(PRNUM,==,$2)' -print
}

function checkout_Files() {
	local PRNum=$1
	local fileName=$2
	kco -c "$PRNum" "$fileName"
}

function checkin_Files() {
	local PRNum=$1
	local fileName=$2
	kci -c "$PRNum" "$fileName"
}
