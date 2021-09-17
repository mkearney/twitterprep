stringify_ids <- function(x) {
  ifelse(is.na(x), x, paste0("x", x))
}

prep_data <- function(x, ...) {
  ## column names to keep
  vars <- c(## tweet attributes
    "status_id", "created_at", "source", "lang",
    "reply_to_status_id", "reply_to_user_id",
    #"favorite_count", "retweet_count",
    "text",
    ## user attributes
    "user_id", "account_created_at", "verified", "listed_count",
    "friends_count", "followers_count", "statuses_count", "favourites_count"
  )
  ## select columns
  x <- x[, vars[vars %in% names(x)]]

  ## add label columns
  dots <- load_unroll_dots(list(...))
  for (i in seq_along(dots)) {
    label_name <- names(dots)[i]
    if (label_name %in% names(x)) {
      stop(paste(label_name, "found in dataset"))
    }
    x[[label_name]] <- dots[[i]]
  }

  ## identify numbered ID strings
  id_vars <- grep("_id$", names(x))
  id_vars <- id_vars[vapply(x[, id_vars],
    function(.x) all(grepl("^\\d+$", .x)), logical(1))]

  ## coerce IDs to be strings
  for (i in id_vars) {
    x[[i]] <- stringify_ids(x[[i]])
  }

  ## remove any line breaks
  char_vars <- names(x)[vapply(x, is.character, logical(1))]
  x[char_vars] <- lapply(x[char_vars],
    function(.x) gsub("\\s?[\n\r]+\\s?", " ", .x))

  ## return
  x
}


