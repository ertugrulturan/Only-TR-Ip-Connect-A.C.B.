#!/bin/bash
# NinjaNetwork / V4T1 / T13R / Ertuğrul TURAN
# WWW = https://obir.ninja/
# Only Root Run Script & Bu Arac Turk Ip Haric Tum Ulkeleri Engeller!
# TR Game Server Firewall Method

GREEN='\e[0;32m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'

exit_script()
{
  echo "PWRD BY NinjaNetwork - Obir.Ninja [CLOSE SCRIPT = CTRL+Z]"
}

installcentos()
{
	clear
	cd /root/
	echo ""
	echo -e "\033[32mKurulum başlıyor...\033[0m"
	echo ""
	echo ""
	sudo yum -y install ipset
	rm -f tr.zone
	sudo ipset destroy geoAllowIP$ulke
	wget  http://www.ipdeny.com/ipblocks/data/countries/tr.zone
	sudo ipset -N geoAllowIP nethash
	cat tr.zone | while read line
	do
		sudo ipset -A geoAllowIP $line
	done
	sudo ipset save geoAllowIP
	sudo iptables -A INPUT -m state --state NEW -m set ! --set geoAllowIP src -j DROP
	sudo iptables-save
	sudo service iptables save	
	rm -f tr.zone
	sudo
	#clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mTüm ayarlar başarıyla yapıldı. Türkiye dışı girişler iptal edildi.\033[0m"
	echo ""
	echo ""
}

installubuntu()
{
clear
touch ipler.yml
	cat ipler.yml | while read line
do
sudo iptables -A INPUT -s $line -j DROP
done
sudo iptables-save
clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mTamamdır başarıyla listedeki ip adresleri engelledi!\033[0m"
	echo ""
	echo ""
	cd /root/
	echo ""
	echo -e "\033[32mKurulum başlıyor...\033[0m"
	echo ""
	echo ""
	sudo apt-get install ipset
	rm -f tr.zone
	sudo ipset destroy geoAllowIP$ulke
	wget  http://www.ipdeny.com/ipblocks/data/countries/tr.zone
	sudo ipset -N geoAllowIP nethash
	cat tr.zone | while read line
	do
		sudo ipset -A geoAllowIP $line
	done
	sudo ipset save geoAllowIP
	sudo iptables -A INPUT -m state --state NEW -m set ! --set geoAllowIP src -j DROP
	sudo iptables-save
	sudo service iptables save	
	rm -f tr.zone
	sudo
	#clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mTüm ayarlar başarıyla yapıldı. Türkiye dışı girişler iptal edildi.\033[0m"
	echo ""
	echo ""
}

exit_script1()
{
  exit 1
}

Take_input1()
{
clear
while :
do
clear
echo -e "${WHITE}${RED}     "  
    echo -n """
Your Server Only Connect Turkish/TR Ip Adress (Blocking all foreign countries)
    """    
echo -e ""  
echo -e "" 
echo -e "${LIGHTGREEN}https://obir.ninja - NinjaNetwork    [CLOSE SCRIPT = CTRL+Z]"                
    echo -e "${WHITE}"
	echo -e "${LIGHTBLUE}[1]${PURPLE}UbuntuOS Install${LIGHTBLUE}"
    echo -e "${LIGHTBLUE}[2]${GREEN}CentOS Install${LIGHTBLUE}"
    echo "Selec(1-2);"
    read yourch
    case $yourch in
      1) installcentos ;;
      2) installubuntu ;;
      ex) echo "tier@obir.ninja - $ " ;  exit 1  ;;
      *) echo "ERROR!!" ;
         echo "[ENTER AND COU...]" ; read ;;
 esac
done 
}
trap exit_script 2
Take_input1
