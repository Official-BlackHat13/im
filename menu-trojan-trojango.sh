#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "           \e[1;31m\e[1;31m═[\e[mTrojan & Trojan-Go\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create Trojan account"
echo -e " 2\e[1;33m)\e[m  Create Trojan-Go account"
echo -e " 3\e[1;33m)\e[m  Delete Trojan account"
echo -e " 4\e[1;33m)\e[m  Delete Trojan-Go account"
echo -e " 5\e[1;33m)\e[m  Renew Trojan account"
echo -e " 6\e[1;33m)\e[m  Renew Trojan-Go account"
echo -e " 7\e[1;33m)\e[m  Check Trojan's user online"
echo -e " 8\e[1;33m)\e[m  Check Trojan-Go's user online"
echo -e " 9\e[1;33m)\e[m  Change Trojan's port"
echo -e " 10\e[1;33m)\e[m  Change Trojan-Go's port"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option [1-10 or x] :  "  trojango
echo -e ""
case $trojango in
1)
tj
;;
2)
add-trgo
;;
3)
tjd
;;
4) 
del-trgo
;;
5)
tjr
;;
6)
renew-trgo
;;
7)
tjc
;;
8)
cek-trgo
;;
9)
port-tr
;;
10)
port-trgo
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
