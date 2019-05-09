## script to validate matched items between 2 lists
## text processing tested in centos 7
## lists should have been cleaned before this operation

for x in `cat list1` 
do cat artefact | grep -i $x
	if test $? -eq 0
	then echo -e "matched"
	else echo -e "NA"
	fi 
done

#cat list1 | grep SAMPLE ; if test $? -eq 0 ; then echo -e "matched"; else echo -e "NA"; fi
#for x in `cat list1` ; do echo $x && cat artefact | grep $x ; done

