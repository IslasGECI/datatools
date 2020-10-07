#!/usr/bin/env bats

@test "una oración" {
  run cat tests/data_tests/saludo.txt
  [ "$output" = '"hola mundo" adios' ]
}

@test "change header" {
  run cat tests/data_tests/tmp_header_IG_GATOS_10MAY2020.csv
  result="$(./src/change_header tests/data_tests/IG_POSICION_TRAMPAS_10MAY2020.csv)"
  [ "$output" = "$result" ]
}
