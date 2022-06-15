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

fix_date_format_in_column_names <- function(table_with_wrong_column_names) {
  ind_first_date_column <- 5 
  ind_last_date_column <- ncol(table_with_wrong_column_names)
  date_table <- table_with_wrong_column_names[, ind_first_date_column:ind_last_date_column]
  wrong_date_columnames <- colnames(date_table)
  correct_date_columnames <- transform_date_format(wrong_date_columnames)
  colnames(date_table) <- correct_date_columnames
  return(date_table)
}

f <- function(input) {
  column_names <- c("ID", "# Trampa", "Zona", "Responsable", "01/May/2022", "02/May/2022","03/May/2022","04/May/2022","05/May/2022","06/May/2022","07/May/2022")
  colnames(input) <- column_names
  return(input) 
}