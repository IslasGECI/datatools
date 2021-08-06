#!/usr/bin/env bash
#
# Elimina todas las líneas (menos la primera) del archivo que salieron como encabezado 'Fecha,Zona,Esfuerzo'
file_name=${1}
sed --expression '1!{/Zona/d}' "${file_name}"
