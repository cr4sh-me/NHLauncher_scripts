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

printf "\n\e[1;33m[i] Setting up NHLauncher, please wait!\e[0m\n"

sleep 3

# Define an array of packages
packages=(
    libnl-3-dev libnl-genl-3-dev tlp python3-pyudev python3-evdev libsystemd-dev libglib2.0-dev libbluetooth-dev set wapiti sqlsus libswitch-perl pdf-parser 
    pdfid sleuthkit jadx davtest golang evilginx2 imagemagick ghostscript python3 build-essential p0f spiderfoot dmitry netdiscover nmap ike-scan recon-ng amass 
    dnsenum dnsmap dnsrecon dnstracer dnswalk fierce urlcrazy firewalk fragrouter ftester lbd wafw00f arping fping hping3 masscan ncat unicornscan theharvester twofi 0trace 
    intrace irpas netmask enum4linux nbtscan smbmap smtp-user-enum swaks braa onesixtyone snmp ssldump sslscan tlssled lynis peass afl++ unix-privesc-check 
    nikto bed gvm cisco-auditing-tool cisco-global-exploiter exploitdb cisco-ocs cisco-torch copy-router-config ohrwurm sfuzz siparmyknife spike dhcpig iaxflood 
    inviteflood siege slowhttptest t50 thc-ipv6 enumiax protos-sip rtpbreak rtpflood rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipsak sipvicious 
    voiphopper skipfish httrack sqlmap wpscan commix wfuzz jboss-autopwn joomscan apache-users cutycapt dirb dirbuster ffuf apache-users hcxtools tnscmd10g 
    sidguesser oscanner sqlninja mdbtools hydra rcracki-mt medusa crunch john wordlists hashcat ncrack cewl chntpw fcrackzip hashid hash-identifier samdump2 sipcrack 
    sucrack truecrack patator passing-the-hash pack rsmangler cowpatty freeradius-wpe pixiewps reaver kismet mdk3 mdk4 wifite asleap bully aircrack-ng eapmd5pass 
    wifi-honey spooftooph bluelog blueranger bluesnarfer btscanner crackle redfang ubertooth mfcuk mfoc mfterm libfreefare-bin libnfc-bin chirp rfcat apktool dex2jar 
    clang rizin radare2 beef-xss msfpc metasploit-framework crackmapexec termineter minicom ettercap-text-only hamster-sidejack bettercap macchanger responder dnschef 
    isr-evilgrade yersinia netsniff-ng tshark sslsniff darkstat dsniff hexinject tcpflow fiked rebind sniffjoke sslsplit tcpreplay python3-impacket powersploit 
    powershell-empire backdoor-factory mimikatz evil-winrm proxychains4 nishang exe2hexbat weevely dbd sbd dns2tcp iodine miredo proxytunnel ptunnel pwnat sslh stunnel4 
    udptunnel laudanum webacoo yara unhide rkhunter foremost ssdeep autopsy galleta bulk-extractor chkrootkit binwalk hashdeep cutycapt metagoofil pipal
    bluez bluez-tools bluez-obex libbluetooth3 sox bluetooth libglib2.0*-dev python3-dbus python3-bluez coreutils python3-colorama python3-pysmi python3-pysnmp4
)

check_and_remove() {
    pathroot="/root/$(basename $1)"
    if [[ -d $pathroot ]]; then
        rm -rf $pathroot
    fi
    printf "\n\e[1;33m[i] Installing : \e[1;92m$(basename $1)\e[0m\n"
    git clone $1 $pathroot
}

# Install missing packages
for package in "${packages[@]}"; do
    if ! dpkg -l | grep -q "$package"; then
        printf "\n\e[1;33m[i] Installing package: \e[1;92m$package\e[0m"
        apt install -qq -y "$package" > /root/nhl_installer_log 2>&1
    else
        printf "\n\e[1;33m[i] Already installed: \e[1;96m$package\e[0m"
    fi
done

# Clone tools from GitHub
cd /root

# OneShot
check_and_remove https://github.com/kimocoder/OneShot

# Z-Phisher
check_and_remove https://github.com/htr-tech/zphisher
chmod +x /root/zphisher/zphisher.sh 

# Modlishka
check_and_remove https://github.com/drk1wi/Modlishka
cd /root/Modlishka
make
cd /root

# PRET
check_and_remove https://github.com/RUB-NDS/PRET

# Gophish
check_and_remove https://github.com/gophish/gophish
cd /root/gophish
go build
cd /root

# Maskphish
check_and_remove https://github.com/jaykali/maskphish

# Setup bluetooth shit
printf "\n\e[1;33m[i] Setting up Bluetooth Toolkit, please wait!\e[0m\n"

check_and_remove https://github.com/yesimxev/carwhisperer-0.2 $carwhisperer_path
cd /root/carwhisperer
make
make install

check_and_remove https://github.com/yesimxev/bt_audit $bt_audit_path
cd /root/bt_audit/src
make
cp rfcomm_scan /usr/bin/

if [[ -f /usr/lib/libglibutil.so ]]; then 
    printf "\n\e[1;33m[i] Libglibutil is installed! %s\e[0m"
else 
    check_and_remove https://github.com/yesimxev/libglibutil $libutil_path
    cd /root/libglibutil
    make
    make install-dev
fi

if [[ -f /usr/lib/libgbinder.so ]]; then 
    printf "\n\e[1;33m[i] Libgbinder is installed! %s\e[0m"
else 
    check_and_remove https://github.com/yesimxev/libgbinder $libgbinder_path
    cd /root/libgbinder
    make
    make install-dev
fi

if [[ -f /usr/sbin/bluebinder ]]; then
    printf "\n\e[1;33m[i] Bluebinder is installed! %s\e[0m"
else 
    check_and_remove https://github.com/yesimxev/bluebinder $bluebinder_path
    cd /root/bluebinder
    make
    make install
fi

if [[ -f /root/badbt/btk_server.py ]]; then 
    printf "\n\e[1;33m[i] BadBT is installed! %s\e[0m"
else 
    check_and_remove https://github.com/yesimxev/badbt $badbt_path
    cp /root/badbt/org.thanhle.btkbservice.conf /etc/dbus-1/system.d/
fi

if [[ ! \"`grep 'noplugin=input' /etc/init.d/bluetooth`\" == \"\" ]]; then 
    printf "\n\e[1;33m[i] Bluetooth service is patched! %s\e[0m"
else 
    printf "\n\e[1;33m[i] Patching Bluetooth service... %s\e[0m"
    sed -i -e 's/# NOPLUGIN_OPTION=.*/NOPLUGIN_OPTION=\"--noplugin=input\"/g' /etc/init.d/bluetooth
fi

printf "\n\n\e[1;33m[i] Setup completed! Closing in 5s...\e[0m\n"
sleep 5
