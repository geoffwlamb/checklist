context("cl_create")

test_that("cl_create works with expected values for each argument", {
  expect_warning(cl_create(), regexp = NA)
  expect_warning(cl_create(title = "Good Title"), regexp = NA)
  expect_warning(cl_create(tasks = c(1, 2, 3), completed = c(TRUE, TRUE, FALSE)), regexp = NA)
  expect_warning(cl_create(sound = TRUE), regexp = NA)
  expect_warning(cl_create(background.color = "blue"), regexp = NA)
  expect_warning(cl_create(text.color = "white"), regexp = NA)
  expect_warning(cl_create(complete.color = "orange"), regexp = NA)
  expect_warning(cl_create(font.family = "arial"), regexp = NA)
})

test_that("cl_create handles errors properly", {
  expect_error(cl_create(sound = "bad"))
  expect_error(cl_create(tasks = c(1, 2, 3), completed = c(TRUE, FALSE)))
})
