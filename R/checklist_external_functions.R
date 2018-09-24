# create/load/save ----

#' Create a Checklist
#' @description This function initializes a checklist option. In the
#'     absence of any customization, it will attempt to pick reasonable
#'     defaults. Customization after initialization is possible using
#'     the cl_set function.
#' @param title String containing the name of the checklist.
#' @param tasks Vector containing items to include on the checklist
#' @param completed Boolean vector indicating which items have already been
#'     completed. Defaults to FALSE for each item.
#' @param sound A Boolean determining whether or not sound should be played
#'     upon task completion. Defaults to FALSE (no sound).
#' @param background.color String containing a hex value representing
#'     a color or a recognized named color that determines the
#'     background color of the checklist. Defaults to background color
#'     of current RStudio theme.
#' @param text.color String containing a hex value representing a color
#'     or a recognized named color that determines the text color of
#'     the checklist. Defaults to text color of current RStudio theme.
#' @param complete.color String containing a hex value representing a color
#'     or a recognized named color that determines the color of completed
#'     items on the checklist. Defaults to green.
#' @param font.family String containing the font family to use for
#'     all text on the checklist. Defaults to "Georgia, serif".
#' @param remind A logical indicating if a reminder file should be created
#'     with the checklist. Mostly useful if using a checklist for
#'     working on a git commit.
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
#' # create a checklist with a reminder file
#' checklist_with_reminder <- cl_create(remind = TRUE)
#'
cl_create <- function(
                      title = "Checklist",
                      tasks = c(),
                      completed = rep(FALSE, length(tasks)),
                      sound = FALSE,
                      background.color = tc_get_bg(),
                      text.color = tc_get_color(),
                      complete.color = "green",
                      font.family = "Georgia, serif",
                      remind = FALSE) {
  stopifnot(
    length(tasks) == length(completed),
    is.logical(sound)
  )

  cl <- Checklist$new(
    title = title,
    tasks = tasks,
    completed = completed,
    sound = sound,
    background.color = background.color,
    text.color = text.color,
    complete.color = complete.color,
    font.family = font.family
  )

  if (remind) {
    cl$remind()
  }

  cl
}

#' Load a Saved Checlist
#' @description This function loads a previously made checklist that was
#'     saved (as an .rds file). This is the recommended approach to
#'     loading checklists, as it will handle the creation and writing
#'     of a new file for the loaded checklist.
#' @param file A String containing the file path of the checklist.
#'     Needs to be an .rds file
#' @return A checklist object
#' @export
#' @examples
#' # create a checklist
#' my_checklist <- cl_create()
#'
#' # save it
#' cl_save(my_checklist, "my_checklist.rds")
#'
#' # remove it from workspace
#' rm(cl)
#'
#' # load it back in
#' cl <- cl_load("my_checklist.rds")
#'
cl_load <- function(file) {
  cl <- readRDS(file)
  cl$refile()
  cl
}

#' Save a Checklist Object
#' @description This function allows you to save your checklist to a more
#'     permanent place than R's temp directory. It will check to make sure
#'     the supplied filename ends with .rds (or append .rds if no extension)
#'     is detected, but is oterwise just a wrapper for saveRDS.
#' @param cl A Checklist object to save
#' @param file A String containing the file path of the checklist.
#'     Needs to be an .rds file.
#' @export
#' @examples
#' # create a checklist
#' my_checklist <- cl_create()
#'
#' # save it
#' cl_save(my_checklist, "my_checklist.rds")
#'
#' # remove it from workspace
#' rm(cl)
#'
#' # load it back in
#' cl <- cl_load("my_checklist.rds")
#'
cl_save <- function(cl, file) {
  if (!grepl("\\.rds$", file, ignore.case = TRUE) & grepl("\\.", file)) {
    stop("Unsupported file extension. Please use .rds instead.")
  }
  else if (!grepl("\\.", file)) {
    message("No file extension detected. Appending '.rds' and saving...")
    file <- paste(file, ".rds", sep = "")
  }
  saveRDS(cl, file)
}

#' Create a Reminder File for a Checklist
#' @description This function creates a .txt file that will attempt to
#'     show up in your project/working directory, as well as the
#'     editor in RStudio. The primary inspiration for this function was
#'     to provide an added file that would show up in a git diff to
#'     prevent commits prior to completing all expected work.
#' @param cl A checklist object
#' @export
#' @examples
#' # remind at the time of creation
#' my_reminding_checklist <- cl_create(remind = TRUE)
#'
#' # or make the file afterwards
#' my_basic_checklist <- cl_create()
#' cl_remind(my_basic_checklist)
#'
cl_remind <- function(cl) {
  cl$remind()
}

# checklist customization ----

#' Change Elements of a Checklist
#' @description This function allows you to cutsomize a checklist you've
#'     created.
#' @param cl A checklist object
#' @param ... Elements of checklist to update. See Details for available
#'     options. Unknown arguments will throw warnings, but recognized
#'     arguments in the same call will still be processed.
#' @export
#' @details Currently supported values that can be changed:
#'     \itemize{
#'      \item{title: }{New title for checklist}
#'      \item{tasks: }{New items for checklist. Overwrites any existing items. Must have consistent length with completed when updating.}
#'      \item{completed: }{New completed statuses for checklist. Overwrites any existing statuses. Must have consistent length with tasks when updating.}
#'      \item{sound: }{Logical for whether or not to make noise upon completion}
#'      \item{background.color: }{String with color value}
#'      \item{text.color: }{String with color value}
#'      \item{completed.color: }{String with color value}
#'      \item{font.family: }{String with font family (basic HTML only)}
#'     }
#'     title
#'     tasks
#'     completed
#'     sound
#'     background.color
#'     text.color
#'     completed.color
#'     font.family:
#' @examples
#' # create a checlist
#' cl <- cl_create()
#'
#' # change some style options
#' cl_set(cl, background.color = "blue", text.color = "white")
#'
#' # add mutliple items (make sure to also update completed)
#' cl_set(cl, tasks = c(1,2,3), completed = c(TRUE, FALSE, FALSE))
#'
#' # change items (notice that the tasks argument overwrites
#' # all items that are currently on the checklist)
#' cl_set(cl, tasks = c("item 1", "item 2"), completed = rep(FALSE, 2))
#'
cl_set <- function(cl, ...) {
  cl$set(...)
}

#' Blend Checklist Colors with RStudio Theme
#' @description This function is provided to help blend a checklist in
#'     with the RStudio environment in cases where the color scheme was
#'     changed or a new theme was selected in RStudio.
#' @param cl A checklist object
#' @export
#' @examples
#' # start with a basic checklist
#' my_checklist <- cl_create()
#'
#' # change background color to orange
#' cl_set(my_checklist, background.color = "orange")
#'
#' # blend it back to RStudio theme
#' cl_blend(my_checklist)
#'
cl_blend <- function(cl) {
  cl$set(background.color = tc_get_bg(), text.color = tc_get_color())
}

# tasks ----

#' Checklist Item Functions
#' @name item-functions
#' @rdname item-functions
#' @description This series of functions allows you to manipulate items
#'     in a checklist more intuitively and conveniently than using cl_set.
#'     They are designed to focus on manipulating a single task at a time.
#'     If you need to manipultate several items at once, consider using
#'     cl_set with a character vector as the 'tasks' argument and a
#'     logical vector as the 'completed' argument
#' @param cl A checklist object
#' @param text A String or character vector containing text to add
#'     or edit
#' @param at_items An Integer or Integer vector dectermining where
#'     to edit, complete, uncomplete, or remove items
#' @examples
#' # create a checklist
#' cl <- cl_create()
#'
#' # add a few items
#' cl_add(cl, "item 1")
#' cl_add(cl, "item 2")
#' cl_add(cl, "item 3")
#'
#' # edit the second item
#' cl_edit(cl, 2, "update item 2")
#'
#' # complete the second item
#' cl_complete(cl, 2)
#'
#' # uncomplete the second item
#' cl_uncomplete(cl, 2)
#'
#' # remove the second item
#' cl_remove(cl, 2)
#'
NULL

#' @rdname item-functions
#' @export
#'
cl_add <- function(cl, text) {
  stopifnot(inherits(cl, "Checklist"))

  for (i in text) {
    cl$addTask(i)
  }
}

#' @rdname item-functions
#' @export
#'
cl_edit <- function(cl, at_items, text) {
  stopifnot(
    inherits(cl, "Checklist"),
    is.numeric(at_items),
    length(at_items) > 0,
    length(text) > 0,
    length(at_items) == length(text)
  )
  at_items <- sort(unique(round(at_items)))
  if (length(at_items) != length(text)) {
    stop("Could not use the supplied vector for at_items. Please ensure that vector contains a unique set of integers.")
  }
  for (i in seq_along(at_items)) {
    cl$editTask(at_items[i], text[i])
  }

}

#' @rdname item-functions
#' @export
#'
cl_complete <- function(cl, at_items) {
  stopifnot(
    inherits(cl, "Checklist"),
    is.numeric(at_items)
  )
  at_items <- sort(unique(round(at_items)))
  for (i in at_items) {
    cl$completeTask(i)
  }
}

#' @rdname item-functions
#' @export
#'
cl_uncomplete <- function(cl, at_items) {
  stopifnot(
    inherits(cl, "Checklist"),
    is.numeric(at_items)
  )
  at_items <- sort(unique(round(at_items)))
  for (i in at_items) {
    cl$uncompleteTask(i)
  }

}

#' @rdname item-functions
#' @export
#'
cl_remove <- function(cl, at_items) {
  stopifnot(
    inherits(cl, "Checklist"),
    is.numeric(at_items),
    min(at_items) >= 1
  )
  at_items <- sort(unique(round(at_items)))
  for (i in seq_along(at_items)) {
    cl$removeTask(at_items[i])
    at_items <- at_items - 1
  }
}

