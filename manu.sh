#!/bin/bash
clear 
echo -e "" 
echo -e "*****************************************************************"
echo -e "                Server Information"
echo -e "*****************************************************************"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

echo -e " CPU Model     : $cname"
echo -e " Core          : $cores"
echo -e " CPU Frequency : $freq MHz"
echo -e " RAM           : $tram MB"
echo -e " System Uptime : $up"
echo -e " Isp Name      : $ISP"
echo -e " City          : $CITY"
echo -e " Time          : $WKT"
echo -e " IPVPS         : $IPVPS" 
echo -e ""
echo -e "*****************************************************************"
echo -e "* menu/thmenu  : List of Commands"
echo -e "*****************************************************************"
echo -e "                        {SSH SSL SSH-WS & OpenVPN}"
echo -e "* new          : Create account"
echo -e "* trial        : Create trial account"
echo -e "* renew        : Renew account"
echo -e "* pass         : Change password"
echo -e "* deluser      : Delete account"
echo -e "* check        : Check online user"
echo -e "* user         : list of all user"
echo -e "* delete       : Delete expired account"
echo -e "* autokill     : Setup autokill feature"
echo -e "* multi        : Display multi-login user"
echo -e "* restart      : Restart services" 
echo -e "*****************************************************************"
echo -e "                       {SHADOWSOCK-R}"
echo -e "* ssr          : Create account"
echo -e "* ssrd         : Delete account"
echo -e "* ssrr         : Renew account"
echo -e "* more         : Show more SSR menu"
echo -e "*****************************************************************"
echo -e "                       {SHADOWSOCK-S OBFS}"
echo -e "* ss           : Create account"
echo -e "* sd           : Delete account"
echo -e "* sr           : Renew account"
echo -e "* sc           : Check online user"
echo -e "*****************************************************************"
echo -e "                       {TROJAN}"
echo -e "* tj           : Create account"
echo -e "* tjd          : Delete account"
echo -e "* tjr          : Renew account"
echo -e "* tjc          : Check online user"
echo -e "*****************************************************************"
echo -e "                       {VPN}"
echo -e "* lp           : Creating L2TP account"
echo -e "* pp           : Create PPTP account"
echo -e "* sp           : Create SSTP account"
echo -e "* lpd          : Delete L2TP account"
echo -e "* spd          : Delete SSTP account"
echo -e "* ppd          : Delete PPTP account"
echo -e "* lpr          : Renew L2TP account"
echo -e "* ppr          : Renew PPTP account"
echo -e "* spr          : Renew SSTP account"
echo -e "* ppc          : Check PPTP login account"
echo -e "* spc          : Check SSTP login account"
echo -e "*****************************************************************"
echo -e "                       {V2RAY WS}"
echo -e "* vr           : Create account"
echo -e "* vrd          : Delete account"
echo -e "* vrr          : Renew account"
echo -e "* vrc          : Check online user"
echo -e "*****************************************************************"
echo -e "                       {VLESS WS}"
echo -e "* vs           : Create account"
echo -e "* vsd          : Delete account"
echo -e "* vsr          : Renew account"
echo -e "* vsc          : Check online user"
echo -e "*****************************************************************"
echo -e "                       {WIREGUARD}"
echo -e "* wg           : Create account"
echo -e "* wgd          : Delete dccount"
echo -e "* wgr          : Renew account"
echo -e "* wgc          : Check online user"
echo -e "*****************************************************************"
echo -e "*                      {XRAY PANEL}"
echo -e "* xray         : Create account"
echo -e "* xrd          : Delete account"
echo -e "* xrc          : Check online user"
echo -e "* xrr          : Renew account"
echo -e "* xrl          : List of XRAY user acount"
echo -e "* xri          : Account info"
echo -e "*****************************************************************"
echo -e "                       {CLOUDFLARE PANEL}"
echo -e "* add          : Add or change subdomain"
echo -e "* cff          : Add CF account"
echo -e "* cfh          : Add CF domain or subdomain"
echo -e "*****************************************************************"
echo -e "                       {IP PANEL}"
echo -e "* ip           : Add permission IP"
echo -e "* ipd          : Delete permission IP"
echo -e "* showip       : show all permission IP"
echo -e "* for admin only"
echo -e "*****************************************************************"
echo -e "                       {BACKUP & RESTORE}"
echo -e "* auto         : Auto backup VPS data"
echo -e "* autonginx    : Auto backup data via NGINX"
echo -e "* backupnginx  : Backup data via NGINX"
echo -e "* backup       : Backup VPS data"
echo -e "* restore      : restore VPS data"
echo -e "*****************************************************************"
echo -e "                       {SYSTEM}"
echo -e "* bbr          : Install BBR"
echo -e "* cert         : Renew v2ray certificate"
echo -e "* exit         : Exit"
echo -e "* info         : Display system-information"
echo -e "* kernel       : Update kernel"
echo -e "* limit        : Limit bandwith speed"
echo -e "* port         : Change service port"
echo -e "* pointing     : Pointing VPS"
echo -e "* ram          : Check current RAM usage"
echo -e "* reboot       : Reboot"
echo -e "* services     : Show services status"
echo -e "* swap         : Swap KVM for ram below than 1 GB"
echo -e "* speedtest    : Test server speed"
echo -e "* update       : Update script"
echo -e "* vnstat       : Monitor Bandwith usage"
echo -e "* web          : Install webmin"
echo -e "* wildcard     : Wildcard domain"
echo -e " The way to get started is to quit talking and begin doing" 
echo -e "*****************************************************************"
echo -e " Copyright ©AJ"
echo -e ""
