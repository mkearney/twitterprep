
#' Prep and save
#'
#' @param x Input dataset returned by rtweet
#' @param save_as Name used to save the file. It will be appended with the
#'   numeric range of contained datetimes.
#' @param ... Named dots along with their coded value are used to add labels
#'   to the dataset prior to writing.
#'
#' @return
#' @export
#'
#' @examples
#' ## generate example data frame
#' tweetdata <- data.frame(status_id = c("3459023", "0891370"), text = c("twitter tweet text", "another tweet text"))
#'
#' ## label and save dataset
#' prep_and_write(tweetdata, "/tmp/tweetdata", test = TRUE)
prep_and_write <- function(x, save_as, ...) {
  if (!is.data.frame(x) || NROW(x) == 0) {
    return(invisible(FALSE))
  }
  write_data(prep_data(x, ...), save_as = save_as)
  invisible(TRUE)
}
