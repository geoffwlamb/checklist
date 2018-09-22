
prv_write = function() {
  cl_title <- html_title(private$title)
  cl_progress <- html_progress(
    sum(private$completed),
    length(private$tasks)
  )
  cl_body <- {
    if (length(private$tasks) == 0) {
      htmltools::tags$p("no tasks added")
    }
    else {
      cl_list = list()
      for (i in seq_along(private$tasks)) {
        cl_list[[i]] <- html_task(
          private$tasks[i],
          private$completed[i]
        )
      }
      htmltools::tagList(cl_list)
    }
  }
  cl_html <- html_compile(
    style = html_style(
      body_css = css_body(
        background.color = private$background.color,
        color = private$text.color,
        font.family = private$font.family
      ),
      complete_css = css_complete(
        color = private$complete.color
      ),
      progress_value_css = css_progress_value(
        background.color = private$complete.color
      )
    ),
    title = cl_title,
    progress = cl_progress,
    body = cl_body
  )
  writeLines(cl_html, private$file)
}

prv_view <- function() {
  viewer <- getOption("viewer")
  rstudioapi::viewer(private$file)
}
