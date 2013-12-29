#shlib
shlib is a simple bash libs with in AIX and Linux platforms. It is include some useful functions,such as log module,terminal color,bash array,files,string,directory etc.

#How To Start
git clone https://github.com/cheetah0216/shlib.git /opt/shlib
export SHLIB=/opt/shlib

Now,we can test all bash lib modules.
cd $SHLIB/test
./lib_test or source lib_test

#How To Use
Added "source $SHLIB/env.sh" in your private script and you can get the more useful info in $SHLIB/test.

#API
##arithmetic_test.sh: 
shlib_add() 
shlib_sub() 
shlib_mul() 
shlib_div() 
shlib_mod() 
shlib_pow() 
##array_test.sh: 
spilt_StrToArray() 
##color_test.sh
color() 
##directory_test.sh: 
create_DirIfNoExists() 
is_DirExists() 
##file_test.sh: 
create_FileIfNoExists() 
get_FileLineNum() 
get_FileContentByLineNum() 
check_TwoFilesSame() 
#log_test.sh: 
log() 
#path_test.sh: 
get_FileDirPath() 
get_FileReallinkPath() 
#string_test.sh: 
get_StrLength() 
check_ContainSubstring() 
get_SubstringByIndex() 

