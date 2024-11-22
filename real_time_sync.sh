#!/bin/bash

while true; do
    rsync -avz --delete /mnt/tmp1/ /mnt/tmp2/
    rsync -avz --delete /mnt/tmp2/ /mnt/tmp1/
    sleep 30
done

