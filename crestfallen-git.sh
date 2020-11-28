# DO THIS INSIDE .bash_profile
# echo $XAUTHORITY > cresfallen-git-xauthority

shouldSuspend=$(XAUTHORITY=$(cat /home/$1/.config/py-cresfallen-git/xauth-cred) DISPLAY=":0" runuser $1 -c "python3 /opt/py-crestfallen-git/crestfallen-git.py")
if [ -z "$shouldSuspend" ];
then
        echo 'Suspending...'
        systemctl suspend
else
        echo 'Skipping suspend...'
fi