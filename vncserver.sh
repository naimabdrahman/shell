# to start new vnc server and kill any old vnc session

rm -rf /tmp/.X*-lock
rm -rf /tmp/.X11-unix/*
vncserver -geometry 1850x980 -depth 24
