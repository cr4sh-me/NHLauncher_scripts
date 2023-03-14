#!/bin/bash

clear

printf """\e[1;32m
   ▄    ▄  █ █    ██     ▄      ▄   ▄█▄     ▄  █ ▄███▄   █▄▄▄▄     
    █  █   █ █    █ █     █      █  █▀ ▀▄  █   █ █▀   ▀  █  ▄▀     
██   █ ██▀▀█ █    █▄▄█ █   █ ██   █ █   ▀  ██▀▀█ ██▄▄    █▀▀▌      
█ █  █ █   █ ███▄ █  █ █   █ █ █  █ █▄  ▄▀ █   █ █▄   ▄▀ █  █      
█  █ █    █      ▀   █ █▄ ▄█ █  █ █ ▀███▀     █  ▀███▀     █       
█   ██   ▀          █   ▀▀▀  █   ██          ▀            ▀        
                   ▀                                               
\e[0m"""

printf "\n\e[1;33m[i] Setting up NHLauncher!\e[0m\n"


# Download all tools
printf "\n\e[1;33m[i] Downloading tools...\e[0m\n"


apt update

apt install -y p0f spiderfoot dmitry netdiscover nmap ike-scan recon-ng amass dnsenum dnsmap dnsrecon dnstracer dnswalk fierce urlcrazy firewalk fragrouter ftester lbd wafw00f arping fping hping3 masscan ncat unicornscan theharvester twofi 0trace intrace irpas netmask enum4linux nbtscan smbmap smtp-user-enum swaks braa onesixtyone snmp ssldump sslscan sslyze tlssled lynis peass afl unix-privesc-check nikto bed gvm cisco-auditing-tool cisco-global-exploiter exploitdb cisco-ocs cisco-torch copy-router-config ohrwurm sfuzz siparmyknife spike dhcpig iaxflood inviteflood siege slowhttptest t50 thc-ipv6 enumiax protos-sip rtpbreak rtpflood rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipsak sipvicious voiphopper skipfish httrack sqlmap wpscan commix wfuzz jboss-autopwn joomscan apache-users cutycapt dirb dirbuster ffuf plecost watobo apache-users tnscmd10g sidguesser oscanner sqlninja mdbtools rainbowcrack hydra rcracki-mt medusa crunch john wordlists hashcat ncrack cewl chntpw cmospwd fcrackzip hashid hash-identifier samdump2 sipcrack sucrack truecrack patator passing-the-hash pack rsmangler cowpatty freeradius-wpe pixiewps reaver kismet mdk3 mdk4 wifite asleap bully aircrack-ng eapmd5pass wifi-honey spooftooph bluelog blueranger bluesnarfer btscanner crackle redfang ubertooth mfcuk mfoc mfterm libfreefare-bin libnfc-bin chirp rfcat apktool dex2jar clang rizin radare2 beef-xss msfpc shellnoob metasploit-framework crackmapexec termineter minicom ettercap-text-only hamster-sidejack bettercap macchanger responder dnschef isr-evilgrade yersinia netsniff-ng tshark sslsniff darkstat dsniff hexinject tcpflow fiked rebind sniffjoke sslsplit tcpreplay python3-impacket powersploit powershell empire veil backdoor-factory mimikatz evil-winrm proxychains4 nishang exe2hexbat weevely cymothoa dbd sbd dns2tcp iodine miredo proxytunnel ptunnel pwnat sslh stunnel4 udptunnel laudanum webacoo yara unhide rkhunter foremost ssdeep autopsy galleta bulk-extractor chkrootkit binwalk hashdeep cutycapt dradis eyewitness metagoofil pipal

# Clone tools from github

cd /root

# OneShot

git clone https://github.com/drygdryg/OneShot

# EvilGinx2

git clone https://github.com/kgretzky/evilginx2
cd evilginx2
make
cd /root

# Z-Phisher

git clone --depth=1 https://github.com/htr-tech/zphisher
cd zphisher
chmod +x zphisher.sh 
cd /root


# Modlishka

git clone https://github.com/drk1wi/Modlishka
cd Modlishka
make
cd /root

printf "\n\e[1;33m[i] Setup completed! Closing in 5s...\e[0m\n"
sleep 5
exit 0



