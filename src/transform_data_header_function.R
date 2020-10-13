library(data.table)

transform_data_header <- function(csv_data){
    dates <- names(csv_data)
    tmp_date = c()
    real_date = c()
    for (i in 1:length(dates)){
        tmp_date <- append(tmp_date, paste("Fecha", i, sep = "_"))
        real_date <- append(real_date, dates[i])
    }
    dates_table <- data.frame(
        "tmp_date" = tmp_date,
        "real_date" = real_date
    )
    return(dates_table)
}
