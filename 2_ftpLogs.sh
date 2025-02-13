#!/bin/bash
# Programa para loguearse y desloguearse del servicio FTP

# Detalles del servidor FTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="Camusgaladonna36!"  # Contraseña en el script
LOG_LOCAL="LogL.txt"

# Log into the SFTP server y guardar todo en el log
{
    echo "Iniciando sesión SFTP..."
    sshpass -p "$SFTP_PASS" sftp -oPort=22 -oStrictHostKeyChecking=no "$SFTP_USER@$SFTP_SERVER" <<EOF
ls    
#bye
EOF
bye
    echo "FTP SESION COMPLETADA"
} > "$LOG_LOCAL" #2>&1 me quita el output de pantalla 
