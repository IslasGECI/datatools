library(data.table)
library(lubridate)
library(stringr)

transform_data_header <- function(csv_data) {
  dates <- names(csv_data)
  tmp_date <- c()
  real_date <- c()
  for (i in 1:length(dates)) {
    tmp_date <- append(tmp_date, paste("Fecha", i, sep = "_"))
    real_date <- append(real_date, dates[i])
  }
  dates_table <- data.frame(
    "tmp_date" = tmp_date,
    "real_date" = real_date
  )
  return(dates_table)
}

transform_date_format <- function(wrong_format_date) {
  date <- as.Date(wrong_format_date, "%Y-%m-%d") %>% format("%d/%b/%Y")
  date <- str_replace(date, "Jan", "Ene")
  date <- str_replace(date, "Apr", "Abr")
  return(date)
}

f <- function(input) {
  file <- "tests/data_tests/wrong_date.csv"
  output <- read_csv(file)
  return(output)
}
