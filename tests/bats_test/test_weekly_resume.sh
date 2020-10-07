#!/usr/bin/env bats

@test "una oración" {
  run cat tests/data_tests/saludo.txt
  [ "$output" = "hola mundo adios" ]
}
