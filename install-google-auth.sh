## setup google auth 2fa 
## tested on centos 8



## install google-authenticator
yum -y install google-authenticator qrencode-libs
sleep 5 ; google-authenticator # yyny # manual config
#sleep 5 ; google-authenticator -t -f -d -w 3 -e 10 -r 3 -R 30 ; # non interactive 



## pam config

cat /etc/pam.d/sshd > /etc/pam.d/sshd.bckup.`date +%s`

cat >> /etc/pam.d/sshd << EOF
#auth    required      pam_unix.so     no_warn try_first_pass
auth    required      pam_google_authenticator.so
EOF

sed -i 's/^auth       substack     password-auth/#auth       substack     password-auth/g' /etc/pam.d/sshd




## sshd config 
cat /etc/ssh/sshd_config > /etc/ssh/sshd_config.bckup.`date +%s`

sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
 
echo "
# These lines should be added to the end of the file
Match User example-user
    AuthenticationMethods keyboard-interactive
" >> /etc/ssh/sshd_config

service sshd restart



## ref ==> https://www.linode.com/docs/guides/how-to-use-one-time-passwords-for-two-factor-authentication-with-ssh-on-centos/
