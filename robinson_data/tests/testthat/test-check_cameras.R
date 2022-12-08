library(tidyverse)
testthat::describe("Check cameras", {
  camera_coordinates_path <- "../data/camera_trap_coordinates.csv"
  it("search cameras in list", {
    camaras_id <- c(12, 10, 20, 11, 39, 13)
    obtained <- search_cameras_in_list(camaras_id, camera_coordinates_path)
    expected <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE)
    expect_equal(obtained, expected)
  })
  it("search cameras in list", {
    raw_bad_data <- read_csv("../data/check_cameras_failing.csv", show_col_types = FALSE)
    expect_error(check_cameras(raw_bad_data, camera_coordinates_path), "🚨 The raw data have cameras not listed in 'camera_trap_coordinates.csv'")
    raw_good_data <- read_csv("../data/check_cameras_passing.csv", show_col_types = FALSE)
    expect_no_error(check_cameras(raw_good_data, camera_coordinates_path))
  })
})
