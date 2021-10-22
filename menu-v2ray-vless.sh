#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[mV2RAY Core Panel\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create Vmess Websocket account"
echo -e " 2\e[1;33m)\e[m  Create Vless Websocket account"
echo -e " 3\e[1;33m)\e[m  Renew Vmess account"
echo -e " 4\e[1;33m)\e[m  Renew Vless account"
echo -e " 5\e[1;33m)\e[m  Delete Vmess Websocket account"
echo -e " 6\e[1;33m)\e[m  Delete Vless Websocket account"
echo -e " 7\e[1;33m)\e[m  Check Vmess and Vless online user"
echo -e " 8\e[1;33m)\e[m  Change Vmess Websocket port"
echo -e " 9\e[1;33m)\e[m  Change Vless Websocket port"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-9 or x] :  "  v2ray
echo -e ""
case $v2ray in
1)
vr
;;
2)
vs
;;
3)
vrr
;;
4) 
vsr
;;
5)
vrd
;;
6)
vsd
;;
7)
vrc
;;
8)
port-ws
;;
9)
port-vless
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
