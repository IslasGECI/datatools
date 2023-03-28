#!/usr/bin/env Rscript

library(tidyverse)
library(optparse)
library(validate.tdp)

# Sección de la CLI
option_list <- list(
  make_option(
    c("-d", "--data"),
    default = "tests/data_tests/wrong_dates.csv",
    help = "nombre del primer archivo de entrada",
    metavar = "character",
    type = "character"
  )
)
opt_parser <- OptionParser(option_list = option_list)
options <- parse_args(opt_parser)
file <- options$data
input <- read_csv(file)
output <- fix_date_format_in_column_names(input)
cat(format_csv(output))
