library(tidyverse)

are_there_duplicates_by_date_and_file <- function(data) {
  file_and_date <- paste0(data$File, data$DateTime)
  number_duplicates <- sum(duplicated(file_and_date))
  return(number_duplicates > 0)
}

#' @export
check_duplicates <- function(path = "../data/raw/robinson_coati_detection_camera_traps/detection_camera_traps.csv") {
  data <- read_csv(path, show_col_types = FALSE)
  there_is_duplicates <- are_there_duplicates_by_date_and_file(data)
  if (there_is_duplicates) {
    stop("🔴 There are duplicate records")
  }
}
