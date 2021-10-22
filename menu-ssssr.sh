#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "           \e[1;31m\e[1;31m═[\e[mSSR & SS Account\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create SSR account"
echo -e " 2\e[1;33m)\e[m  Create Shadowsocks account"
echo -e " 3\e[1;33m)\e[m  Delete SSR account"
echo -e " 4\e[1;33m)\e[m  Delete Shadowsocks account"
echo -e " 5\e[1;33m)\e[m  Renew SSR account "
echo -e " 6\e[1;33m)\e[m  Renew Shadowsocks account"
echo -e " 7\e[1;33m)\e[m  Check Shadowsock online user"
echo -e " 8\e[1;33m)\e[m  Show more SSR menu"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-8 or x] :  "  ssssr
echo -e ""
case $ssssr in
1)
ssr
;;
2)
ss
;;
3)
ss
;;
4)
sd
;;
5)
ssrr
;;
6)
sr
;;
7)
sc
;;
8)
more
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
