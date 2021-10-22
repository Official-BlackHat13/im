
#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Processing"
clear
cat /usr/bin/banner | lolcat
echo -e ""
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "         \e[1;31m\e[1;31m═[\e[mVPN PANEL\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create L2TP"
echo -e " 2\e[1;33m)\e[m  Create PPTP"
echo -e " 3\e[1;33m)\e[m  create SSTP"
echo -e " 4\e[1;33m)\e[m  Delete L2TP"
echo -e " 5\e[1;33m)\e[m  Delete SSTP"
echo -e " 6\e[1;33m)\e[m  Delete PPTP"
echo -e " 7\e[1;33m)\e[m  Renew L2TP"
echo -e " 8\e[1;33m)\e[m  Renew PPTP"
echo -e " 9\e[1;33m)\e[m  Renew SSTP"
echo -e " 10\e[1;33m)\e[m  Check PPTP online user"
echo -e " 11\e[1;33m)\e[m  Check SSTP online user"
echo -e " 12\e[1;33m)\e[m  Change SSTP port"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please Input Number  [1-13 or x] :  "  l2tp
echo -e ""
case "$l2tp" in
1)
lp
;;
2)
pp
;;
3)
sp
;;
4)
lpd
;;
5)
spd
;;
6)
ppd
;;
7)
lpr
;;
8)
ppr
;;
9)
spr
;;
10)
ppc
;;
11)
spc
;;
12)
port-sstp
;;
x)
menu
;;
*)
echo "Please enter a correct option"
;;
esac
