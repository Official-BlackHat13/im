#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e ""
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e "     \e[1;31m\e[1;31m═[\e[mSSH & SSL & OpenVPN PANEL\e[1;31m]═\e[m" 
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create account"
echo -e " 2\e[1;33m)\e[m  Create trial account"
echo -e " 3\e[1;33m)\e[m  Renew account"
echo -e " 4\e[1;33m)\e[m  Delete account"
echo -e " 5\e[1;33m)\e[m  Change password"
echo -e " 5\e[1;33m)\e[m  Check online user"
echo -e " 6\e[1;33m)\e[m  list of all user"
echo -e " 7\e[1;33m)\e[m  Delete expired account"
echo -e " 8\e[1;33m)\e[m  Setup autokill feature"
echo -e " 9\e[1;33m)\e[m  Display multi-login user"
echo -e " 10\e[1;33m)\e[m Restart services"
echo -e " 11\e[1;33m)\e[m Change Stunnel port"
echo -e " 12\e[1;33m)\e[m Change OVPN port"
echo -e " 13\e[1;33m)\e[m Change Squid port" 
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please select from option  [1-13 or x] :  "  ssh
echo -e ""
case $ssh in
1)
new
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
password
;;
6)
check
;;
7)
user
;;
8)
delete
;;
9)
multi
;;
10)
restart
;;
11)
port-ssl
;;
12)
port-ovpn
;;
13)
port-squid
;;
x)
exit
;;
*)
echo "Please enter a correct option"
;;
esac
