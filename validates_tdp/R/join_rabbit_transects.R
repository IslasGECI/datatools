#' @import dplyr

join_coordinates_and_transects <- function(transects_data, coordinates_data) {
  tibble::tibble(
    Id = 0,
    Temporada = as.numeric(substring(transects_data$Fecha, nchar(transects_data$Fecha) - 3, nchar(transects_data$Fecha))),
    Fecha = 0,
    Hora_inicio = 0,
    Hora_final = 0,
    Isla = 0,
    Especie = 0,
    Fase = 0,
    Transecto = 0,
    Area_isla = 0,
    Cantidad_individuos = 0,
    Longitud = 0,
    Distancia = 0,
    Tipo_de_vegetacion = 0,
    Porcentaje_nubosidad = 0,
    Velocidad_viento = 0,
    Temperatura = 0,
    Humedad = 0,
    Observaciones = 0
  )
}

rename_transects <- function(transects_data) {
  paste_transect <- function(transect_number) {
    paste0("Conejos_", stringr::str_pad(as.character(transect_number), 2, pad = "0"))
  }
  apply(transects_data["Transecto no."], 2, paste_transect)[, 1]
}
