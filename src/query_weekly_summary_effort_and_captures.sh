#!/usr/bin/env bash
#
# Query que une las tablas de esfuerzo y captura en una sola. Hace la unión con la tabla de fechas reales.
effort_name_file=${1}
captures_name_file=${2}
real_and_tmp_dates_file=${3}
effort_table=$(basename "${effort_name_file}" .csv)
captures_table=$(basename "${captures_name_file}" .csv)
real_and_tmp_dates_table=$(basename "${real_and_tmp_dates_file}" .csv)
export effort_table
export captures_table
export real_and_tmp_dates_table
src_path=$(dirname "${0}")
query=$(envsubst < "${src_path}"/query_weekly_summary_effort_and_captures.sql)

csvsql --snifflimit 0 --no-inference --blanks --query "${query}" \
  "${effort_name_file}" "${captures_name_file}" "${real_and_tmp_dates_file}"
