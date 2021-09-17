has_names <- function(x) {
  !is.null(names(x)) && !all(names(x) == "")
}
load_unroll_dots <- function(dots) {
  ## if a named list is passed to a function expecting dots, then figure it
  ## out and pass along the named list as tho it were a list of captured dots
  if (length(dots) == 1 && is.list(dots[[1]]) && has_names(dots[[i]])) {
    dots <- dots[[1]]
  }
  dots
}
