#' @export
Checklist <- R6::R6Class(
  classname = "Checklist",
  public = list(
    # special class functions
    initialize = pub_init,
    print = function(...) {
      cat("<Checklist> with", length(private$tasks), "task(s)\n")
      private$view()
    },

    # setters
    setTitle = pub_set_title,
    setSound = pub_set_sound,
    setBackgroundColor = pub_set_background_color,
    setTextColor = pub_set_text_color,
    setCompleteColor = pub_set_complete_color,
    setFontFamily = pub_set_font_family,

    # task functions
    addTask = pub_add_task,
    editTask = pub_edit_task,
    removeTask = pub_remove_task,
    completeTask = pub_complete_task,
    uncompleteTask = pub_uncomplete_task,

    # misc functions
    remind = pub_remind
  ),
  private = list(
    # variables
    title = "",
    tasks = c(),
    completed = c(),
    sound = FALSE,
    background.color = "",
    text.color = "",
    complete.color = "",
    font.family = "",
    file = "",

    # functions
    write = prv_write,
    view = prv_view
  )
)
