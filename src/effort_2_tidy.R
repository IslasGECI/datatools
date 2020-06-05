#!/usr/bin/env Rscript
#
# 
library(tidyverse)

effort_2_tidy <- function(datos_prueba){
filter_table <- datos_prueba %>% select(c(2, 6:12))
result <- data.frame()
ncolumns <- length(filter_table)
for (i in ncolumns:2){
  cats <- which(filter_table[i] == "X")
  if (length(cats) == 1){
    if (length(result) == 0){
      result <- cbind(filter_table[cats, 1], filter_table[cats, 2], names(filter_table[2]))
      j <- 3
    }else{
      j <- 2  
    }
    for (i in j:ncolumns){
      captures <- cbind(filter_table[cats, 1], filter_table[cats, i], names(filter_table[i]))
      names(result) <- names(captures) 
      result <- rbind(result, captures)
    }
  }
}
names(result) <- c("ID", "estado", "fecha")
for (i in 1:3){
result[i] <- as.factor(result[, i])
}
return(result)
}