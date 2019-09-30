## restore gitlab backup

## preparation
chown -R git:git /var/opt/gitlab/backups/*


## execution
gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
gitlab-ctl status
gitlab-rake gitlab:backup:restore BACKUP = <INSERT>
gitlab-ctl restart


