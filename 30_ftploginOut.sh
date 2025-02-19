#!/bin/bash
#Programa para loguearse y desloguearse del servicio FTP

#Detalles del servidor FTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="{$SFTP_PASS}" #PW OCULTADA

#Log into the SFTP server
echo "ls" | sftp -oport=22  $SFTP_USER@$SFTP_SERVER

echo "FTP SESION COMPLETADA"