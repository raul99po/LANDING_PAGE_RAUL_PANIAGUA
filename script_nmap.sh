#!/bin/bash
while true
do
clear
if ! command -v nmap &> /dev/null; then
echo "No tienes instalado nmap. Ejecuta el comando sudo apt install nmap." && exit
sleep 3
else
echo "Tienes instalado nmap, a continuación se le mostrará un menú."
sleep 3
fi
clear
echo "ADVERTENCIA: Este programa tiene que ser ejecutado en un entorno Linux y con nmap instalado."
echo "========================================= MENÚ ============================================"
echo "==========================================================================================="
echo "=========== 1. Vamos a analizar que dispositivos hay en tu red actualmente. ==============="
echo "=========== 2. Vamos a ver que puertos tienes abiertos en tu dispositivo. ================="
echo "=========== 3. Consultar memú de nmap. ===================================================="
echo "=========== 4. Salir. ====================================================================="
echo "==========================================================================================="
read option
case $option in
1)
read -p "Introduce tu dirección IP privada (añade la máscara de red): " ip
echo "Escaneando tu red... Puede que tarde unos minutos"
nmap -O $ip | grep "^Nmap scan report for"
sleep 10
;;
2)
read -p "Introduce la dirección IP del dispositivo que vas a escanear: " ip_dispositivo
nmap -sC -sV -sS -vvv -Pn -n $ip_dispositivo
sleep 10
;;
3)
echo "El menú de nmap es el siguiente:"
nmap --help
sleep 20
;;
4)
echo "Saliendo del script..."
sleep 3
exit 0
;;

esac
done

