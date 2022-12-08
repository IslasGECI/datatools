library(robinson)

search_cameras_in_list <- function(cameras_id, camera_coordinates_path) {
  cameras_coordinates <- readr::read_csv(camera_coordinates_path, show_col_types = FALSE)
  n_camara <- cameras_coordinates$`N camara`
  cameras_id %in% n_camara
}

check_cameras <- function(camera_coordinates_path = "data/raw/robinson_coati_detection_camera_traps/camera_trap_coordinates.csv", raw_data_path = "data/raw/robinson_coati_detection_camera_traps/detection_camera_traps.csv") {
  raw_data <- read_csv(raw_data_path, show_col_types = FALSE)
  relative_path_column <- raw_data$RelativePath
  cameras_id <- robinson::get_id_camera_from_relative_path(relative_path_column)
  are_there_cameras_not_listed <- any(!search_cameras_in_list(cameras_id, camera_coordinates_path))
  if (are_there_cameras_not_listed) {
    stop("🚨 The raw data have cameras not listed in 'camera_trap_coordinates.csv'")
  }
}
