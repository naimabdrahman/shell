## telnet auto exit
## to quick test if target and port is open

echo -e '\x1dclose\x0d' | telnet x.x.x.x 80

