#to sync time between linux servers without NTP
#Use either method1 or method2
#seamless ssh is required

#method1
#date > tmp
#cat tmp | ssh localhost 'cat> tmp2 && date -s "`cat tmp2`"'

#or

#method2
date | ssh localhost 'cat> tmp2 && date -s "`cat tmp2`"'
#for bulk
#for x in `cat list` ; do date | ssh $x 'cat> tmp2 && date -s "`cat tmp2`"' ; done
