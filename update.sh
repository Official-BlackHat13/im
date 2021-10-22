#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/syndrexhub/im/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/syndrexhub/im/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/syndrexhub/im/main/trial.sh"
wget -O change-port "https://raw.githubusercontent.com/syndrexhub/im/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/syndrexhub/im/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/syndrexhub/im/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/syndrexhub/im/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/syndrexhub/im/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/syndrexhub/im/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/syndrexhub/im/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/syndrexhub/im/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/syndrexhub/im/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/syndrexhub/im/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/syndrexhub/im/main/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/syndrexhub/im/main/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/syndrexhub/im/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/syndrexhub/im/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/syndrexhub/im/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/syndrexhub/im/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/syndrexhub/im/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/syndrexhub/im/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/syndrexhub/im/main/del-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Succssfull Update"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
