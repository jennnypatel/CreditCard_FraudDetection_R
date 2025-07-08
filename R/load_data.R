library(data.table)

load_creditcard_data <- function(path) {
  data <- fread(path)
  return(data)
}