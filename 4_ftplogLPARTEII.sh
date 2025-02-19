#!/bin/bash
# Programa para crear un log Local en la direccion deseada 

LOG_LOCAL="logL.txt"
CSYNC=/home/$(whoami)/carpetaSincronizada

if [ ! -d "$CSYNC" ]; then
mkdir -p "$CSYNC"
#echo Carpeta creada! "Carpeta Creada!: $CSYNC"
fi

ls $CSYNC > $LOG_LOCAL