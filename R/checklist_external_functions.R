#' Create a Checklist
#' @description This function initializes a checklist option. In the absence of
#'     any customization, it will attempt to pick reasonable defaults. Customization
#'     after initialization is possible using the cl_set function.
#' @param title String containing the name of the checklist.
#' @param tasks Vector containing items to include on the checklist
#' @param completed Boolean vector indicating which items have already been
#'     completed. Defaults to FALSE for each item.
#' @param sound A Boolean determining whether or not sound should be played
#'     upon task completion. Defaults to FALSE (no sound).
#' @param background.color String containing a hex value representing a color
#'     or a recognized named color that determines the background color of
#'     the checklist. Defaults to background color of current RStudio theme.
#' @param text.color String containing a hex value representing a color
#'     or a recognized named color that determines the text color of
#'     the checklist. Defaults to text color of current RStudio theme.
#' @param complete.color String containing a hex value representing a color
#'     or a recognized named color that determines the color of completed items
#'     on the checklist. Defaults to green.
#' @param font.family String containing the font family to use for all text on the
#'     checklist. Defaults to "Georgia, serif".
#' @return A Checklist object
#' @export
#' @examples
#' # create a checklist with default settings
#' my_checklist <- cl_create()
#'
#' # create a customized checklist
#' my_patriotic_checklist <- cl_create(
#'   title = "My Patriotic Checklist",
#'   sound = TRUE,
#'   background.color = "red",
#'   text.color = "white",
#'   complete.color = "blue"
#' )
#'
#' # create a pre-populated checklist
#' my_populated_checklist <- cl_create(
#'   tasks = c("make a checklist", "take over the world"),
#'   completed = c(TRUE, FALSE)
#' )
#'
cl_create <- function(
                      title = "Checklist",
                      tasks = c(),
                      completed = rep(FALSE, length(tasks)),
                      sound = FALSE,
                      background.color = tc_get_bg(),
                      text.color = tc_get_color(),
                      complete.color = "green",
                      font.family = "Georgia, serif") {
  stopifnot(length(tasks) == length(completed))

  Checklist$new(
    title = title,
    tasks = tasks,
    completed = completed,
    sound = sound,
    background.color = background.color,
    text.color = text.color,
    complete.color = complete.color,
    font.family = font.family
  )
}

cl_load <- function(file) {
  # CHANGE private$file
}

cl_save <- function(file) {

}
