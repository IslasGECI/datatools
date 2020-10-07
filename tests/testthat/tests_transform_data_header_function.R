library(testthat)
setwd("/workspaces/datatools/")
source("src/transform_data_header_function.R")
file_tests <- "tests/data_tests/IG_POSICION_TRAMPAS_30AGO2020.csv"

output_tests <- data.frame(
    "Fecha_tmp" = c(
        "Fecha_1", "Fecha_2", "Fecha_3", "Fecha_4", "Fecha_5", "Fecha_6","Fecha_7"
    ),
    "Fecha_real" = c(
        "24/Ago/2020", "25/Ago/2020", "26/Ago/2020", "27/Ago/2020", "28/Ago/2020", "29/Ago/2020", "30/Ago/2020"
    )
)

test_that("Adquiere fechas desde encabezado de base de datos", {
    expect_equal(transform_data_header(file_tests), output_tests)
})
