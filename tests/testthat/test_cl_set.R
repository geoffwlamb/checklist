context("cl_set")

test_that("known parameters work, unknown parameters throw warnings", {
  cl <- cl_create()

  # conventional case
  expect_warning(cl_set(cl, font.family = "arial"), regexp = NA)
  expect_warning(cl_set(cl, background.color = "black"), regexp = NA)
  expect_warning(cl_set(cl, text.color = "white"), regexp = NA)
  expect_warning(cl_set(cl, complete.color = "yellow"), regexp = NA)
  expect_warning(cl_set(cl, tasks = (1), completed = TRUE), regexp = NA)

  # irregular case
  expect_warning(cl_set(cl, Font.Family = "arial"), regexp = NA)

  # unknown
  expect_warning(cl_set(cl, NOTAPARAMETER = "ISAVALUE"))
})

test_that("setting tasks via cl_set is handled safely", {
  # setting both tasks and completed
  cl <- cl_create()
  expect_warning(cl_set(cl, tasks = c("A", "B"), completed = c(TRUE, FALSE)), regexp = NA)
  expect_error(cl_set(cl, tasks = c("C", "D"), completed = c(TRUE)))

  # setting tasks alone
  cl <- cl_create(tasks = c("A"), completed = c(FALSE))
  expect_warning(cl_set(cl, tasks = c("NEW TASK NAME")), regexp = NA)
  expect_error(cl_set(cl, tasks = c("New1", "New2")))

  # setting completion alone
  cl <- cl_create(tasks = c("A"), completed = c(FALSE))
  expect_warning(cl_set(cl, completed = c(TRUE), regexp = NA))
  expect_error(cl_set(cl, completed = c(TRUE, FALSE)))
})

test_that("file path can't be changed", {
  cl <- cl_create(background.color = "black")
  fp1 <- cl$.__enclos_env__$private$file
  bg1 <- cl$.__enclos_env__$private$background.color

  # try alone
  expect_warning(cl_set(cl, file = "my/new/path.html"), "cannot change file from this function")
  fp2 <- cl$.__enclos_env__$private$file
  expect_identical(fp1, fp2)

  # try with valid change
  expect_warning(cl_set(cl, file = "my/new/path.html", background.color = "white"), "cannot change file from this function")
  fp3 <- cl$.__enclos_env__$private$file
  bg2 <- cl$.__enclos_env__$private$background.color
  expect_identical(fp1, fp3)
  expect_false(identical(bg1, bg2))
})

test_that("expected variable types are preserved", {
  cl <- cl_create()
  expect_warning(cl_set(cl, sound = "BLUE"))
})


