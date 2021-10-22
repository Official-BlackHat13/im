#!/bin/bash
echo "Input IP"
read -e -p "(Default: ):" user
CLIENT_EXISTS=$(grep -w $user /home/listip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "Already registered"
exit 1
fi
read -p "Expire (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$user" >> /home/vps/public_html/allowip
echo -e "### $user $exp" >> /home/listip
clear
echo "Done"
echo "Registration successfull"
echo -e "*******************************"
echo "IP          : $user"
echo "Expiry date : $exp"
echo -e "*******************************"
