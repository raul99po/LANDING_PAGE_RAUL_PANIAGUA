#!/bin/bash

# Para dar los permisos para este archivo hay que ejecutar "chmod a+x actividad4.sh" si se ejecuta en modo administrador, de lo contrario será "sudo chmod a+x actividad4.sh"

# La orden que ejecuta el script en la línea de comandos sería “./actividad4.sh”

clear

echo "======================================================"
echo "======================= MENÚ: ========================"
echo "======================================================"
echo "======================================================"
echo "=== 1. Comprobar si un archivo de texto está vacío. =="
echo "=== 2. Comprobar si dos números son distintos. ======="
echo "=== 3. Mostrar la ruta del directorio actual. ========"
echo "=== 4. Salir. ========================================"
echo "======================================================"
echo "======================================================"

read opcion
case $opcion in

1)
read -p "Ingrese la ruta del archivo:"

if [ -s "$ruta" ]
then

echo "El archivo está vacío"

else

echo "El archivo no está vacío"

fi
;;

2)

read -p "Introduce dos números: " num_1 num_2

if [ "$num_1" -ne "$num_2" ]
then

echo "Los números son distintos"

else

echo "Los números no son distintos"

fi

;;

3)

pwd

;;

4)

exit 0

;;

esac
