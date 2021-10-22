#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "           \e[1;31m\e[1;31m═[\e[mADMIN PANEL\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Add client IP"
echo -e " 2\e[1;33m)\e[m  Delete Client IP"
echo -e " 3\e[1;33m)\e[m  Show All client IP"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-3 or x] :  "  cloudflare
echo -e ""
case $cloudflare in
1)
addip
;;
2)
delip
;;
3)
xp-ip
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
