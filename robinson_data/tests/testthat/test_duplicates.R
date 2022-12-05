library(tidyverse)

describe("Check duplicated rows", {
  data_with_duplicates <- read_csv("../data/check_duplicates.csv", show_col_types = FALSE)
  path_data_without_duplicates <- "../data/data_without_duplicates.csv"
  data_without_duplicates <- read_csv(path_data_without_duplicates, show_col_types = FALSE)
  it("Duplicated by date and file", {
    obtained <- are_there_duplicates_by_date_and_file(data_with_duplicates)
    expect_true(obtained)
  })
  it("Check duplicate gives an error", {
    path_data_with_duplicates <- "../data/check_duplicates.csv"
    expect_error(check_duplicates(path_data_with_duplicates), "🔴 There are duplicate records")
  })
  it("Check duplicate pass", {
    expect_no_error(check_duplicates(path_data_without_duplicates))
  })
})
