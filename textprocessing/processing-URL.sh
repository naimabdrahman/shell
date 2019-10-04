## Processing and cleaning bad URL list
## list.txt shouldve been added into the 'list' dir



## setting up path
MYPATH=`pwd`
STAGING=$MYPATH/staging
BCKUP=$MYPATH/bckup
LIST=$MYPATH/list



## preparation

mkdir -p $STAGING
mkdir -p $BCKUP
mkdir -p $LIST


## process list
for x in $LIST/*.txt
do cat $x\
 | sed -e 's/\[dot\]/./g'\
 | sed -e 's/\(dot\)/./g'\
 | sed -e 's/\[//g'\
 | sed -e 's/\]//g'\
 | sed -e 's/hxxp/http/g'\
 > $STAGING/list-stg.txt
done


## cleaning list - remove dedup
sort $STAGING/list-stg.txt | uniq -u > $STAGING/list-stg.txt.temp
mv $STAGING/list-stg.txt.temp $STAGING/list-stg.txt


## completed
echo -e "
To test pls check the file :  $STAGING/list-stg.txt
"