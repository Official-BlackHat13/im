#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://github.com/syndrexhub/im/raw/main/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user zahyybackupvps@gmail.com
from zahyybackupvps@gmail.com
password wgbseagffyrthnyc
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://github.com/syndrexhub/im/raw/main/autobackup.sh"
wget -O backup "https://github.com/syndrexhub/im/raw/main/backup.sh"
wget -O bckp "https://github.com/syndrexhub/im/raw/main/bckp.sh"
wget -O restore "https://github.com/syndrexhub/im/raw/main/restore.sh"
wget -O strt "https://github.com/syndrexhub/im/raw/main/strt.sh"
wget -O limit "https://github.com/syndrexhub/im/raw/main/limit-speed.sh"
wget -O autonginx "https://github.com/syndrexhub/im/raw/main/limit-speed.sh"
wget -O backupnginx "https://github.com/syndrexhub/im/raw/main/limit-speed.sh"
wget -O menu-trojan-trojango "https://github.com/syndrexhub/im/raw/main/menu-trojan-trojango.sh"  
wget -O addip "https://github.com/syndrexhub/im/raw/main/addip.sh" 
wget -O delip "https://github.com/syndrexhub/im/raw/main/delip.sh" 
wget -O xp-ip "https://github.com/syndrexhub/im/raw/main/xp-ip.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit
chmod +x autonginx
chmod +x backupnginx
chmod +x menu-trojan-trojango
chmod +x addip
chmod +x delip
chmod +x xp-ip
cd
rm -f /root/set-br.sh

