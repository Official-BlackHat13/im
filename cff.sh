#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Processing"
cd /root
echo "
                             _---__
                          _-       /--______
                     __--( /     \ )XXXXXXXXXXX\v.
                   .-XXX(   O   O  )XXXXXXXXXXXXXXX-
                  /XXX(       U     )        XXXXXXX
                /XXXXX(              )--_  XXXXXXXXXXX
               /XXXXX/ (      O     )   XXXXXX   \XXXXX
               XXXXX/   /            XXXXXX   \__ \XXXXX
              XXXXXX__/          XXXXXX         \__---->
      ---___  XXX__/          XXXXXX      \__         /
         \-  --__/   ___/\  XXXXXX            /  ___--/=
          \-\    ___/    XXXXXX              '--- XXXXXX
            \-\/XXX\ XXXXXX                      /XXXXX
               \XXXXXXXXX   \                    /XXXXX/
                \XXXXXX      >                 _/XXXXX/
                  \XXXXX--__/              __-- XXXX/
                   -XXXXXXXX---------------  XXXXXX-
                      \XXXXXXXXXXXXXXXXXXXXXXXXXX/
                       ''VXXXXXXXXXXXXXXXXXXV''"
echo -e ""
echo -e ""
echo "==================================="
echo "     ADD CLOUDFLARE ACCOUNT    "
echo "==================================="
echo -e ""
read -e -p " Please insert your Cloudflare email:" CF_ID
read -e -p " Please insert your Cloudflare API key:" CF_KEY
echo -e ""
CF_ID=${CF_ID}
CF_KEY=${CF_KEY}
echo $CF_ID > /root/mail1.conf
echo $CF_KEY > /root/mail2.conf
cd
clear
echo ""
echo "DONE...!"     
echo ""
echo "====================================="
echo "     Your Cloudflare Information     "
echo "====================================="
echo "Email          : ${CF_ID}"
echo "Api Key        : ${CF_KEY}"
echo "====================================="
echo ""
