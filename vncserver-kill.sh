## script to kill my vnc session
## tested on centos7

# check whoami
xxx=`whoami`
echo $xxx ### to check variable xxx

# check my session number
lalala=`ps -ef | grep vnc | grep $xxx | grep  Xvnc | awk  '{print $9}' | grep -v auto`
echo $lalala ### to check variable lalala


# kill session
vncserver -kill $lalala


# verification of job completion
if test $? -eq 0 ; then echo -e "\njob completed"; else echo -e "\njob not completed"; fi

 
