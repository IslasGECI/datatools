#!/usr/bin/env bash
#
# Cambia el encabezado del archivo posición trampa para poder hacer el resumen semanal
position_traps_data_file=${1}
sed \
'1s/.*/ID,Coor-X,Coor-Y,Nombre del responsable,Fecha_1,Fecha_2,Fecha_3,Fecha_4,Fecha_5,Fecha_6,Fecha_7/' \
${position_traps_data_file}
