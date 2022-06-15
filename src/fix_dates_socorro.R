#!/usr/bin/env Rscript

library(tidyverse)
source("src/transform_data_header_function.R")

file <- "tests/data_tests/wrong_dates.csv"
input <- read_csv(file)
output <- f(input)
write_csv(output, "tests/data_tests/correct_dates.csv")
