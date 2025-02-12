#!/bin/bash
#Programa para loguearse y desloguearse del servicio FTP

#Detalles del servidor FTP
SFTP_SERVER="us-east-1.sftpcloud.io"
SFTP_USER="fedenatt"
SFTP_PASS="Camusgaladonna36!"

#Log into the SFTP server

#primero tiene que hacer el login y no tiene que pedir password, si estan guardadas en variables, no deberia pedirla el ejecutar el script

echo "ls" | sftp -oport=22  $SFTP_USER@$SFTP_SERVER


#el ls (listado), debe venir despues de hacer el login

echo "FTP SESION COMPLETADA"

#el echo de la sesion completada siemprem manda mensaje, falle o no, deberia mandar solo si fue exitosa la conexion, si no debe enviar otro mensaje.
