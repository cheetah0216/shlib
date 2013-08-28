#!/bin/bash

function create_DirIfNoExists() {
	if [[ ! -d $1 ]]; then
		mkdir -p $1
	fi
}
