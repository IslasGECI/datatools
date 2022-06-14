library(data.table)
library(lubridate)

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

transform_date_format <- function(wrong_format_date){
  date <- as.Date(wrong_format_date, "%Y-%m-%d") %>% format("%d/%b/%Y")
  return(date) 
}

