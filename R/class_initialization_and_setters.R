
pub_init <- function(
                    title = "Checklist",
                    tasks = c(),
                    completed = rep(FALSE, length(tasks)),
                    sound = FALSE,
                    background.color = tc_get_bg(),
                    text.color = tc_get_color(),
                    complete.color = "green",
                    font.family = "Georgia, serif") {
  # initialize vars
  private$title <- title
  private$tasks <- tasks
  private$completed <- completed
  private$sound <- sound
  private$background.color <- background.color
  private$text.color <- text.color
  private$complete.color <- complete.color
  private$font.family <- font.family
  private$file <- tempfile(fileext = ".html")

  # create and view
  private$write()
  private$view()
}

pub_set <- function(...) {
  dots <- list(...)
  names(dots) <- tolower(names(dots))

  # ensure consistency between tasks and completed is always preserved
  if ("tasks" %in% names(dots) & "completed" %in% names(dots)) {
    stopifnot(length(dots[["tasks"]]) == length(dots[["completed"]]))
  }
  else if ("tasks" %in% names(dots)) {
    stopifnot(length(dots[["tasks"]]) == length(private$completed))
  }
  else if ("completed" %in% names(dots)) {
    stopifnot(length(dots[["completed"]]) == length(private$tasks))
  }

  # ensure file isn't changed
  if ("file" %in% names(dots)) {
    warning("cannot change file from this function")
    dots[["file"]] <- NULL
  }

  # ensure sound is logical
  if ("sound" %in% names(dots) & !is.logical(dots[["sound"]])) {
    warning("argument is 'sound', but not valid (I'll show myself out...)")
    dots[["sound"]] <- NULL
  }

  # make changes
  for (i in seq_along(dots)) {
    if (!names(dots)[i] %in% names(private)) {
      warning(paste("ignoring unrecognized parameter:", names(dots)[i]))
      dots[i] <- NULL
    }
    else {
      private[[names(dots)[i]]] <- dots[[i]]
    }
  }
  private$write()
  private$view()
}


