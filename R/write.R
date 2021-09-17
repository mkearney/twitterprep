write_data <- function(x, save_as) {
  stopifnot(is.character(save_as))
  if (NROW(x) == 0) {
    return(invisible(FALSE))
  }
  save_as <- sub("\\.csv$", "", save_as)
  t1 <- as.integer(x[["created_at"]][1])
  t2 <- as.integer(x[["created_at"]][NROW(x)])
  save_as <- paste0(save_as, "-", t1, "-", t2, ".csv")
  utils::write.csv(x, save_as, row.names = FALSE, fileEncoding = "UTF-8")
  invisible(TRUE)
}
