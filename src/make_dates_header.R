#!/usr/bin/env Rscript

library(tidyverse)
library(optparse)
library(reshape2)

source("src/transform_data_header_function.R")

# Sección de la CLI
option_list <- list(
  make_option(
    c("-d", "--data"),
    default = NULL,
    help = "nombre del primer archivo de entrada",
    metavar = "character",
    type = "character"
  )
)
opt_parser <- OptionParser(option_list = option_list)
options <- parse_args(opt_parser)
csv <- options$data
csv_data <- fread(csv, drop = c(1:4))
results <- transform_data_header(csv_data)
cat(format_csv(results))
