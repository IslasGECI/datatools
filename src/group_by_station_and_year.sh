#!/usr/bin/env bash
#
# Función que separa la tabla de estaciones meteorológicas de IG por estación y por año
for station in Norte Pista Sur Bosque; do
  for year in {2008..2020}; do
    data_file=${1}
    table_name=$(basename "${data_file}" .csv)
    csvsql --snifflimit 0 --no-inference --blanks --query "
      SELECT *
      FROM ${table_name}
      WHERE Estacion = '${station}' AND
      Date LIKE '%${year}'
    " "${table_name}".csv > estacion_meteorologica_"${station}"_IG_"${year}".csv
  done
done
./remove_empty_files
