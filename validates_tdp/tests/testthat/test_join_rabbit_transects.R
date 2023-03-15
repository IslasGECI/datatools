describe(
  "Join tables",
  {
    transects_data <- read_csv("../data/conejos_clarion.csv")
    coordinates_data <- read_csv("../data/coordenadas_transectos_conejos_clarion_2018-2021.csv")
    obtained <- join_coordinates_and_transects(transects_data, coordinates_data)
    it("Check table structure", {
      obtained_columns <- colnames(obtained)
      expected_columns <- c(
        "Id",
        "Temporada",
        "Fecha",
        "Hora_inicio",
        "Hora_final",
        "Isla",
        "Especie",
        "Fase",
        "Transecto",
        "Area_isla",
        "Cantidad_individuos",
        "Longitud",
        "Distancia",
        "Tipo_de_vegetacion",
        "Porcentaje_nubosidad",
        "Velocidad_viento",
        "Temperatura",
        "Humedad",
        "Observaciones"
      )
      expect_equal(obtained_columns, expected_columns)
    })
    it("Check season column", {
      obtained_season <- obtained$Temporada
      expected_season <- c(2012, 2019, 2021, rep(2022, 12))
      expect_equal(obtained_season, expected_season)
    })
  }
)

describe("Rename transectos", {
  it("rename transect", {
    raw_column <- tibble::tibble("Transecto no." = c(1, 3, 5, 12))
    obtained_column <- rename_transects(raw_column)
    expected_column <- c("Conejos_01", "Conejos_03", "Conejos_05", "Conejos_12")
    expect_equal(obtained_column, expected_column)
  })
})
