## configure chroot sftp centos7 ##

groupadd sftpgroup

cat /etc/ssh/sshd_config > /etc/ssh/sshd_config.bckup.`date +%s`
sed -i 's/Subsystem\ssftp\s\/usr\/libexec\/openssh\/sftp-server/Subsystem sftp internal-sftp/g' /etc/ssh/sshd_config

cat >> /etc/ssh/sshd_config << EOF
Match Group sftpgroup
        X11Forwarding no
        AllowTcpForwarding no
        ChrootDirectory %h
        ForceCommand internal-sftp
EOF

service sshd restart

echo -e "

pls add userseraccout to sftpgroup for chroot SFTP
example : usermod -aG sftpgroup sftpuser1

"
