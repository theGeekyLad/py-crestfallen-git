echo "----------------------------------------------"
echo "Crestfallen Git Installer"
echo "----------------------------------------------"

# initializing project dir
echo "[*] Copying project files to /opt/crestfallen-git ..."
sudo rm -rf /opt/crestfallen-git
project_dir=/opt/crestfallen-git
sudo mkdir $project_dir
sudo cp ./crestfallen-git.py ./crestfallen-git.sh ./README.md $project_dir

# setup config file for xauthority dump
echo "echo \$XAUTHORITY > .config-cresfallen-git" >> "/home/$(whoami)/.bash_profile"

# backup handler.sh
echo "[*] Backing up existing /etc/acpi/handler.sh --> /etc/acpi/hander.sh.bkp ..."
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
sudo sed -i $c' i\                '$project_dir'/crestfallen-git.sh' /etc/acpi/handler.sh

# restart acpid
echo "[*] Restarting acpid.service ..."
sudo systemctl restart acpid.service

echo "----------------------------------------------"
echo "Setup complete!"
echo "----------------------------------------------"