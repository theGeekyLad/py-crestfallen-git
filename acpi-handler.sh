# DO THIS INSIDE .bash_profile
# echo $XAUTHORITY > cresfallen-git-xauthority

shouldSuspend=$(XAUTHORITY=$(cat /home/thegeekylad/.config-cresfallen-git) DISPLAY=":0" /home/thegeekylad/Projects/py-crestfallen-git/crestfallen-git.sh)
if [ -z "$shouldSuspend" ];
then
        echo 'Suspending...'
        systemctl suspend
else
        echo 'Skipping suspend...'
fi
