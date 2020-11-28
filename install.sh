echo "----------------------------------------------"
echo "Crestfallen Git Installer"
echo "----------------------------------------------"

# vars
project_dir=/opt/py-crestfallen-git
me=$(whoami)

# initializing project dir
echo "[*] Setting up config directory as ~/.config/py-crestfallen-git ..."
mkdir /home/$(whoami)/.config /home/$(whoami)/.config/py-crestfallen-git
echo $XAUTHORITY > /home/$(whoami)/.config/py-crestfallen-git/xauth-cred
touch /home/$(whoami)/.config/py-crestfallen-git/projects
echo "[*] Copying project files to $project_dir ..."
sudo rm -rf $project_dir
sudo mkdir $project_dir
sudo cp ./crestfallen-git.py ./crestfallen-git.sh ./README.md $project_dir

# setup config file for xauthority dump
echo "[*] Backing up .bash_profile --> .bash_profile.bkp ..."
cp /home/$(whoami)/.bash_profile /home/$(whoami)/.bash_profile.bkp
echo "[*] Patching .bash_profile to cache \$XAUTHORITY ..."
echo "echo \$XAUTHORITY > /home/$(whoami)/.config/cresfallen-git/xauth-cred" >> "/home/$(whoami)/.bash_profile"

# backup handler.sh
echo "[*] Backing up /etc/acpi/handler.sh --> /etc/acpi/hander.sh.bkp ..."
sudo cp /etc/acpi/handler.sh /etc/acpi/handler.sh.bkp

# patch handler.sh
c=0
input="/etc/acpi/handler.sh"
while IFS= read -r line
do
    # echo "$line"
    c=$((c+1))
    if [[ $line == *"PBTN|PWRF"* ]]; then
        break
    fi
done < "$input"
c=$((c+1))
echo "[*] Patching /etc/acpi/handler.sh to intercept power button press ..."
sudo sed -i $c' i\                '$project_dir'/crestfallen-git.sh '$me /etc/acpi/handler.sh

# restart acpid
echo "[*] Restarting acpid.service ..."
sudo systemctl restart acpid.service

echo "----------------------------------------------"
echo "Setup complete!"
echo "----------------------------------------------"