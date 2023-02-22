split_id <- function(id_punto) {
  if (is.na(id_punto)) {
    return(rep(NA, 4))
  }
  stringr::str_split(id_punto, "-")[[1]]
}

check_trace_from_id <- function(dataframe) {
  splited_ids <- sapply(dataframe$ID_punto, split_id, simplify = FALSE, USE.NAMES = FALSE)
  trace_from_id <- sapply(splited_ids, `[[`, 4)
  traces <- dataframe$Tipo_de_rastro
  are_not_identical <- !identical(trace_from_id, traces)
  if (are_not_identical) {
    rows <- glue::glue_collapse(which(trace_from_id != traces), ", ", last = " and ")
    stop(glue::glue("🚨 Rows {rows} have different traces"))
  }
}
