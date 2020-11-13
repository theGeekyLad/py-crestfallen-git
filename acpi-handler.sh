shouldSuspend=$(runuser thegeekylad -c /home/thegeekylad/Projects/py-crestfallen-git/crestfallen-git.sh)
                if [ -z "$shouldSuspend" ];
                then
                    systemctl suspend
                else
                    echo 'Skipping suspend...'
                fi
