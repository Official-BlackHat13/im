#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[MXRAY CORE\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create account"
echo -e " 2\e[1;33m)\e[m  Delete account"
echo -e " 3\e[1;33m)\e[m  Renew account"
echo -e " 4\e[1;33m)\e[m  Check online user"
echo -e " 4\e[1;33m)\e[m  Show All user list"
echo -e " 4\e[1;33m)\e[m  Change port"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option [1-6 or x] :  "  xray
echo -e ""
case $xray in
1)
add-xray
;;
2)
del-xray
;;
3)
renew-xray
;;
4) 
cek-xray
;;
5)
list-xray
;;
6)
port-xray
;;
x) 
menu
;;
*)
echo "Please enter a correct option"
;;
esac
