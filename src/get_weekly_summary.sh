#!/usr/bin/env bash
#
# Función que corre todas los scripts necesarios para generar el resumen semanal del archivo de 'IG_POSICION_TRAMPAS'
data_file=${1}
path_file=$(dirname "${data_file}")
name_file=$(basename "${data_file}" .csv)
captures_file="${path_file}/captures_${name_file}.csv"
effort_file="${path_file}/effort_${name_file}.csv"
tmp_and_real_dates_file="${path_file}/dates_${name_file}.csv"
weekly_resume="${path_file}/weekly_summary_${name_file}.csv"
data_file_tmp_header="${path_file}/${name_file}_tmp_header.csv"

src/change_header.sh \
  "${data_file}" \
  > "${data_file_tmp_header}"

src/get_effort_or_captures_by_zone.sh \
  "${data_file_tmp_header}" Esfuerzo > tests/data_tests/tmp_file1.csv
src/remove_rows_with_specific_text.sh tests/data_tests/tmp_file1.csv \
  > "${effort_file}"
rm tests/data_tests/tmp_file1.csv

src/get_effort_or_captures_by_zone.sh \
  "${data_file_tmp_header}" Capturas > tests/data_tests/tmp_file2.csv
src/remove_rows_with_specific_text.sh tests/data_tests/tmp_file2.csv \
  > "${captures_file}"
rm tests/data_tests/tmp_file2.csv

src/make_dates_header.R \
  --data "${data_file}" \
  > "${tmp_and_real_dates_file}"

src/query_weekly_summary_effort_and_captures.sh \
  "${effort_file}" \
  "${captures_file}" \
  "${tmp_and_real_dates_file}" \
  > "${weekly_resume}"

rm --force "${tmp_and_real_dates_file}"
rm --force "${captures_file}"
rm --force "${effort_file}"
rm --force "${data_file_tmp_header}"
