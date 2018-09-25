context("automatic refiling")

test_that("checklist refiles if private$file was removed", {
  cl <- cl_create()
  file <- cl$.__enclos_env__$private$file

  # remove temp file
  file.remove(file)

  # verify it was removed
  expect_false(file.exists(file))

  # make a change
  expect_warning(cl_add(cl, 1), regexp = NA)
})
