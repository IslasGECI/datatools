library(tidyverse)

file <- "tests/data_tests/correct_dates.csv"
salida <- read_csv(file)
write_csv(salida,"tests/data_tests/correct_dates.csv")

