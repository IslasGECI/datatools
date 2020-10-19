#!/usr/bin/env bash
#
# Función que cuenta el esfuerzo o Capturas por día y lo agrupa por zona.
# ./src/get_effort_by_zone [FILE] [ARGUMENTO]
# El argumento puede ser 'Esfuerzo' o 'Capturas'
file_name=${1}
export effort_or_captures=${2}
export table_name=$(basename "${file_name}" .csv)
columns=("Fecha_1" "Fecha_2" "Fecha_3" "Fecha_4" "Fecha_5" "Fecha_6" "Fecha_7")

for date in ${columns[@]}; do
  export fecha="${date}"
  [ "$effort_or_captures" == Esfuerzo ] && export conditional="${date} = 'X' OR ${date} = 'A'"
  [ "$effort_or_captures" == Capturas ] && export conditional="${fecha} = 'X'"

  src_path=$(dirname "${0}")
  query=$(envsubst < ${src_path}/query_effort_or_captures_by_zone.sql)
  csvsql --snifflimit 0 --no-inference --blanks --query "${query}" ${file_name}
done \
| sed  '/Zona/a NA,NA,NA'
