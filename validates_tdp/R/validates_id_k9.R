#' @import readr

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

#' @export
check_traces <- function(k9_traces_path = "data/esfuerzos_k9_gatos_guadalupe/registros_rastros_de_gatos_k9_guadalupe.csv") {
  data_traces <- read_csv(k9_traces_path, show_col_types = FALSE)
  check_trace_from_id(data_traces)
}
