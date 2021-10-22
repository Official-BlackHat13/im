#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear 
cat /usr/bin/banner | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(TZ='Asia/Bangkok' date +%R)
hari=$(date +"%A")
tnggl=$(date +"%C %B %Y")
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "   \e[032;1mCPU Model:\e[0m $cname"
	echo -e "   \e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "   \e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "   \e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "   \e[032;1mSystem Uptime:\e[0m $up"
	echo -e "   \e[032;1mIsp Name:\e[0m $ISP"
	echo -e "   \e[032;1mCity:\e[0m $CITY"
	echo -e "   \e[032;1mTZ:\e[0m $WKT"
	echo -e "   \e[032;1mIP:\e[0m $IPVPS"
        echo -e "   \e[032;1mTime\e[0m $jam"
	echo -e "   \e[032;1mDay:\e[0m $hari"
        echo -e "   \e[032;1mDate:\e[0m $tnggl"
echo -e  ""
echo -e  "   ------------------------------{PANEL MENU}--------------------------" | lolcat
echo -e   "   1\e[1;33m)\e[m SSH & SSL& OpenVPN PANEL"
echo -e   "   2\e[1;33m)\e[m WIREGUARD PANEL"
echo -e   "   3\e[1;33m)\e[m VPN PANEL"
echo -e   "   4\e[1;33m)\e[m SSR & SS PANEL"
echo -e   "   5\e[1;33m)\e[m VMESS & VLESS V2RAY PANEL"
echo -e   "   6\e[1;33m)\e[m XRAY PANEL"
echo -e   "   7\e[1;33m)\e[m TROJAN & TROJAN-Go PANEL"
echo -e   "   8\e[1;33m)\e[m CLOUDFLARE PANEL"
echo -e   "   9\e[1;33m)\e[m BACKUP & RESTORE"
echo -e   "   10\e[1;33m)\e[m SYSTEM SETTING"
echo -e   "   11\e[1;33m)\e[m ADMIN PANEL"
echo -e   "  \e[1;32m------------------------------------------------------------\e[m" | lolcat
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m------------------------------------------------------------\e[m" | lolcat
echo -e   ""
read -p "     Select from options [1-11 or x] :  " menu
echo -e   ""
case $menu in
1)
menu-ssh
;;
2)
menu-wireguard
;;
3)
menu-vpn
;;
4)
menu-ssssr
;;
5) 
menu-v2ray-vless
;;
6)
menu-xray
;;
7)
menu-trojan-trojango
;;
8)
menu-cloudflare
;;
9)
menu-restorebackup
;;
10)
menu-system
;;
11)
menu-admin
;;
x)
exit
;;
*)
echo  "Please enter a correct option"
;;
esac
