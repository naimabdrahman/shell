## create gitlab backup

gitlab-rake gitlab:backup:create

echo -e "\n\ncompleted\n\n"

ls -l /var/opt/gitlab/backups/
