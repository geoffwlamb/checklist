pub_remind <- function() {
  # create reminder file
  title_name <- gsub(" ", "_", private$title)
  file <- here::here(
    paste(toupper(title_name), "REMINDER.txt", sep = "_")
  )
  file.create(file)

  # add text and open
  writeLines(
    con = file,
    text = {
      "This file is a reminder to review the checklist you created (especially before committing to git)."
    }
  )
  file.edit(file)
}

pub_refile <- function() {
  private$file <- tempfile(fileext = ".html")
  private$write()
  private$view()
}
