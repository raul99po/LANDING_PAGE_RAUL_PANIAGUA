#!/bin/bash
clear
while true; do
echo "Desarrollé un script para monitorizar el estado de un proceso que te envia las notificaciones por correo electrónico."
sleep 3
read -p "Ingrese el nombre del proceso a monitorizar: " PROCESO
sleep 3
read -p "Ingrese la ruta del archivo de log: " LOG
sleep 3
read -p "Ingrese el correo para notificaciones: " EMAIL
FECHA=$(date '+%Y-%m-%d %H:%M:%S')
enviar_alerta() {
SUBJECT="[$FECHA] Alerta: Proceso $PROCESO reiniciado"
BODY="El proceso $PROCESO se ha reiniciado automáticamente en el servidor $(hostname) el $FECHA."
echo "$BODY" | mail -s "$SUBJECT" $EMAIL
}
reiniciar_proceso() {
echo "[$FECHA] Reiniciando el proceso $PROCESO..." | tee -a $LOG
sudo systemctl start $PROCESO
if [ $? -eq 0 ]; then
echo "[$FECHA] Proceso $PROCESO reiniciado con éxito." | tee -a $LOG enviar_alerta
else
echo "[$FECHA] Error: No se pudo reiniciar el proceso $PROCESO." | tee -a $LOG
fi
}
if pgrep -x "$PROCESO" > /dev/null; then
echo "[$FECHA] Proceso $PROCESO está en ejecución." | tee -a $LOG
else
echo "[$FECHA] Alerta: Proceso $PROCESO no está en ejecución, intentando reiniciar..." | tee -a $LOG
reiniciar_proceso
fi
sleep 10
done
