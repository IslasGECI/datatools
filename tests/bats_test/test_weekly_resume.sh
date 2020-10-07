#!/usr/bin/env bats

@test "una oración" {
  run cat tests/data_tests/saludo.txt
  [ "$output" = '"hola mundo" adios' ]
}

@test "change header" {
  run cat tests/data_tests/tmp_header_IG_GATOS_30AGO2020.csv
  result="$(./src/change_header tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020.csv)"
  [ "$output" = "$result" ]
}
