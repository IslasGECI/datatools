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

@test "get_captures_by_zone" {
  run cat tests/data_tests/captures_by_zone.csv
  result="$(./src/get_captures_by_zone tests/data_tests/tmp_header_IG_GATOS_30AGO2020.csv)"
  [ "$output" = "$result" ]
}
