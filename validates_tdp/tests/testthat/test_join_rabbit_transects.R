transect_path <- "../data/conejos_clarion.csv"
transects_data <- read_csv(transect_path, show_col_types = FALSE)
describe(
  "Join tables",
  {
    coordinates_path <- "../data/coordenadas_transectos_conejos_clarion_2018-2021.csv"
    coordinates_data <- read_csv(coordinates_path, show_col_types = FALSE)
    obtained <- join_coordinates_and_transects(transects_data, coordinates_data)
    glimpse(obtained)
    glimpse(coordinates_data)
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
    it("Write joined table", {
      output_path <- "../data/joined_table.csv"
      testtools::delete_output_file(output_path)
      id_start <- 678
      write_transect_and_coordinates_table(output_path, id_start, transect_path, coordinates_path)
      expect_true(testtools::exist_output_file(output_path))
    })
    it("Check season column", {
      obtained_season <- obtained$Temporada
      expected_season <- c(2012, 2019, 2021, rep(2022, 12))
      expect_equal(obtained_season, expected_season)
    })
    it("Check transect column", {
      obtained_transect <- obtained$Transecto
      expected_transect <- c(
        "Conejos_01",
        rep("Conejos_03", 2),
        rep("Conejos_04", 2),
        rep("Conejos_05", 3),
        rep("Conejos_04", 2),
        "Conejos_05",
        "Conejos_06",
        rep("Conejos_07", 2),
        "Conejos_11"
      )
      expect_equal(obtained_transect, expected_transect)
    })
  }
)
describe("Assign id", {
  it("assign_id", {
    obtained_ids <- assign_id(transects_data)
    expected_ids <- 1:15
    expect_equal(obtained_ids, expected_ids)
  })
  it("assign_id with starting_id", {
    starting_id <- 7
    obtained_ids <- assign_id(transects_data, starting_id)
    expected_ids <- starting_id:21
    expect_equal(obtained_ids, expected_ids)
  })
})
describe("Rename transectos", {
  it("rename transect", {
    raw_column <- tibble::tibble("Transecto no." = c(1, 3, 5, 12))
    obtained_column <- rename_transects(raw_column)
    expected_column <- c("Conejos_01", "Conejos_03", "Conejos_05", "Conejos_12")
    expect_equal(obtained_column, expected_column)
  })
})
