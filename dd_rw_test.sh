## dd read write test

## read
sysctl -w vm.drop_caches=3 ; dd if=/dev/zero of=ddtempfiletodelete bs=1M count=1000


## write
sysctl -w vm.drop_caches=3 ; dd if=ddtempfiletodelete of=/dev/null bs=1M count=1000


## remove tempfile
rm -rf ddtempfiletodelete
