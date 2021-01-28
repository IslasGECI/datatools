#!/usr/bin/env bats

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

@test "query_weekly_summary_effort_and_captures" {
  run cat tests/data_tests/weekly_summary_effort_and_captures.csv
  result="$(./src/query_weekly_summary_effort_and_captures tests/data_tests/cleaned_effort_by_zone.csv tests/data_tests/cleaned_captures_by_zone.csv tests/data_tests/tmp_and_real_dates.csv)"
  [ "$output" = "$result" ]
}

@test "get_weekly_summary" {
  src/get_weekly_summary tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020.csv
  result="$(diff \
    tests/data_tests/resumen_semanal_30AGO2020.csv \
    tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020.csv | wc --lines)"
  [ "$result" -eq 0 ]
}

@test "get_weekly_resume_without_captures" {
  src/get_weekly_summary tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv
  result="$(diff \
    tests/data_tests/resumen_semanal_30AGO2020_sin_capturas.csv \
    tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv | wc --lines)"
  [ "$result" -eq 0 ]
}

@test "pivot_table" {
  run ./src/pivot_table tests/data_tests/input_pivot_table.csv
  result="$(cat tests/data_tests/output_pivot_table.csv)"
  [ "$output" = "$result" ]
}
