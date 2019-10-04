## Processing and cleaning bad URL list
## list.txt shouldve been added into the 'list' dir

## setting up path and variables
MYPATH=`pwd`
STAGING=$MYPATH/staging
BCKUP=$MYPATH/bckup
LIST=$MYPATH/list
SOURCEPATH=https://raw.githubusercontent.com/naimabdrahman/shell/master/textprocessing/ ## <update accordingly>
SOURCELIST=listofbadurlexample.txt ## <Update accordingly>
SQUIDPATH=/etc/squid ## <UPDATE ACCORDINGLY>
SQUIDBACKUP=$SQUIDPATH/bckup ## <UPDATE ACCORDINGLY>

SQUIDURLFILE=blacklisted_sites.acl


## preparation - create dir
mkdir -p $STAGING
mkdir -p $BCKUP
mkdir -p $LIST


## preparation - download list
for x in $SOURCELIST; do wget -P $LIST $SOURCEPATH/$SOURCELIST ; done


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


## push to squid - not switched on ##

# take bckup
mkdir -p $SQUIDBACKUP
cat $SQUIDPATH/$SQUIDURLFILE > $SQUIDBACKUP/$SQUIDURLFILE.bckup.`date +%s`

## transfer new list into squid and remove dedup
cat $STAGING/list-stg.txt >> $SQUIDPATH/$SQUIDURLFILE
sort $SQUIDPATH/$SQUIDURLFILE | uniq -u > $SQUIDPATH/$SQUIDURLFILE.tmp
mv $SQUIDPATH/$SQUIDURLFILE.tmp  $SQUIDPATH/$SQUIDURLFILE
service squid reload


