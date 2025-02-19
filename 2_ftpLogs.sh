#!/bin/bash
# Programa para loguearse y desloguearse del servicio FTP

# Detalles del servidor FTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="{$SFTP_PASS}"
LOG_REMOTO="LogR.txt"

# Log into the SFTP server y guardar todo en el log
{
    echo "Iniciando sesión SFTP..."
    sshpass -p "$SFTP_PASS" sftp -oPort=22 -oStrictHostKeyChecking=no "$SFTP_USER@$SFTP_SERVER" <<EOF | grep -v '^sftp>' > "$LOG_REMOTO"
ls    
bye
EOF
    echo "FTP SESION COMPLETADA"
}