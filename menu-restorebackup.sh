#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m════════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[mBACKUP AND RESTORE \e[1;31m]═\e[m" 
echo -e "\e[1;32m════════════════════════════════════════\e[m" | lolcat
echo -e "  1\e[1;33m)\e[m Autobackup data via email"
echo -e "  2\e[1;33m)\e[m Autobackup data via nginx"
echo -e "  3\e[1;33m)\e[m Backup data via email"
echo -e "  4\e[1;33m)\e[m Backup data via nginx"
echo -e "  5\e[1;33m)\e[m Restore data"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-5 or x] :  "  restorebackup
echo -e ""
case $restorebackup in
1)
autobackup
;;
2)
autonginx
;;
3) 
backup
;;
4)
bckpnginx
;;
5)
restore
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
