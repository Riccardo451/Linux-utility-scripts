#!/bin/sh
mkdir /home/pi/Update
echo "
#!/bin/sh
# redirect stdout/stderr to a file
exec 1>>/home/pi/Update/logfile.txt 2>&1
echo '----------------------------------'
echo '           '
date -u
echo '           '
sudo apt update
sudo apt -yf dist-upgrade
sudo apt upgrade -y
sudo apt -y --purge autoremove
sudo apt autoclean
#pihole -g -up
#pihole -up
echo 'Raspberry updated now rebooting'
echo '----------------------------------'
sudo reboot
" > home/pi/Update/update.sh
sudo chmod +x /home/pi/Update/update.sh
crontab -l | { cat; echo "0 5 * * 1 /home/pi/Update/update.sh"; } | crontab -