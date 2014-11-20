#shlib
shlib is a simple bash libs with in Linux/OSX/AIX platforms. It is include some useful functions,such as log module,terminal color,bash array,files,string,directory etc.  

#How To Start
git clone https://github.com/cheetah0216/shlib.git /opt/shlib  
export SHLIB=/opt/shlib  

Now,we can test all bash lib modules.  
cd $SHLIB/test  
./lib_test or source lib_test  

#How To Use
Added "source $SHLIB/env.sh" in your private script and you can get the more useful info in $SHLIB/test.  

#API
##arithmetic.sh: 
shlib_add()   
shlib_sub()   
shlib_mul()   
shlib_div()   
shlib_mod()   
shlib_pow()   
##array.sh: 
spilt_StrToArray()   
##color.sh
color_init()   
color_succeed()   
color_failed()   
##directory.sh: 
create_DirIfNoExists()   
is_DirExists()   
##file.sh: 
create_FileIfNoExists()   
get_FileLineNum()   
get_FileContentByLineNum()   
check_TwoFilesSame()   
get_get_LineNumByContent()
#log.sh: 
log()   
#path.sh: 
get_FileDirPath()   
get_FileReallinkPath()   
#string.sh: 
get_StrLength()   
check_ContainSubstring()   
get_SubstringByIndex()   
get_Lowercase()  
get_Uppercase()

