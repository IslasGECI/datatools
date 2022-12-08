library(robinson)

search_cameras_in_list <- function(cameras_id) {
  cameras_coordinates <- readr::read_csv("../data/camera_trap_coordinates.csv", show_col_types = FALSE)
  n_camara <- cameras_coordinates$`N camara`
  cameras_id %in% n_camara
}

check_cameras <- function(raw_data) {
  relative_path_column <- raw_data$RelativePath
  cameras_id <- robinson::get_id_camera_from_relative_path(relative_path_column)
  are_there_cameras_not_listed <- any(!search_cameras_in_list(cameras_id))
  if(are_there_cameras_not_listed) {
    stop("🚨 The raw data have cameras not listed in 'camera_trap_coordinates.csv'")
  }
}
