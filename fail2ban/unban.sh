## ref https://linuxhint.com/unban-ip-fail2ban/


fail2ban-client status sshd
fail2ban-client set jail_name unbanip xxx.xxx.xxx.xxx
fail2ban-client set sshd unbanip 192.168.72.186
