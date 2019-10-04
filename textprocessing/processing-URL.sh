## Processing and cleaning bad URL list
## list.txt shouldve been added into the 'list' dir

## setting up path and variables
MYPATH=`pwd`
STAGING=$MYPATH/staging
LIST=$MYPATH/list

SOURCEPATH=https://raw.githubusercontent.com/naimabdrahman/shell/master/textprocessing/ ## <UPDATE ACCORDINGLY>
SOURCELIST=listofbadurlexample.txt   ## <UPDATE ACCORDINGLY>
SOURCELIST2=listofbadurlexample2.txt ## <UPDATE ACCORDINGLY>

SQUIDPATH=/etc/squid/
SQUIDBACKUP=$SQUIDPATH/bckup         ## <UPDATE ACCORDINGLY>
SQUIDURLFILE=blacklisted_sites.acl


## preparation - create dir
mkdir -p $STAGING
mkdir -p $LIST


## preparation - download list       ## <UPDATE ACCORDINGLY BELOW>
wget -P $LIST $SOURCEPATH/$SOURCELIST
wget -P $LIST $SOURCEPATH/$SOURCELIST2

## process list
echo "" > list-stg.txt
for x in $LIST/*.txt
do cat $x\
 | sed -e 's/\[dot\]/./g'\
 | sed -e 's/\(dot\)/./g'\
 | sed -e 's/\[//g'\
 | sed -e 's/\]//g'\
 | sed -e 's/hxxp/http/g'\
 >> $STAGING/list-stg.txt
done


## cleaning list - remove dedup
sort $STAGING/list-stg.txt | uniq -u > $STAGING/list-stg.txt.temp
mv $STAGING/list-stg.txt.temp $STAGING/list-stg.txt


## completed
echo -e "
To test pls check the file :  $STAGING/list-stg.txt
"

####################################################################################

## push to squid - switched on ##

## backup squid blocked file
mkdir -p $SQUIDBACKUP
cat $SQUIDPATH/$SQUIDURLFILE > $SQUIDBACKUP/$SQUIDURLFILE.bckup.`date +%s`

## remove squid  blocked file more than 90 days
find $SQUIDBACKUP -type f -mtime +90 -delete


## transfer new list into squid and remove dedup and reload service
cat $STAGING/list-stg.txt >> $SQUIDPATH/$SQUIDURLFILE
sort $SQUIDPATH/$SQUIDURLFILE | uniq  > $SQUIDPATH/$SQUIDURLFILE.tmp
mv $SQUIDPATH/$SQUIDURLFILE.tmp  $SQUIDPATH/$SQUIDURLFILE
service squid reload



