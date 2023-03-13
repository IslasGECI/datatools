

join_coordinates_and_transects <- function(transects_data, coordinates_data) {
  tibble::tibble(
    Id = 0,
    Temporada = 0,
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
