#!/bin/bash
# Script para comparar logs y sincronizar archivos desde el servidor SFTP a la carpeta local

# Detalles del servidor SFTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="Camusgaladonna36!"
LOG_REMOTO="LogR.txt"
LOG_L="logL.txt"
CSYNC="/home/$(whoami)/carpetaSincronizada"

# Comparar los logs
diff -q "$LOG_REMOTO" "$LOG_L" > /dev/null 2>&1

# Si hay diferencias, descargar archivos y directorios desde el servidor SFTP
if [ $? -ne 0 ]; then
    echo "Diferencias detectadas. Sincronizando archivos y directorios..."
    
    # Cambiar al directorio local antes de descargar
    cd "$CSYNC" || { echo "No se pudo cambiar a la carpeta $CSYNC"; exit 1; }
    
    # Conectar al servidor SFTP y descargar archivos y directorios de manera recursiva
    echo "Descargando archivos y directorios desde el servidor SFTP..."
    sshpass -p "$SFTP_PASS" sftp -oPort=22 -oStrictHostKeyChecking=no "$SFTP_USER@$SFTP_SERVER" <<EOF
# Descargar todo de manera recursiva
get -r *
bye
EOF

    # Verificar si la descarga fue exitosa
    if [ $? -eq 0 ]; then
        echo "Sincronización completada. Contenido descargado:"
        ls -lR "$CSYNC"
    else
        echo "Error: No se pudieron descargar todos los archivos y directorios."
        exit 1
    fi
else
    echo "No hay diferencias. No se requiere sincronización."
fi