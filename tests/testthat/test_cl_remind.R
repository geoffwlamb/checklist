context("cl_remind")

test_that("cl_remind works as expected", {
  cl <- cl_create()
  expect_warning(cl_remind(cl), regexp = NA)
})
