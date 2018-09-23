pub_add_task <- function(task) {
  private$tasks <- c(private$tasks, task)
  private$completed <- c(private$completed, FALSE)
  private$write()
  private$view()
}

pub_edit_task <- function(num, task) {
  # error handling
  if (length(private$tasks) < num) {
    stop("task does not exist")
  }
  if (private$completed[[num]] == TRUE) {
    stop("please remove completion status or add a new task instead")
  }

  # make change
  private$tasks[[num]] <- task

  # write and view
  private$write()
  private$view()
}


pub_remove_task <- function(num) {
  # error handling
  if (!is.numeric(num)) {
    stop("please supply a number")
  }
  if (length(private$tasks) < num) {
    stop("task does not exist")
  }
  if (private$completed[[num]] == TRUE) {
    stop("please remove completion status or add a new task instead")
  }
  if (num < 1) {
    stop("please supply an index between 1 and the length of the checklist")
  }

  # make changes
  private$tasks <- private$tasks[-num]
  private$completed <- private$completed[-num]

  # write and view
  private$write()
  private$view()
}

pub_complete_task <- function(num) {
  # error handling
  if (length(private$completed) < num) {
    stop("task does not exist")
  }
  if (private$completed[[num]] == TRUE) {
    stop("task already completed")
  }

  # make change
  private$completed[[num]] <- TRUE

  # write and view
  private$write()
  private$view()

  # play completion noise if applicable
  if (sum(private$completed) == length(private$completed)) {
    if (private$sound) beepr::beep(4)
  }
  else {
    if (private$sound) beepr::beep(2)
  }
}

pub_uncomplete_task <- function(num) {
  # error handling
  if (length(private$completed) < num) {
    stop("task does not exist")
  }
  if (private$completed[[num]] == FALSE) {
    stop("task is not completed")
  }

  # make change
  private$completed[[num]] <- FALSE

  # refresh and view
  private$write()
  private$view()
}
