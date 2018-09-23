context("cl item functions")

# TODO - individual use cases, error handling
test_that("item functions behave expectedly", {
  cl <- cl_create()
  expect_warning(cl_add(cl, "item 1"), regexp = NA)
  expect_warning(cl_add(cl, "item 2"), regexp = NA)
  expect_warning(cl_add(cl, "item 3"), regexp = NA)
  expect_warning(cl_edit(cl, 2, "update item 2"), regexp = NA)
  expect_warning(cl_complete(cl, 2), regexp = NA)
  expect_warning(cl_uncomplete(cl, 2), regexp = NA)
  expect_warning(cl_remove(cl, 2), regexp = NA)
})
