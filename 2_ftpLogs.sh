#!/bin/bash
# Programa para loguearse y desloguearse del servicio FTP

# Detalles del servidor FTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="{$SFTP_PASS}"  # Contraseña en el script
LOG_REMOTO="LogR.txt"

# Log into the SFTP server y guardar todo en el log
{
    echo "Iniciando sesión SFTP..."
    sshpass -p "$SFTP_PASS" sftp -oPort=22 -oStrictHostKeyChecking=no "$SFTP_USER@$SFTP_SERVER" <<EOF
ls    
#bye
EOF
bye
    echo "FTP SESION COMPLETADA"
} > "$LOG_REMOTO" #2>&1 me quita el output de pantalla 
