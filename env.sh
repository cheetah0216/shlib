#!/bin/bash

OSType=`uname -a | awk '{ print $1}'`
export SHLIB_OS_TYPE=$OSType

#The first to be applied.
. $SHLIB/lib/color.sh

. $SHLIB/lib/cleartool.sh
. $SHLIB/lib/log.sh
. $SHLIB/lib/file.sh
. $SHLIB/lib/path.sh
. $SHLIB/lib/directory.sh
. $SHLIB/lib/array.sh
. $SHLIB/lib/string.sh
. $SHLIB/lib/arithmetic.sh
