#!/bin/sh

sudo apt update
sudo apt-get upgrade -y

#Spoof MAC address. Change to suit your needs

ifconfig eth0 down hw ether 90:09:D0:9E:13:A1
ifconfig eth0 up

#install dependencies

sudo apt-get install --yes samba \
			   python3-dev \
			   python3-pip \
			   python3-virtualenv \
			   python3-venv \
			   python3-scapy \
			   libssl-dev \
			   libpcap-dev

#Allow user management instead of external

sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED

#Start virtual env

python3 -m venv canary/
. canary/bin/activate

#Install opencanary and dependencies in virtual environment

sudo pip install opencanary
sudo pip install scapy pcapy-ng
sudo pip install samba
sudo pip install -Iv Markupsafe==2.0.1

#Create custom config file

opencanaryd --copyconfig

#Copy custom config and service files to raspberry pi

sudo cp /media/OpenCanary_Imager/opencanary.conf /etc/opencanaryd/
sudo cp /media/OpenCanary_Imager/oc.service /etc/systemd/system/
sudo cp /usr/local/bin/opencanaryd /home/admin/canary/bin/
sudo cp /usr/local/bin/opencanary.tac /home/admin/canary/bin/
sudo cp /usr/local/bin/twistd /home/admin/canary/bin/

#Change user modified config file back to original config

sudo cp /media/OpenCanary_Imager/Original_Config/opencanary.conf cp /media/OpenCanary_Imager/opencanary.conf

#Change hostname. Enable and start service.

sudo hostnamectl set-hostname SynologyBox
sudo systemctl enable oc.service
sudo systemctl start oc.service
echo ""
echo ""
ifconfig

exit 0
