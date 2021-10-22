#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "           \e[1;31m\e[1;31m═[\e[mCLOUDFLARE\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Add domain or subdomain to VPS"
echo -e " 2\e[1;33m)\e[m  Add domain or subdomain for CloudFlare acc"
echo -e " 3\e[1;33m)\e[m  Add CloudFlare account"
echo -e " 4\e[1;33m)\e[m  Pointing bug IP to your subdomain"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-4 or x] :  "  cloudflare
echo -e ""
case $cloudflare in
1)
add
;;
2)
cfd
;;
3)
cff
;;
4)
cfh
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
