#!/usr/bin/env bats

@test "una oración" {
  run cat tests/data_tests/saludo.txt
  [ "$output" = '"hola mundo" adios' ]
}

@test "change_header" {
  run cat tests/data_tests/tmp_header_IG_GATOS_30AGO2020.csv
  result="$(./src/change_header tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020.csv)"
  [ "$output" = "$result" ]
}

@test "get_effort_or_captures_by_zone Esfuerzo" {
  run cat tests/data_tests/messy_effort_by_zone.csv
  result="$(./src/get_effort_or_captures_by_zone tests/data_tests/tmp_header_IG_GATOS_30AGO2020.csv Esfuerzo)"
  [ "$output" = "$result" ]
}

@test "get_effort_or_captures_by_zone Capturas" {
  run cat tests/data_tests/messy_captures_by_zone.csv
  result="$(./src/get_effort_or_captures_by_zone tests/data_tests/tmp_header_IG_GATOS_30AGO2020.csv Capturas)"
  [ "$output" = "$result" ]
}

@test "remove_rows_with_specific_text" {
  run cat tests/data_tests/cleaned_effort_by_zone.csv
  result="$(./src/remove_rows_with_specific_text tests/data_tests/messy_effort_by_zone.csv)"
  [ "$output" = "$result" ]
}

@test "query_weekly_resume_effort_and_captures" {
  run cat tests/data_tests/weekly_resume_effort_and_captures.csv
  result="$(./src/query_weekly_resume_effort_and_captures tests/data_tests/cleaned_effort_by_zone.csv tests/data_tests/cleaned_captures_by_zone.csv tests/data_tests/tmp_and_real_dates.csv)"
  [ "$output" = "$result" ]
}

@test "get_weekly_resume" {
  run src/get_weekly_resume tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020.csv
  result="$(cat tests/data_tests/resumen_semanal_IG_POSICION_TRAMPAS_30AGO2020.csv)"
  [ "$output" = "$result" ]
}
