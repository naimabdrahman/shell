## remove old backup files


## auto remove files more than 5 mins
find /path/to/files -type f -mmin +5 -exec rm {} \;


## more than 3 mins in while loop
while true
do
    find -type f -mmin +3 -delete
    sleep 60
done



## more than 30 days
find /path/to/files -type f -mtime +30 -print0 | xargs -0 rm -f
