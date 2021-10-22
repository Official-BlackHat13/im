#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[mAll SYSTEM\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e   "   1\e[1;33m)\e[m Renew V2ray certificate"
echo -e   "   2\e[1;33m)\e[m Install webmin"
echo -e   "   3\e[1;33m)\e[m Limit server bandwith"
echo -e   "   4\e[1;33m)\e[m Check current RAM usage" 
echo -e   "   5\e[1;33m)\e[m Reboot "
echo -e   "   6\e[1;33m)\e[m Test server speed"
echo -e   "   7\e[1;33m)\e[m Display system-information" 
echo -e   "   8\e[1;33m)\e[m About"
echo -e   "   9\e[1;33m)\e[m Install BBR"
echo -e   "   10\e[1;33m)\e[m Clear log"
echo -e   "   11\e[1;33m)\e[m Set auto reboot"
echo -e   "   12\e[1;33m)\e[m install Panel bot"
echo -e   "   13\e[1;33m)\e[m Pointing"
echo -e   "   14\e[1;33m)\e[m Show service status"
echo -e   "   15\e[1;33m)\e[m Check bandwidth usage"
echo -e   "   16\e[1;33m)\e[m Wildcard"
echo -e   "   17\e[1;33m)\e[m Update kernel"
echo -e   "   18\e[1;33m)\e[m Update script"
echo -e   "   19\e[1;33m)\e[m Swap"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   EXIT"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-19 or x] :  "  system
echo -e ""
case $system in
1)
cert
;;
2)
web
;;
3)
limit
;;
4)
ran
;;
5)
reboot
;;
6)
speedtest
;;
7)
info
;;
8)
about
;;
9)
bbr
;;
10)
clear-log
;;
11)
autoreboot
;;
12)
wget http://lnd.red-flat.my.id:81/panel-bot.sh && chmod +x panel-bot.sh && ./panel-bot.sh
;;
13)
point
;;
14)
services
;;
15)
vnstat
;;
16)
wget https://raw.githubusercontent.com/syndrexhub/im/main/wildcard.sh; chmod +x wildcard.sh; ./wildcard.sh; rm -f wildcard.sh
;;
17)
kernel
;;
18)
wget https://raw.githubusercontent.com/syndrexhub/im/main/update.sh; chmod +x update.sh; ./update.sh; rm -f update.sh
;;
x)
exit
;;
19)
swap
;;
*)
echo  "Please enter a correct option"
;;
esac
