
html_task <- function(task, completed = FALSE) {
  if (completed) {
    task <- htmltools::HTML(paste('&#10004', task, '<br'))
    htmltools::p(class = "complete", task)
  }
  else {
    task <- htmltools::HTML(paste('&#10063', task, '<br>'))
    htmltools::p(task)
  }
}

html_title <- function(title = "Checklist") {
  htmltools::h1(class = "title", title)
}

html_progress <- function(comp_tasks = 0, tot_tasks = 0) {
  if (comp_tasks > tot_tasks) {
    comp_tasks <- tot_tasks
  }
  pct <- 100 * (comp_tasks / tot_tasks)
  htmltools::div(
    class = "progress",
    datalabel = paste(comp_tasks, "/", tot_tasks, "tasks complete"),
    htmltools::span(
      class = "value",
      style = paste(
        "width:",
        max(0, round(pct, 2), na.rm = TRUE),
        "%",
        sep = ""
      )
    )
  )
}

html_style <- function(
                        body_css = css_body(),
                        title_css = css_title(),
                        complete_css = css_complete(),
                        progress_css = css_progress(),
                        progress_before_css = css_progress_before(),
                        progress_value_css = css_progress_value()) {
  htmltools::tagList(
    htmltools::tags$meta(charset = "UTF-8"),
    htmltools::tags$style(
      paste('body', '{', body_css, '}'),
      paste('h1.title', '{', title_css, '}'),
      paste('p.complete', '{', complete_css, '}'),
      paste('.progress', '{', progress_css,'}'),
      paste('.progress:before', '{', progress_before_css,'}'),
      paste('.progress .value', '{', progress_value_css,'}')
    )
  )
}

html_compile <- function(
                          style = html_style(),
                          title = html_title(),
                          progress = html_progress(),
                          body = htmltools::p("no tasks added")) {
  as.character(htmltools::tagList(style, title, progress, body))
}
