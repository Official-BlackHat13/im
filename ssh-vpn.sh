#!/bin/bash
# By jAvaNet
#
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=TH
state=Thailand
locality=Thailand
organization=www.aj-net.com
organizationalunit=www.aj-net.com
commonname=jAvaNet
email=sydjaja007@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://github.com/syndrexhub/im/raw/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd
echo 'get ssh ws'
wget -q -O /usr/local/bin/ssh-ws "https://github.com/syndrexhub/im/raw/main/direct.py" && chmod +x /usr/local/bin/ssh-ws
sed -i "s/YouKnowMe/22/g" /usr/local/bin/ssh-ws
echo 'get ssh ws ssl'
wget -q -O /usr/local/bin/ssh-ws-ssl "https://github.com/syndrexhub/im/raw/main/direct.py" && chmod +x /usr/local/bin/ssh-ws
sed -i "s/YouKnowMe/143/g" /usr/local/bin/ssh-ws-ssl
echo 'get ssh ws ovpn'
wget -q -O /usr/local/bin/ssh-ws-ovpn "https://github.com/syndrexhub/im/raw/main/direct.py" && chmod +x /usr/local/bin/ssh-ws
sed -i "s/YouKnowMe/443/g" /usr/local/bin/ssh-ws-ovpn

# Installing Service
cat > /etc/systemd/system/sshws.service << END
[Unit]
Description=Switching Protocols
Documentation=www.aj-net.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ssh-ws 2082
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

cat > /etc/systemd/system/sshwstls.service << END
[Unit]
Description=Switching Protocols
Documentation=www.aj-net.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ssh-ws-ssl 800
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

cat > /etc/systemd/system/sshwsovpn.service << END
[Unit]
Description=Switching Protocols
Documentation=www.aj-net.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ssh-ws-ovpn 2084
Restart=on-failure

[Install]
WantedBy=multi-user.target
END


# Install OHP server
echo 'Installing ohpserver'
wget -q -O /usr/bin/ohp https://github.com/syndrexhub/im/raw/main/ohp && chmod +x /usr/bin/ohp

# Setup ohpserver http
echo 'Setup ohpserver'
cat > /etc/systemd/system/ohpssh.service << END
[Unit]
Description=Daemonize OpenHTTP Puncher Server
Wants=network.target
After=network.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/ohp -port 8181 -proxy 127.0.0.1:8080 -tunnel 127.0.0.1:22
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Setup ohpserver openvpn
echo 'Setup ohpserver'
cat > /etc/systemd/system/ohpovpn.service << END
[Unit]
Description=Daemonize OpenHTTP Puncher Server
Wants=network.target
After=network.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/ohp -port 8282 -proxy 127.0.0.1:8080 -tunnel 127.0.0.1:443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END


# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Your SSH Banner
SSH_Banner='https://github.com/syndrexhub/im/raw/main/issue.net'

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://github.com/syndrexhub/im/raw/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://github.com/syndrexhub/im/raw/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://github.com/syndrexhub/im/raw/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i '/Port 22/a Port 88' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://github.com/syndrexhub/im/raw/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 444
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:22

[openvpn]
accept = 442
connect = 127.0.0.1:1194

[wsstunnel]
accept = 2083
connect = 800

END
# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

cd
#install sslh
apt-get install sslh -y

#konfigurasi
#port 443 to 77 and 777
wget -O /etc/default/sslh "https://github.com/syndrexhub/im/raw/main/sslh.conf"
service sslh restart

#install badvpncdn
wget https://github.com/ambrop72/badvpn/archive/master.zip
unzip master.zip
cd badvpn-master
mkdir build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
sudo make install

END

#OpenVPN
wget https://github.com/syndrexhub/im/raw/main/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# install python
apt -y install ruby
gem install lolcat
apt -y install figlet
apt -y install dos2unix

# download script
cd /usr/bin
# download script
cd /usr/bin
wget -O add "https://github.com/syndrexhub/im/raw/main/add-host.sh"
wget -O menu "https://github.com/syndrexhub/im/raw/main/menu.sh"
wget -O tmenu "https://github.com/syndrexhub/im/raw/main/tmenu.sh"
wget -O new "https://github.com/syndrexhub/im/raw/main/usernew.sh"
wget -O trial "https://github.com/syndrexhub/im/raw/main/trial.sh"
wget -O del "https://github.com/syndrexhub/im/raw/main/hapus.sh"
wget -O user "https://github.com/syndrexhub/im/raw/main/member.sh"
wget -O deluser "https://github.com/syndrexhub/im/raw/main/delete.sh"
wget -O check "https://github.com/syndrexhub/im/raw/main/cek.sh"
wget -O restart "https://github.com/syndrexhub/im/raw/main/restart.sh"
wget -O speedtest "https://github.com/syndrexhub/im/raw/main/speedtest_cli.py"
wget -O info "https://github.com/syndrexhub/im/raw/main/info.sh"
wget -O ram "https://github.com/syndrexhub/im/raw/main/ram.sh"
wget -O renew "https://github.com/syndrexhub/im/raw/main/renew.sh"
wget -O autokill "https://github.com/syndrexhub/im/raw/main/autokill.sh"
wget -O multi "https://github.com/syndrexhub/im/raw/main/ceklim.sh"
wget -O tendang "https://github.com/syndrexhub/im/raw/main/tendang.sh"
wget -O clear-log "https://github.com/syndrexhub/im/raw/main/clear-log.sh"
wget -O port "https://github.com/syndrexhub/im/raw/main/change.sh"
wget -O port-ovpn "https://github.com/syndrexhub/im/raw/main/port-ovpn.sh"
wget -O port-ssl "https://github.com/sybdrexhub/im/raw/main/port-ssl.sh"
wget -O port-wg "https://github.com/syndrexhub/im/raw/main/port-wg.sh"
wget -O port-tr "https://github.com/syndrexhub/im/raw/main/port-tr.sh"
wget -O port-squid "https://github.com/syndrexhub/im/raw/main/port-squid.sh"
wget -O port-ws "https://github.com/syndrexhub/im/raw/main/port-ws.sh"
wget -O port-vless "https://github.com/syndrexhub/im/raw/main/port-vless.sh"
wget -O web "https://github.com/syndrexhub/im/raw/main/webmin.sh"
wget -O xp "https://github.com/syndrexhub/im/raw/main/xp.sh"
wget -O kernel "https://github.com/syndrexhub/im/raw/main/kernel-update.sh"
wget -O update "https://github.com/syndrexhub/im/raw/main/update.sh"
wget -O pointing "https://github.com/syndrexhub/im/raw/main/pointing.sh" 
wget -O swap "https://github.com/syndrexhub/im/raw/main/swapkvm.sh" 
wget -O cfh "https://github.com/syndrexhub/im/raw/main/cfh.sh" 
wget -O cff "https://github.com/syndrexhub/im/raw/main/cff.sh" 
wget -O cfd "https://github.com/syndrexhub/im/raw/main/cfd.sh" 
wget -O bbr "https://github.com/syndrexhub/im/raw/main/bbr.sh" 
wget -O service "https://github.com/syndrexhub/im/raw/main/services.sh" 
wget -O wildcard "https://github.com/syndrexhub/im/raw/main/wildcard.sh" 
wget -O password "https://github.com/syndrexhub/im/raw/main/password.sh" 
wget -O menu-admin "https://github.com/syndrexhub/im/raw/main/menu-admin.sh"
wget -O menu-cloudflare "https://github.com/syndrexhub/im/raw/main/menu-cloudflare.sh" 
wget -O menu-restorebackup "https://github.com/syndrexhub/im/raw/main/menu-restorebackup.sh" 
wget -O menu-ssh "https://github.com/syndrexhub/im/raw/main/menu-ssh.sh" 
wget -O menu-ssssr "https://github.com/syndrexhub/im/raw/main/menu-ssssr.sh" 
wget -O menu-system "https://github.com/syndrexhub/im/raw/main/menu-system.sh" 
wget -O menu-v2ray-vless "https://github.com/syndrexhub/im/raw/main/menu-v2ray-vless.sh" 
wget -O menu-vpn "https://github.com/syndrexhub/im/raw/main/menu-vpn.sh"
wget -O menu-wireguard "https://github.com/syndrexhub/im/raw/main/menu-wireguard.sh" 
wget -O menu-xray "https://github.com/syndrexhub/im/raw/main/menu-xray.sh" 
wget -O banner "https://github.com/syndrexhub/im/raw/main/banner" 
 
chmod +x add
chmod +x menu
chmod +x tmenu
chmod +x new
chmod +x trial
chmod +x del
chmod +x user
chmod +x deluser
chmod +x check
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x autokill
chmod +x tendang
chmod +x multi
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x web
chmod +x xp
chmod +x kernel
chmod +x update
chmod +x pointing
chmod +x swap
chmod +x cff
chmod +x cfh
chmod +x cfd
chmod +x bbr
chmod +x service
chmod +x wilcard
chmod +x password
chmod +x menu-admin
chmod +x menu-cloudflare
chmod +x menu-restorebackup
chmod +x menu-ssh
chmod +x menu-ssssr
chmod +x menu-system
chmod +x menu-v2ray-vless
chmod +x menu-vpn
chmod +x menu-wireguard
chmod +x menu-xray
chmod +x banner
echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
systemctl daemon-reload
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart

systemctl enable squid3
systemctl restart squid3
systemctl enable sshws
systemctl restart sshws
systemctl enable sshwstls
systemctl restart sshwstls
systemctl enable sshwsovpn
systemctl restart sshwsovpn
systemctl enable ohpssh
systemctl start ohpssh
systemctl enable ohpovpn
systemctl start ohpovpn

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
