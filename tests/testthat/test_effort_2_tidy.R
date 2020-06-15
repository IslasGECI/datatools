source("../../src/effort_2_tidy.R")
salida_test <- data.frame(
    ID = rep(c('TC-20-1084', 'TC-10-0980-MV'),each = 7),
    estado = c('A', 'A', 'X', 'A', 'A', 'A', 'A', 'X', 'A', 'A', 'A', 'A', 'D', 'D'), 
    fecha = rep(c('4/27/2020', '4/28/2020', '4/29/2020', '4/30/2020', '5/1/2020','5/2/2020','5/3/2020'), 2)
)
archivo_prueba <- '../data_tests/esfuerzo_data_tests.csv'
datos_prueba <- readr::read_csv(archivo_prueba)
test_that("Cambia las palabras a otras cambiando el número de sus letras", {
    expect_equal(effort_2_tidy(datos_prueba), salida_test)
})