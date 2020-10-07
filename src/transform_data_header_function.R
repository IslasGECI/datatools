library(data.table)

transform_data_header <- function(csv){
    csv_file <- fread(csv, drop = c(1:4))
    dates <- names(csv_file)
    tmp_date = c()
    real_date = c()
    for (i in 1:length(dates)){
        tmp_date <- append(tmp_date, paste("Fecha", i, sep = "_"))
        real_date <- append(real_date, dates[i])
    }
    dates_table <- data.frame(
        "Fecha_tmp" = tmp_date,
        "Fecha_real" = real_date
    )
    print(dates_table)
}
