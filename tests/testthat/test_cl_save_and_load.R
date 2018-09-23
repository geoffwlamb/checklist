context("saving and loading checklists")

test_that("checklist can be saved and reloaded", {
  cl <- cl_create()
  expect_warning(cl_save(cl, "tmpcl.rds"), regexp = NA)
  rm(cl)
  expect_warning(cl_load("tmpcl.rds"), regexp = NA)
  file.remove("tmpcl.rds")
})

test_that("file extensions are handled properly", {
  cl <- cl_create()
  expect_error(cl_save(cl, "cl.html"))
  expect_message(cl_save(cl, "tmpcl"))
  file.remove("tmpcl.rds")
  expect_warning(cl_save(cl, "tmpcl.rds"), regexp = NA)
  file.remove("tmpcl.rds")
})
