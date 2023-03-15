#' @import dplyr

#' @export
write_transect_and_coordinates_table <- function(output_path, id_start, transect_path, coordinates_path){
  transects_data <- read_csv(transect_path, show_col_types=FALSE)
  coordinates_data <- read_csv(coordinates_path, show_col_types=FALSE)
  joined_data <- join_coordinates_and_transects(transects_data, coordinates_data, id_start)
  write_csv(joined_data, output_path)
}

join_coordinates_and_transects <- function(transects_data, coordinates_data, id_start = 1) {
  transects_data <- transects_data |>
    mutate(Temporada = as.numeric(substring(Fecha, nchar(Fecha) - 3, nchar(Fecha)))) |>
    mutate(Id = assign_id(transects_data, id_start)) |>
    mutate(Fase = "Conteo/Diagnostico") |>
    mutate(Fecha = transform_date_format(Fecha, "%d/%m/%Y")) |>
    mutate(Transecto = rename_transects(transects_data)) |>
    rename(c(Cantidad_individuos = `# individuos`, Distancia = `Distancia (m)`, Tipo_de_vegetacion = `Tipo de Vegetación`))

  coordinates_data <- coordinates_data |>
    rename(Longitud = Longitud_transecto) |>
    select(-c(Isla, Fecha, Temporada, Observaciones))

  left_join(transects_data, coordinates_data, by = c("Transecto" = "Nombre_transecto"), multiple = "first") |>
    select(c(
      Id,
      Temporada,
      Fecha,
      Hora_inicio,
      Hora_final,
      Isla,
      Especie,
      Fase,
      Transecto,
      Area_isla,
      Cantidad_individuos,
      Longitud,
      Distancia,
      Tipo_de_vegetacion,
      Porcentaje_nubosidad,
      Velocidad_viento,
      Temperatura,
      Humedad,
      Observaciones
    ))
}

rename_transects <- function(transects_data) {
  paste_transect <- function(transect_number) {
    paste0("Conejos_", stringr::str_pad(as.character(transect_number), 2, pad = "0"))
  }
  apply(transects_data["Transecto no."], 2, paste_transect)[, 1]
}

assign_id <- function(transects_data, starting_id = 1) {
  (starting_id):(nrow(transects_data) + starting_id - 1)
}
