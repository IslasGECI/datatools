#' @import robinson

search_cameras_in_list <- function(cameras_id) {
  cameras_coordinates <- read_csv("../data/camera_trap_coordinates.csv", show_col_types = FALSE)
  n_camara <- cameras_coordinates$`N camara`
  cameras_id %in% n_camara
}

check_cameras <- function(raw_data) {
  stop("🚨 The raw data have cameras not listed in 'camera_trap_coordinates.csv'")
}
