describe(
  "Join tables",
  it("Check table structure", {
    transects_data <- read_csv("../data/conejos_clarion.csv")
    coordinates_data <- read_csv("../data/coordenadas_transectos_conejos_clarion_2018-2021.csv")
    obtained <- join_coordinates_and_transects(transects_data, coordinates_data)
    obtained_columns <- colnames(obtained)
    expected_columns <- c("Id", "Temporada", "Fecha", "Hora_inicio", "Hora_final", "Isla", "Especie", "Fase", "Transecto", "Area_isla", "Cantidad_individuos", "Longitud", "Distancia", "Tipo_de_vegetacion", "Porcentaje_nubosidad", "Velocidad_viento", "Temperatura", "Humedad", "Observaciones")
    expect_equal(obtained_columns, expected_columns)
  })
)
