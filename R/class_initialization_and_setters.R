# creation functions
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

# setters
pub_set_title <- function(val) {
  private$title <- val
  private$write()
  private$view()
}
pub_set_sound <- function(val) {
  private$sound <- val
  private$write()
  private$view()
}
pub_set_background_color <- function(val) {
  private$background.color <- val
  private$write()
  private$view()
}
pub_set_text_color <- function(val) {
  private$text.color <- val
  private$write()
  private$view()
}
pub_set_complete_color <- function(val) {
  private$complete.color <- val
  private$write()
  private$view()
}
pub_set_font_family <- function(val) {
  private$font.family <- val
  private$write()
  private$view()
}

