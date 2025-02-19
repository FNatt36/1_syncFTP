#!/bin/bash

# Define la contraseña como una variable de entorno
export SFTP_PASS="Camusgaladonna36!"

# Reemplaza la contraseña en el script original usando sed
sed -i "s/SFTP_PASS=.*/SFTP_PASS=\"$SFTP_PASS\"/" ./5_sftpLogLocRem..sh

# Ejecuta el script original
./5_sftpLogLocRem.sh