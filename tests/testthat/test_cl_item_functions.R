context("cl item functions")

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

test_that("item functions can handle vectors", {
  cl <- cl_create()
  expect_warning(cl_add(cl, c("i1", "i2", "i3")), regexp = NA)
  expect_warning(cl_edit(cl, 2:3, c("j1", "j2")), regexp = NA)
  expect_warning(cl_complete(cl, 2:3), regexp = NA)
  expect_warning(cl_uncomplete(cl, 2:3), regexp = NA)
  expect_warning(cl_remove(cl, 2:3), regexp = NA)
})

test_that("at_item argument works with non-sequential vectors", {
  cl <- cl_create()
  cl_add(cl, c("i1", "i2", "i3"))
  expect_warning(cl_edit(cl, c(1, 3), c("j1", "j3")), regexp = NA)
  expect_warning(cl_complete(cl, c(1, 3)), regexp = NA)
  expect_warning(cl_uncomplete(cl, c(1, 3)), regexp = NA)
  expect_warning(cl_remove(cl, c(1, 3)), regexp = NA)
})

test_that("at_item argument works with out-of-order vectors", {
  cl <- cl_create()
  cl_add(cl, c("i1", "i2", "i3"))
  expect_warning(cl_edit(cl, c(3, 1), c("j1", "j3")), regexp = NA)
  expect_warning(cl_complete(cl, c(3, 1)), regexp = NA)
  expect_warning(cl_uncomplete(cl, c(3, 1)), regexp = NA)
  expect_warning(cl_remove(cl, c(3, 2, 1)), regexp = NA)
})

test_that("warnings are thrown when trying to (un)complete an already (un)completed task", {
  cl <- cl_create()
  cl_add(cl, c("i1", "i2", "i3"))
  cl_complete(cl, c(1, 3))
  expect_warning(cl_uncomplete(cl, 1:3))
  cl_complete(cl, c(1, 3))
  expect_warning(cl_complete(cl, 1:3))
})

test_that("cl_edit doesn't make changes unless at_items is valid", {
  cl1 <- cl_create(tasks = c(1, 2, 3))
  cl2 <- cl_create(tasks = c(1, 2, 3))
  expect_error(cl_edit(cl1, c(2, 2), c("h1", "h2")))
  expect_identical(cl1$.__enclos_env__$private$tasks, cl2$.__enclos_env__$private$tasks)
  expect_error(cl_edit(cl1, c(1.8, 2.2), c("h1", "h2")))
  expect_identical(cl1$.__enclos_env__$private$tasks, cl2$.__enclos_env__$private$tasks)
  expect_error(cl_edit(cl1, c(0, 2.2), c("h1", "h2")))
  expect_identical(cl1$.__enclos_env__$private$tasks, cl2$.__enclos_env__$private$tasks)
})
