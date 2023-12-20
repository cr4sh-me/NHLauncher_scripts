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

apt install -y libnl-3-dev libnl-genl-3-dev tlp python3-pyudev python3-evdev libsystemd-dev libglib2.0-dev libbluetooth-dev set wapiti sqlsus libswitch-perl pdf-parser pdfid sleuthkit jadx davtest golang evilginx2 imagemagick ghostscript python3 build-essential p0f spiderfoot dmitry netdiscover nmap ike-scan recon-ng amass dnsenum dnsmap dnsrecon dnstracer dnswalk fierce urlcrazy firewalk fragrouter ftester lbd wafw00f arping fping hping3 masscan ncat unicornscan theharvester twofi 0trace intrace irpas netmask enum4linux nbtscan smbmap smtp-user-enum swaks braa onesixtyone snmp ssldump sslscan tlssled lynis peass afl++ unix-privesc-check nikto bed gvm cisco-auditing-tool cisco-global-exploiter exploitdb cisco-ocs cisco-torch copy-router-config ohrwurm sfuzz siparmyknife spike dhcpig iaxflood inviteflood siege slowhttptest t50 thc-ipv6 enumiax protos-sip rtpbreak rtpflood rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipsak sipvicious voiphopper skipfish httrack sqlmap wpscan commix wfuzz jboss-autopwn joomscan apache-users cutycapt dirb dirbuster ffuf apache-users hcxtools tnscmd10g sidguesser oscanner sqlninja mdbtools hydra rcracki-mt medusa crunch john wordlists hashcat ncrack cewl chntpw fcrackzip hashid hash-identifier samdump2 sipcrack sucrack truecrack patator passing-the-hash pack rsmangler cowpatty freeradius-wpe pixiewps reaver kismet mdk3 mdk4 wifite asleap bully aircrack-ng eapmd5pass wifi-honey spooftooph bluelog blueranger bluesnarfer btscanner crackle redfang ubertooth mfcuk mfoc mfterm libfreefare-bin libnfc-bin chirp rfcat apktool dex2jar clang rizin radare2 beef-xss msfpc metasploit-framework crackmapexec termineter minicom ettercap-text-only hamster-sidejack bettercap macchanger responder dnschef isr-evilgrade yersinia netsniff-ng tshark sslsniff darkstat dsniff hexinject tcpflow fiked rebind sniffjoke sslsplit tcpreplay python3-impacket powersploit powershell-empire backdoor-factory mimikatz evil-winrm proxychains4 nishang exe2hexbat weevely dbd sbd dns2tcp iodine miredo proxytunnel ptunnel pwnat sslh stunnel4 udptunnel laudanum webacoo yara unhide rkhunter foremost ssdeep autopsy galleta bulk-extractor chkrootkit binwalk hashdeep cutycapt metagoofil pipal

# Clone tools from github

cd /root

# OneShot

rm -r -f OneShot
git clone https://github.com/drygdryg/OneShot

# Z-Phisher

rm -r -f zphisher
git clone --depth=1 https://github.com/htr-tech/zphisher
cd zphisher
chmod +x zphisher.sh 
cd /root

# Modlishka

rm -r -f Modlishka
git clone https://github.com/drk1wi/Modlishka
cd Modlishka
make
cd /root

# PRET

rm -r -f PRET
git clone https://github.com/RUB-NDS/PRET
apt install python3-colorama python3-pysmi python3-pysnmp4

# Gophish

git clone https://github.com/gophish/gophish
cd gophish
go build
cd /root

# Maskphish

git clone https://github.com/jaykali/maskphish

printf "\n\e[1;33m[i] Setup completed! Closing in 5s...\e[0m\n"
sleep 5
