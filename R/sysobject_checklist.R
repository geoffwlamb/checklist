
Checklist <- R6::R6Class(
  classname = "Checklist",
  public = list(
    # special class functions ----
    initialize = pub_init,
    print = function(...) {
      cat("<Checklist> with", length(private$tasks), "task(s)\n")
      private$write()
      private$view()
    },

    # task functions ----
    addTask = pub_add_task,
    editTask = pub_edit_task,
    removeTask = pub_remove_task,
    completeTask = pub_complete_task,
    uncompleteTask = pub_uncomplete_task,

    # misc functions ----
    set = pub_set,
    remind = pub_remind
  ),
  private = list(
    # variables ----
    title = "",
    tasks = c(),
    completed = c(),
    sound = FALSE,
    background.color = "",
    text.color = "",
    complete.color = "",
    font.family = "",
    file = "",

    # functions ----
    write = prv_write,
    view = prv_view
  )
)
